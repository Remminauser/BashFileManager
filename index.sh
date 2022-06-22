#!/bin/bash
#for encrypting file
function encfile()
{
	read -p "enter filename " FILENAME
	gpg -c $FILENAME
	echo "this is what "$(ls)\n" looks like after encyption"
}
#for de-encrupting file
function dencf()
{
	read -p "enter filename " FILENAME
	gpg $FILENAME
	echo " this is what " $(ls) " looks like after de-encrypting"

}
#for removing new file
function rmfile()
{
	read -p " enter filename " FILENAME
	rm -rf $FILENAME
	echo " $(ls) is what $(pwd) looks like after removing $FILENAME "
	exit
}
#for removing new folder
function rmdire()
{
	read -p " enter foldername " FOLDERNAME
	rm -rf $FOLDERNAME
	echo " $(ls) is what $(pwd) looks like after removing $FOLDERNAME "
	exit
}
#for making new file
function mkfil()
{
	read -p " enter filename " FILENAME
	touch $FILENAME
	echo " $(ls) is what $(pwd) looks like after making $FILENAME "
	exit
}
#for making new folder
function mkdire()
{
	read -p " enter foldername " FOLDERNAME
	mkdir $FOLDERNAME
	echo " $(ls) is what $(pwd) looks like after making $FOLDERNAME "
	exit
}
#for renaming file
function mvefl()
{
	read -p " enter current file name " FILENAME
	read -p " enter NEW file name " NWFILENAME
	mv $FILENAME $NWFILENAME
	echo " this is what $(ls) looks like after rennaming $FILENAME to $NWFILENAME "
	exit
}
#for renaming folder
function mvdiir()
{
	read -p " enter current folder name " FOLDERNAME
	read -p " enter new folder name " NWFOLDERNAME
	mv $FOLDERNAME $NWFOLDERNAME
	echo " this is what $(ls) looks like after renaming $FOLDERNAME to $NWFOLDERNAME "
	exit
}
read -p " which directory would you like to move to first ? " DIRECTO
cd $DIRECTORY
echo " we are now in $(pwd) "
read -p " what would you like to work with ? files or folders ? " ACTION
if [ $ACTION == "file" ];
then
	read -p " what woould you like to do today ? make , rename or delete files ? " ACTIONTWO
	case $ACTIONTWO in 
		"rename" )
			mvefl ;;
		"remove" || "delete" )
			rmfile ;;
		"make" || "create" )
			mkfil ;;
		"encrypt" )
			encfile ;;
		"dencrypt" )
			dencf ;;
	esac
else [ $ACTION == "folder" ];
	read -p " what would you like to do today ? make , rename or delete folders ? " ACTIONTWO
	case $ACTIONTWO in 
		"rename" )
			mvdiir ;;
		"remove" || "delete" )
			rmdire ;;
		"make" || "create" )
			mkdire ;;
		"encrypt" )
			encfile ;;
		"dencrypt" )
			dencf ;;
	esac
fi	

