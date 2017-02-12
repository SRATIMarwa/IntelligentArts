#!/bin/bash


# installing the essentials
echo -e "\e[32m**** installing the essentials  ****\e[39m"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y build-essential git python-pip libfreetype6-dev libxft-dev libncurses-dev libopenblas-dev gfortran python-matplotlib libblas-dev liblapack-dev libatlas-base-dev python-dev python-pydot linux-headers-generic linux-image-extra-virtual unzip python-numpy swig python-pandas python-sklearn unzip wget pkg-config zip g++ zlib1g-dev libcurl3-dev

#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	sudo apt-get install -y build-essential git python-pip libfreetype6-dev libxft-dev libncurses-dev libopenblas-dev gfortran python-matplotlib libblas-dev liblapack-dev libatlas-base-dev python-dev python-pydot linux-headers-generic linux-image-extra-virtual unzip python-numpy swig python-pandas python-sklearn unzip wget pkg-config zip g++ zlib1g-dev libcurl3-dev
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

sudo pip install -y -U pip

#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
		sudo pip install -y -U pip
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

# installing CUDA Toolkit 7.0
echo -e "\e[32m**** installing CUDA Toolkit 7.0  ****\e[39m"
wget https://developer.nvidia.com/compute/cuda/8.0/prod/local_installers/cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb

#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	wget https://developer.nvidia.com/compute/cuda/8.0/prod/local_installers/cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

sudo dpkg -i cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	sudo dpkg -i cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

rm cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64-deb
sudo apt-get update
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	sudo apt-get update
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

sudo apt-get install -y cuda
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	sudo apt-get install -y cuda
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done



echo -e "\e[32m**** Please reboot the system  then run the command \"bash Install_Tensorflow_2.bash\"****\e[39m"

