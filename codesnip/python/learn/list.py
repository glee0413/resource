#!/usr/bin/env python
#coding: utf-8 or # -*- coding: utf-8 -*-

classmates = ["apple","pear"]
classmates.append("banana")
print classmates
classmates.insert(2,123)
print classmates
classmates.pop(2)
print classmates

tuple = ("tuple is constant","app",123)
print tuple
#只有1个元素的tuple定义时必须加一个逗号,避免和小括号造成奇异，而将t定义为变量而非tuple
t = (1,)
t1 = (1)
print t
print t1