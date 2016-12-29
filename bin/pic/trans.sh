#!/bin/bash
#
# 将当前目录下的所有文件名全部转换为小写. 
# 
for filename in * # 遍历当前目录下的所有文件. 
do 
  fname=`basename $filename` 
  n=`echo $fname | tr A-Z a-z`  # 将名字修改为小写. 
  if [ "$fname" != "$n" ]         # 只对那些文件名不是小写的文件进行重命名. 
  then
    mv $fname $n
  fi 
done 
exit 
