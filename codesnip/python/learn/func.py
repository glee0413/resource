#!/usr/bin/env python
#coding: utf-8 or # -*- coding: utf-8 -*-

def sum(a,b):
	return a + b

def my_abs(x):
    if not isinstance(x, (int, float)):
        raise TypeError('bad operand type')
    if x >= 0:
        return x
    else:
        return -x

print sum(4,5)
print my_abs('a')

# 默认参数必须指向不变对象！
#下面的用法错误，不能改变默认参数的内容
#Python函数在定义的时候，默认参数L的值就被计算出来了，即[]，因为默认参数L也是一个变量，它指向对象[]
def add_end(L=[]):
    L.append('END')
    return L

def add_end(L=None):
    if L is None:
        L = []
    L.append('END')
    return L

#参数改为可变参数：

def calc(*numbers):
    sum = 0
    for n in numbers:
        sum = sum + n * n
    return sum

#对于已经是元组的可以通过*来转化，如果是变量则自己传递
nums = [1, 2, 3]
calc(*nums)
calc(1,2,3)

#可变参数允许你传入0个或任意个参数，这些可变参数在函数调用时自动组装为一个tuple。
#而关键字参数允许你传入0个或任意个含参数名的参数，这些关键字参数在函数内部自动组装为一个dict。请看示例：

def person(name, age, **kw):
    print 'name:', name, 'age:', age, 'other:', kw