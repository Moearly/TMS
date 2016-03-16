#变量赋值
nume = 1

obj =
  name:2
  var:3

fun = ->
  obj.name+nume;

fun2 = (name,age=20)->
  console.log(name+':'+age)


isRight = true
str = 'str'
str += 'hha' if isRight

#范围判断
age = 19
isStudent = 18<age<25;

#数组定义
arrg = [1,2,4]

#数组遍历
for item in arrg
  console.log(item)

#为null或者undefined--被赋值
str ?= "aaa"

try
  a5 =abc

catch err
  console.log(err)

finally
  console.log('f')