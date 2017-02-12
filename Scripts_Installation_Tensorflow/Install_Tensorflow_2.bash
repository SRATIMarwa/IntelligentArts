#!/bin/bash

# installing CUDNN
echo -e "\e[32m**** First, please ensure that libcudnn5_5.1.10-1+cuda8.0_amd64.deb and  libcudnn5-dev_5.1.10-1+cuda8.0_amd64.deb are downloaded, then press y to continue ****\e[39m"
read y
while [ "$y" != "y" ]
do 
	echo -e "\e[32m**** First, please ensure that libcudnn5_5.1.10-1+cuda8.0_amd64.deb and  libcudnn5-dev_5.1.10-1+cuda8.0_amd64.deb are downloaded, then press y to continue ****\e[39m"
	read y
done
echo -e "\e[32m**** installing CUDNN  ****\e[39m"
sudo dpkg -i libcudnn5_5.1.10-1+cuda8.0_amd64.deb
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	sudo dpkg -i libcudnn5_5.1.10-1+cuda8.0_amd64.deb
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

sudo dpkg -i libcudnn5-dev_5.1.10-1+cuda8.0_amd64.deb

#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	sudo dpkg -i libcudnn5-dev_5.1.10-1+cuda8.0_amd64.deb
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#Configuring the Environment
echo -e "\e[32m**** Configuring the Environment  ****\e[39m"
echo "export CUDA_HOME=/usr/local/cuda" >> ~/.profile
echo "export CUDA_ROOT=/usr/local/cuda" >> ~/.profile
echo "export PATH=\$PATH:\$CUDA_ROOT/bin" >> ~/.profile
echo "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:\$CUDA_ROOT/lib64" >> ~/.profile

source ~/.profile
#Installing Bazel
echo -e "\e[32m**** Installing Java ****\e[39m"
sudo add-apt-repository -y ppa:webupd8team/java
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	sudo add-apt-repository -y ppa:webupd8team/java
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

sudo apt-get update
# Hack to silently agree license agreement
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

sudo apt-get install -y oracle-java8-installer
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	sudo apt-get install -y oracle-java8-installer
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

echo -e "\e[32m**** Installing Bazel ****\e[39m"
echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	echo \"deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8\" | sudo tee /etc/apt/sources.list.d/bazel.list
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

curl https://storage.googleapis.com/bazel-apt/doc/apt-key.pub.gpg | sudo apt-key add -
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	curl https://storage.googleapis.com/bazel-apt/doc/apt-key.pub.gpg | sudo apt-key add -
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

sudo apt-get update && sudo apt-get install -y bazel
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	sudo apt-get update && sudo apt-get install -y bazel
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

sudo apt-get upgrade bazel
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	sudo apt-get upgrade bazel
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

bazel version
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	bazel version
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#Building and Installing TensorFlow
echo -e "\e[32m**** Building and Installing TensorFlow ****\e[39m"
git clone --recurse-submodules https://github.com/tensorflow/tensorflow
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	git clone --recurse-submodules https://github.com/tensorflow/tensorflow
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

cd tensorflow
echo -e "\e[32m****

Please select all default configuration except for the following:
Do you wish to build TensorFlow with GPU support? [y/N] y
Please specify the Cuda SDK version you want to use, e.g. 7.0. [Leave empty to use system default]: 8.0
Please specify the Cudnn version you want to use. [Leave empty to use system default]: 5.1.10
Please specify the location where cuDNN 5.1.10 library is installed. Refer to README.md for more details. [Default is /usr/local/cuda]: /usr/lib/x86_64-linux-gnu
Please specify a list of comma-separated Cuda compute capabilities you want to build with.
You can find the compute capability of your device at: https://developer.nvidia.com/cuda-gpus.
Please note that each additional compute capability significantly increases your build time and binary size.
[Default is: \"3.5,5.2\"]: 3.7
****\e[39m"
TF_UNOFFICIAL_SETTING=1 ./configure
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	TF_UNOFFICIAL_SETTING=1 ./configure
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#Building TensorFlow
echo -e "\e[32m**** Building TensorFlow, this will take quite a long time ****\e[39m"
bazel build -c opt --config=cuda //tensorflow/cc:tutorials_example_trainer
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	bazel build -c opt --config=cuda //tensorflow/cc:tutorials_example_trainer
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#Installing TensorFlow
echo -e "\e[32m**** Installing TensorFlow, this will take quite a long time ****\e[39m"
sudo -H pip install --upgrade /tmp/tensorflow_pkg/tensorflow-1.0.0rc2-cp27-cp27mu-linux_x86_64.whl
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	sudo -H pip install --upgrade /tmp/tensorflow_pkg/tensorflow-1.0.0rc2-cp27-cp27mu-linux_x86_64.whl
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done


#Validating installation
echo -e "\e[32m**** Validating installation ****\e[39m"
python ~/tensorflow/tensorflow/models/image/mnist/convolutional.py
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"
	python ~/tensorflow/tensorflow/models/image/mnist/convolutional.py
        \" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done




