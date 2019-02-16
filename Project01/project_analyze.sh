#!/bin/bash

if [ $# -eq 1 ]
then
   
   if [ $1 -eq 1 ]
   then
	grep -r --exclude="todo.log" "#TODO" > ~/CS1XA3/Project01/todo.log
   elif [ $1 -eq 2 ]
   then 
	echo "Compile Error log"
   elif [ $1 -eq 3 ]
   then
	echo "Merge Log"
   elif [ $1 -eq 4 ]
   then 
	echo "File Type Count"
   elif [ $1 -eq 5 ]
   then 
	echo "Delete Temporary Files"
   elif [ $1 -eq 6 ]
   then
	echo "Find Last Working File"
   else
	echo "Enter the wrong input"
	echo "The input should be the number from 1 to 6"
   fi		

else
   echo "Incorrect number of the arguments"
fi

exit
