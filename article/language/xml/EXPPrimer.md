此文档原文资料在https://www.w3.org/XML/EXI/查看

[TOC]

# 2 概念
## 2.1 EXI streams

EXi将一个XML的文档的内容表述为一个EXI流，如下所示，EXI流包含一个EXI头及紧挨着的EXI体。

| EXI Header | EXI Body |
| ------------- |:-------------:|


EXI头部传递**格式的版本**及用于**编码的可选选项集合**。如果这些选项被省略，意味着解码器通过带外(out of band/OOB)进行访问。EXI体包含一个事件序列描述这个别编码的文档(或文档片段)，下面两节进一步描述了EXI头和EXI体
### 2.1.1 EXI头
EXI头部用于传达解码EXI体的所用的编码属性。最小的协议头描述可以放在一个字节内，这可以将花销及复杂性保持在最低水平又不牺牲紧凑性。尤其对于小文档头部可以引入一个大的常量因子

    表 2-2 EXI Header Structer
| [EXI Cookie] |	Distinguishing Bits |	Presence Bit for EXI Options	| EXI Format Version |	[EXI Options] |	[Padding Bits] |
| ------------- |:-------------:|

EXI头以一个可选的4字节 ** EXI Cookie ** 开始。这四个字节域按照顺序包含4个字符** "$","E","X","I" ** ，每个都是一个ASCII字节，其用于在大量的数据流中区分一个EXI流。

紧跟着EXI Cookie是一对** Distinguishing Bits ** .这两个bit序列(1 0)可以用来区别一个EXI文档及文本XML文档，并且足够从基于大量字符编码的XLM流中区分EXI流

紧随distinguishing bit之后的是** Presence Bit ** ,此选项是可选的，单一的一个bit位表示之后是否有可选项

EXI格式版本标识EXI在使用的版本，以便将来的提高和修改。一个前导0表示这个文档根据建议的最后版本编码，而前导1表示则是一个预览版。这个差异化的引入促进了于早前预览版本的不严格的交互需求。最有最终版本需要被兼容处理器处理。紧接着前导位是1个或多个4bit的序列，这些序列共同的表示一个从1开始的格式版本号。例如，4bit序列0000表示版本1，2个4bit序列1111 0001表示15+2或版本17

EXI Options 说明EXI流body部分是如何编码。如前所诉，这些选项有前面的presence bit控制。EXI选项引入的开销是比较小的，他们是用XML schema描述，也可以用EXI编码。下面的描述的EXI选项可以在EXI头部制定。当EXI选项文档没有为一个特定的选项指定一个值，则为默认值。

| EXI Option | 描述 | 默认值 |
| ------------- |:-------------:|
| 对齐 alignment | 事件代码和内容条目 | bit-packed |
| 压缩 compression | 表示是否采用EXI压缩使得更紧凑 | false |
| strict | 严格的模式用于获取更好的紧密度 | false |
| fragment | 表示body是编码为一个EXI片段(fragment)还是EXI文档 | false |
| preserve | 选项集用于控制注释处理指令等等是保留的 | all false |
| selfContained | 使能自包含元素，自包含元素可以从剩下的EXI体中独立的读取 | false |
| schemaId | 表示schema的信息，如果有的话，用于编码body | no default value |
| datatypeRepresentationMap | 在EXI body中指定替代的数据类型表示键入的值 | no default value |
| blockSize | 指定属性(AT)的数目及Character(CH)值对于每个块用于EXI 压缩 | 1,000,000 |
| valueMaxLength | 指定要添加到字符串表中的内容条目的最大字符串长度 | unbounded |
| valuePartitionCapacity | 指定字符串表中的值分区的总容量 | unbounded |
| [user defined meta-data] | 用户自定义的选项 | no default value |
很自然，在编码时被删除的XML条目不能在解码时重新产生。在下一个节中将会处理EXI body并且更详细的讨论开关fidelity选项的效果。
### 2.1.2 EXI body
EXI文档的body是有一系列EXI event组成的。在这个环境中的event的概念于StAX及SAX APIs相似。XML items被编码到一个或多个EXI events。例如一个名为foo的属性可以被编码成AT("foo")并且一个名为bar元素由SE（“bar”）及EE一对事件组成。EXI event可能会有附加的内容关联他们。例如，属性事件AT("foo")可能有一个属性值fool与之关联，下面的表展示了所有可能 事件类型及他们相关的信息(structure及content)。在EXI 术语中，内容表示属性及特征值，而其他的信息被认为时结构。

### 2.1.3 EXI 语法
EXI是一个基于编码的知识库，使用一套语法集决定哪个事件在EXI流中的哪个位置，及将事件编码成最少的比特位。EXI语法映射事件流到一个低熵的替代值，并且使用一套简单的** 可变长短编码 ** 及 ** EXI压缩算法 ** 编码这些值。

EXI语法是一个正规语法，使用它的产品都关联着事件代码。一个XML事件流驱动的EXI编码器，映射事件到一个语法产品，使用相关的时间按代码表述一个XML文档或XML片段。由于EXI语法是一个正规语法(regular grammars),编码器写出的事件序列相应于有限状态机中的可接受的语法路径。实际上，XML不是一个正规的语言（regular language），一个见到那的语法不能用于表示一个整个的XML事件流。相反，一个EXI编码器使用一个语法栈，这个语法栈用于每个元素内容模型。

一个事件代码用一个分为1到3部分的序列表示，每个部分都是一个非负整数。在EXI语法中事件代码以这样一种方式分配给产品，更短的事件代码用于表示更多出现的产品（标签?）。EXI语法以这样一种方式设计，每个产品的平均的bit数目少于，产品更多或更少出现没有区别的语法。下面是一个例子。

TODO


> 在理论计算机科学及正规语言理论，一个regular language是一个formal language，可以被正则表达式解释(regular expression).一个regular language可以被定义一个被有限自动机识别的语言，

#### 2.1.3.1 内建语法
当没有schema信息可用的时EXi使用一套内建的语法编码XML文档及XML分片。内建的语法用于编码文档分片及元素。文档及分片语法描述顶级的结构，而元素语法描述每个元素的结构，分片语法比文档语法更宽松。






a
