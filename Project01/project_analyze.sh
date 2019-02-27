#!/bin/bash

if [ $# -eq 1 ]
then
   
   if [ $1 -eq 1 ]
   then
	grep -r --exclude="todo.log" "#TODO" > ~/CS1XA3/Project01/todo.log
   elif [ $1 -eq 2 ]
   then 
	echo "Compile Error log"
	list1=$(find ~/CS1XA3 -name *.py)
	list2=$(find ~/CS1XA3 -name *.hs)
	for pyfi in $list1;do
	 	x=$(python $pyfi)
		if [[ $x == *error* ]];
		then
			echo "$x" >> ~/CS1XA3/Project01/compile_fail.log
		fi
	done
	for hsfi in $list2;do
		x=$(ghci $hsfi)
		if [[ $x == *error* ]];
		then
	     		echo "$hsfi" >> ~/CS1XA3/Project01/compile_fail.log
   		fi
	done
   
   elif [ $1 -eq 3 ]
   then
	echo "Merge Log"
	mlist=$(git log --oneline | grep -i 'merge' | cut -d " " -f1)
	for var in $mlist;do
	 echo "$var" >> merge.log
	done

   elif [ $1 -eq 4 ]
   then 
	echo "File Type Count"
	Hlist=$(find ~/CS1XA3 -name *.html)
	Jlist=$(find ~/CS1XA3 -name *.js)
	Clist=$(find ~/CS1XA3 -name *.css)
	Plist=$(find ~/CS1XA3 -name *.py)
	HAlist=$(find ~/CS1XA3 -name *.hs)
	Blist=$(find ~/CS1XA3 -executable -type f)

	x=0
	for var in $Hlist;do
	 x=$((++x))
	done
	echo "HTML: $x"
 
	x=0
	for var in $Jlist;do
	 x=$((++x))
	done
	echo "JAVASCRIPT: $x"

	x=0
	for var in $Clist;do
	 x=$((++x))
	done
	echo "CSS: $x"

	x=0
	for var in $Plist;do
	 x=$((++x))
	done
	echo "PYTHON: $X"

	x=0
	for var in $HAlist;do
	 x=$((++x))
	done
	echo "HASKELL: $x"

	x=0
	for var in $Blist;do
	 
	   if [[ $(grep '#!/bin/bash' "$var") != "" ]];
	   then
	      x=$((++x))
	   fi
	done
	echo "BASHSCRIPT: $x"

   elif [ $1 -eq 5 ]
   then 
	echo "Delete Temporary Files"
	list=$(git ls-files ~/CS1XA3/ --exclude-standard --others)
	for files in $list;do
	  rm $files
	done 
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









