# package managing
alias ins='sudo apt-get install'
alias rem='sudo apt-get remove'
alias sag='sudo apt-get'
alias saa='sudo add-apt repository'


# network
	#ping / net  check
alias pingu='ping google.com' 
alias goo='time curl 'http://google.com'' # Check internet if ping port blocked
alias pinge='ping 192.168.0.210' # some frequently needed pings # can put custom ip range here
alias pingem='ping 10.42.0.202'
alias pingoo='ping -A google.com' # adaptive ping, sends packet as soon as previous received
# limited at 5 Hz, by default, to avail max capability, type in "sudo ping -A google.com"


	# network manager

alias wifi='sudo gedit /etc/NetworkManager/system-connections/*Hotspot' 
alias gssid='nmcli -p d | grep wlan0' # get ssid of current Wi-Fi network
alias lanr='sudo ifdown eth0 && sudo ifup eth0' # restarts lan, I had a problem in 15.04, where lan used to get disconnected when charger was removed
alias wscan='nmcli device wifi list' # scans and prints available Wi-Fi networks with strength, authentication
alias wlanr='nmcli radio wifi off;sleep 2; nmcli radio wifi on' # restarts Wi-Fi
alias lanr2='nmcli con down "Auto Ethernet"; sleep 3; nmcli con up "Auto Ethernet"'
alias hot='nmcli c up id '*Hotspot'' #named my hotspot as *Hotspot, this command turns it on
alias wcon='nmcli c up id' # connect to argumented Wi-Fi
alias wif2='nmcli radio wifi off; sleep 8; nmcli radio wifi on; nmcli c up id Winterfell' #restarts Wi-Fi; 
		# edit name so it'll try to join that Wi-Fi after restarting
alias wif='nmcli c up Winterfell'
alias wsta='nmcli -p d | grep wlan0' # shows current Wi-Fi status
alias picl='sudo nmap -sP 10.42.3.2-254' # can put custom ip range here
alias n='nmcli'
alias netr='sudo service network-manager restart' # restarts network manager in case or random problems
alias wifis='cd /etc/NetworkManager/system-connections/ ; ls' # prints names of all the stored connections


# terminal commands
alias s='sudo'
# so many exits to take care of typos :P
alias e='exit'
alias E='exit'
alias EE='exit'
alias eee='exit'
alias ee='exit'
alias alia='nano ~/.bash_aliases' # edit aliases with nano (cli)
alias galia='gedit ~/.bash_aliases' # edit aliases with gedit (gui)
alias roo='cd /etc/apt; sudo -i' # root access in terminal
alias ref='source ~/.bashrc' # refreshes existing bash to load any changes in alias, to avoid restarting bash
alias clr='clear' # clear bash space
alias b='cd ..' 
alias exe='chmod -x' # gives executable permissions
alias insf='sudo apt-fast install' # multithreaded application downloader
alias cdd='cd Desktop/Desktop'


 # I/o
alias dis='sudo baobab' #disk space monitor
alias iot='sudo iotop' #disk I/O monitor
alias ram='sudo mount -t tmpfs -o size=1024M tmpfs /media/ramu' # creates RAMDISK - using ram as temporary hardisk- gets deleted at power loss
alias mol='xmodmap -e "pointer = 3 2 1"' # Reverses left and right mouse buttons
alias mor='xmodmap -e "pointer = 1 2 3"' # Reverts back mouse buttons to default settings
alias sola='pacmd set-default-sink "alsa_output.pci-0000_00_1b.0.analog-stereo"' # change default sound sinks.. replace with names of your sinks
alias sopi='pacmd set-default-sink "tunnel.raspi0.local.alsa_output.0.analog-stereo.2"'
alias sopp='pacmd set-default-sink "tunnel.raspi0.local.alsa_output.usb-C-Media_Electronics_Inc._USB_PnP_Sound_Device-00-Device.analog-stereo.2"'


 # stats / find
alias t='time' # time any command which you pass as argument
# entering a command after t, like "t date", will print 
# how much time in miliseconds it took to execute the 'date' command
alias upt='uptime -since' 
alias fin='history | grep' # find a command in history
alias tem='cat /sys/class/thermal/thermal_zone0/temp' # display CPU temperature
alias fina='cat .bash_aliases | grep' # find in alias, pass as argument
alias finr='ps -e | grep' # find in running programs, give name to find as argument


# running programs / scripts
alias andro='cd Installed/android-studio/bin; sudo ./studio.sh' # if android studio installed
alias matt='sudo matlab' # if matlab installed
alias cha='cd /home/h/Bash; ./Charging.sh'
alias pro='sudo /home/h/Desktop/processing-3.0.1/processing' # Start processing


# managing trackers - 
	# if you torrent a lot, you might have maintained a list of trackers to use for every new trackers 
	# which you update continuously.. by adding trackers from every new torrent
	# let trackers.txt be the raw file where you add any new trackers at will and without checking redundancy or line gaps
	# type "tra" , it will first remove duplicate trackers, then manage proper new line ending by removing multiple line gaps
	# and output it into trackers1.txt

alias remred='sort trackers.txt | uniq > trackers1.txt'
alias add1='sed -i 's/announce/announce\\n/g' trackers1.txt'
alias add2='sed -i 's/announce\\n/announce/g' trackers1.txt'
alias tra='remred;add1;add2'


# power
alias bl='xbacklight' #xbacklight provides better brightness for laptops
alias shut='sudo shutdown'
alias shutm='sudo shutdown -P' # add time argument after this command
alias abo='sudo shutdown -c' # abort pending shutdown command
alias rrr='reboot'



# python

alias p='python'
alias pipi='sudo pip install' #for python 


#misc
alias k='xdotool key' # inputs the keys passed as argument
alias kk='k Return; k Return'
alias hos='sudo nano /etc/hosts' # edit hosts file


alias reind='sudo apt-get install --reinstall ubuntu-desktop' # reinstalls desktop, i had a problem in 15.04 
# that the settings icon disappeared, running this command used to solve it..

alias mou='oneko' # install oneko and try running this :P
alias keys='s dconf-editor' # opens dconf editor
alias vnc='vncviewer 172.17.16.30:1' # for vnc
alias spi='ssh pi@172.17.16.30'

alias lol='echo hahahaha' # random



##### Functions ####

adda(){ # add aliases: "adda "alias po='ping'"" to add corresponding alias directly into the file
	echo $1 >> ~/.bash_aliases
}

loop(){ # 
	ab=$2
	if [ -z "$2" ];
		then
		ab=5 # set default time in case no corresponding argument
		echo "using default gap of 5 secs"
	else
		echo "using set gap of $ab secs"
	fi
	
	if [ -z "$3" ];
		then
		echo "looping to infinity "
		while :
			do
			$1
			sleep $ab
		done
	else
		echo "looping $3 times"
		for (( c=1; c<=$3; c++ ))
			do  
			$1
			sleep $ab
		done
	
	fi
}

	# Ping
pin(){ # If your IP is 10.42.0.6 and some system is on 10.42.1.5 and 10.42.0.3
	   # and you want to ping 10.42.0.3, just type "pin 3"
	   # if you want to ping 10.42.1.5, just type "pin 1 5"
	   # for pinging pi.local, just type "pin pi"
	v2=$(ifconfig | grep Bcast | grep -o -P "(?<=addr:).*(?=  B)" | grep -oE '[0-9]+')
	echo $v2
	if [[ $1 =~ ^-?[0-9]+$ ]];
		then
		if [ -z "$2" ];
			then
			pingi $v2 $1
		else 
			pingi $v2 $1 $2
		fi
	else
		ping -A $1.local
	fi
	}
	pingi(){
	if [ -z "$6" ];
	then
		ping -A $1.$2.$3.$5
	else 
		ping -A $1.$2.$5.$6
	fi
}

	# Nmap
nma(){ # just type nma, it will find your currnent IP 
	   # and run scan in the corresponding 4th octet/subnet range
	v2=$(ifconfig | grep Bcast | grep -o -P "(?<=addr:).*(?=  B)" | grep -oE '[0-9]+')
	echo $v2
	nmaa $v2
}

nmaa(){ # instead of typing "sudo nmap -sP 192.168.1.1-255",
		# just need to type "nmaa 192 168 1"
	sudo nmap -sP $1.$2.$3.1-255
}

g(){ # type "g ls .txt" instead of "ls | grep .txt"
	echo $($1 | grep $2)
}

c(){ # display on screen and copy terminal command output into clipboard
	a=$($1)
	echo $a
	echo $a | xclip -sel clip
}

# java
j(){ # runs compiled java script
	java $1
}

ja(){ # compiles java script
	javac $1.java
}

jaa(){ #compiles and runs java script, if error in compilation, prints error message
	r=$(ja $1)
	
	if [ $? != 0 ] ; 
		then
		# echo $r $r $r
	        echo "Didn't run ... too lazy"
	else
		echo "Compiled successfully" 
		# times execution time by default..
		t j $1
	fi
}

mj(){ # to edit java file with nano.. 
	nano $1.java
}



py(){ # runs python script.. just enter the name without extensions
	python $1.py
}

mp(){ # to edit python file with nano.. 
	nano $1.py
}

#bash
ms(){ # to edit bash file with nano.. 
	nano $1.sh
}


#notifications 
not(){ # manage notifications - can be used for reminding something
	   # not cool will display cool for default of 10 seconds
	   # not 2 cool will display cool for default of 10 seconds, after 2 seconds
	ab=$2
	#echo $ab
	if [ -z "$ab" ];
		then
		notify-send $1
	else
		sleep $1
		notify-send $2
	fi
}


notc(){ # notc 10 cool will display cool for 10 times for default of 10 seconds each
		# with a gap of 2 seconds for the flashy effect to increase visibility

	i=0
	while [ $i -lt $1 ]
		do
		not 2 $2
		i=$[i+1]
	done
}


#power
sus() { # suspends after the number of seconds you pass as argument
	sleep $1 
	systemctl suspend 
}


#timing a command 

	  #entering a command after tu, like "tu date" -
tu(){ # tells the running time in nanoseconds
	a=$(date +%s%N)
	$1 $2 $3 $4 $5 $6 $7 $8 $9 #good upto 9 arguments
	b=$(date +%s%N)
	((c=$b-$a))
	d=${c: -3}
	e=${c: -6: -3}
	f=${c:0: -6}
	
	echo "total nano:" $c
	echo "m, μ, n": $f,$e,$d 
}

# formulae
cdf(){ # converts celsius to farenheit
	((a=$1*9/5))
	((b=$a+32))
	echo $b
}
fdc(){ # converts farenheit to celsius
	((a=$1-32))
	((b=$a*5/9))
	echo $b
}

lor(){ # copies some paragraphs of Lorem ipsum... into clipboard
a="Lorem ipsum dolor sit amet, liber aliquando dissentiet nec et, impedit blandit commune id pro. Solum zril argumentum no sed, his no fugit suscipit deterruisset. Est ei dicta corpora dissentiet, debitis intellegebat delicatissimi ex eam, sed ne choro consetetur adipiscing. No meis nulla cotidieque qui, elit constituto vix no, utinam libris quodsi at pri.

Cu corpora reprimique duo. Illud antiopam duo ut, ex ius summo exerci tempor, id est meis torquatos. Ne pri recusabo atomorum, ei eos ludus putent evertitur, lorem doctus ex vix. Error efficiantur eam at. Aperiri sententiae duo id, his cu ubique omittam definitionem.

Tota quidam deserunt at vis, ius natum atqui deleniti eu. Rebum torquatos adolescens et nec, mel idque commodo scriptorem eu, et est homero cotidieque concludaturque. Eu enim iuvaret expetendis pri, sea at mutat oratio legimus. No magna alienum lucilius per, est an labitur epicuri. Vix an fastidii qualisque.

Elit movet per ea, vim minim erant no. Partem menandri an pro. No vel assum expetenda consequat. Viris pertinax euripidis ne pri. Pri et tota facilisis intellegat.

Latine dolorem incorrupte sea at. Mei ei aliquam tibique concludaturque, ea tale oportere eos, inani deseruisse ex qui. Est ex probo electram, at indoctum moderatius quo. Eu vel novum regione erroribus, qui veri consetetur eu."	
echo $a | xclip -sel clip
}

