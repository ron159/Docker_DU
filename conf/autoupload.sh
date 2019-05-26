#!/bin/bash
path=$3 #取原始路径，我的环境下如果是单文件则为/data/demo.png,如果是文件夹则该值为文件夹内某个文件比如/data/a/b/c/d.jpg
downloadpath='/Download'
url='https://api.telegram.org/bot726919827:AAGg6D-pMg8P77pZrkBClPva4tz7Paatxaw/sendMessage?' 
if [ "$2" = "0" ]
	then
		exit 0
fi
while true; do  #提取下载文件根路径，如把/data/a/b/c/d.jpg变成/data/a
	filepath=$path
	path=${path%/*};
	if [ "$path" = "$downloadpath" ] && [ $2 -eq 1 ]  #如果下载的是单个文件
		then
		curl -d "chat_id=@marktwo_post&text=["${filepath##*/}"]下载完成，正在执行上传..." "$url"
		rclone move "$filepath" gd:/   
		curl -d "chat_id=@marktwo_post&text=["${filepath##*/}"]上传完成！" "$url"  
		exit 0
	elif [ "$path" = "$downloadpath" ]   #文件夹
		then							
		while [[ "`ls -A "$filepath/"`" != "" ]]; do
		curl -d "chat_id=@marktwo_post&text=["${filepath##*/}"]下载完成，正在执行上传..." "$url"		
		rclone move "$filepath"/ gd:/"${filepath##*/}"/ --delete-empty-src-dirs	
		curl -d "chat_id=@marktwo_post&text=["${filepath##*/}"]上传完成！" "$url"			
		done
		rm -rf "$filepath/"	
	      	exit 0
	fi
done
