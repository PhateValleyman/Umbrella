#!/system/bin/sh
uploadserver ()
{
	if [[ -n $1 ]]; then
		file=$1;
	else
		echo -e "Select file to upload:";
		read -ei "" file;
	fi;
	echo -en "Select remote folder:\n";
	read -ei "/ffp/home/root/" serverdir;
	if [[ "$@" > 1 ]]; then
		for f in "$@";
		do
			echo -en "\033]0;Uploading $f\a";
			echo -en "Uploading \e[01;36m$f\e[0m to \e[01;33m$serverdir\e[0m";
			
			scp -r -F /data/data/com.termux/files/home/.ssh/config -i /data/data/com.termux/files/home/.ssh/server $f root@192.168.1.20:$serverdir && \
			echo -e "\n\e[01;36m$f\e[0m\n\e[01;32muploaded\e[0m to \e[01;33m$serverdir\e[0m\n\n" || \
			echo -e "\n\e[01;36m$f\e[0m\n\e[01;31mfailed\e[0m to upload to \e[01;33m$serverdir\e[0m\n\n";
			
			#scp -r -i $HOME/.ssh/server $f root@192.168.1.20:$serverdir;
			#echo -en "\n$file \e[01;32muploaded\e[0m to \e[01;33m$serverdir\e[0m\n";
		done;
		echo -en "\033]0; \a";
	else
		echo -en "\033]0;Uploading $f\a";
		echo -en "Uploading \e[01;36m$f\e[0m to \e[01;33m$serverdir\e[0m";
		
		scp -r -F /data/data/com.termux/files/home/.ssh/config -i /data/data/com.termux/files/home/.ssh/server $f root@192.168.1.20:$serverdir && \
		echo -e "\n\e[01;36m$f\e[0m\n\e[01;32muploaded\e[0m to \e[01;33m$serverdir\e[0m\n\n" || \
		echo -e "\n\e[01;36m$f\e[0m\n\e[01;31mfailed\e[0m to upload to \e[01;33m$serverdir\e[0m\n\n";
		
		#scp -r -i $HOME/.ssh/server $file root@192.168.1.20:$serverdir;
		#echo -en "\n$file \e[01;32muploaded\e[0m to \e[01;33m$serverdir\e[0m\n";
		echo -en "\033]0; \a";
	fi
}
