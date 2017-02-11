#!/bin/bash
echo -e "\e[32m**** Updating Packages ****\e[39m"
sudo apt-get update -y
sudo apt-get upgrade -y

#Installing some developper tools
echo -e "\e[32m**** Installing some developer tools ****\e[39m"
sudo apt-get install -y build-essential cmake pkg-config
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"sudo apt-get install -y build-essential cmake pkg-config\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#installing some other libraries that enables opencv to read all image extentions 
echo -e "\e[32m**** installing some other libraries that enables opencv to read all image extentions ****\e[39m"
sudo apt-get install -y libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"sudo apt-get install -y libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#installing some other libraries that enables opencv to read videos. just in case
echo -e "\e[32m**** installing some other libraries that enables opencv to read videos ****\e[39m"
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done
sudo apt-get install -y libxvidcore-dev libx264-dev
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"sudo apt-get install -y libxvidcore-dev libx264-dev\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#Installing module that handles OpenCV GUI operations is highgui
echo -e "\e[32m**** Installing module that handles OpenCV GUI operations is highgui ****\e[39m"
sudo apt-get install -y libgtk-3-dev
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"sudo apt-get install -y libgtk-3-dev\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

# installing libraries that are used to optimize various functionalities inside OpenCV
echo -e "\e[32m**** installing libraries that are used to optimize various functionalities inside OpenCV ****\e[39m"
sudo apt-get install -y libatlas-base-dev gfortran
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"sudo apt-get install -y libatlas-base-dev gfortran\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

# installing the Python development headers and libraries for both Python 2.7 and Python 3.5
echo -e "\e[32m**** installing the Python development headers and libraries ****\e[39m"
sudo apt-get install -y python2.7-dev python3.5-dev
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"sudo apt-get install -y python2.7-dev python3.5-dev\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done
#Downloading the OpenCV source
echo -e "\e[32m**** Downloading the OpenCV source ****\e[39m"
cd ~
wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.1.0.zip
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.1.0.zip\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#unziping the downloaded files
echo -e "\e[32m**** unziping the downloaded files ****\e[39m"
unzip opencv.zip
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"unzip opencv.zip\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#Downloading the opencv_contrib repository
echo -e "\e[32m**** Downloading the opencv_contrib repository ****\e[39m"
cd ~
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.1.0.zip
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.1.0.zip\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#unziping the downloaded files
echo -e "\e[32m**** unziping the downloaded files ****\e[39m"
unzip opencv_contrib.zip
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"unzip opencv_contrib.zip\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#Setting up Python environment
cd ~
echo -e "\e[32m**** installing pip ****\e[39m"
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"sudo python get-pip.py\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

echo -e "\e[32m**** installing virtual envirment wrapper  ****\e[39m"
sudo -H pip install virtualenv virtualenvwrapper
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"sudo pip install virtualenv virtualenvwrapper\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done
sudo rm -rf ~/get-pip.py ~/.cache/pip
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"sudo rm -rf ~/get-pip.py ~/.cache/pip\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done


#Setting an environment variable called WORKON_HOME  to point to the directory where our Python virtual environments live
echo -e "\e[32m**** virtualenv and virtualenvwrapper  ****\e[39m"
echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.bashrc
echo "export WORKON_HOME=\$HOME/.virtualenvs" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc

#reloading the changes
echo -e "\e[32m**** Please follow these steps ****\e[39m"
echo -e "\e[31m**** ETAPE 1 (RELOADING ENV VARIABLES) ==> Merci de taper la commande \"source ~/.bashrc\" ****\e[39m"
#Creating Python virtual environment
echo -e "\e[31m**** ETAPE 2 (Creating Python virtual environment)==> Merci de taper la commande \"mkvirtualenv cv -p python3\" ****\e[39m"
#Verifying that we are in the “cv” virtual environment
echo -e "\e[31m**** ETAPE 3 (Verifying that we are in the “cv” virtual environment) ==> Merci de taper la commande \"workon cv\" ****\e[39m"
#Executing second script
echo -e "\e[31m**** ETAPE 4 (Executing the second part of the script) ==> Merci de taper la commande \"bash Installing_dependencies_2.bash\" ****\e[39m"

