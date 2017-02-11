#!/bin/bash
#installing NumPy, a Python package used for numerical processing
echo -e "\e[32m**** installing NumPy, a Python package used for numerical processing  ****\e[39m"
pip install numpy
#Pour gerer les erreurs qui peuvent se produire, le script ci-dessous demande a l'utilisateur de retaper la commande, si l'executon reussi, on continu
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"pip install numpy\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#Configuring and compiling OpenCV on Ubuntu 16.04
echo -e "\e[32m**** After ensuring you are in the cv  virtual environment, we can setup and configure our build using CMake  ****\e[39m"
cd ~/opencv-3.1.0/
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.1.0/modules \
    -D PYTHON_EXECUTABLE=~/.virtualenvs/cv/bin/python \
    -D BUILD_EXAMPLES=ON ..
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! d'abord verifier si vous etes dans l'environnement open cv si vous ne l'etes pas, executer la commande \"
	workon cv
	\" suivie de la commande \"
	cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.1.0/modules \
    -D PYTHON_EXECUTABLE=~/.virtualenvs/cv/bin/python \
    -D BUILD_EXAMPLES=ON ..
	\" 
	si l'erreur persiste toujours, veuillez rajouter a la fin de la commande la ligne suivante \"  -D ENABLE_PRECOMPILED_HEADERS=OFF \"
	****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#compiling OpenCV
echo -e "\e[32m**** Compiling OpenCv, this may take a little while  ****\e[39m"
make -j4
make clean
make

#installing OpenCV 3
echo -e "\e[32m**** installing OpenCV 3, this may take a little while  ****\e[39m"
sudo make install
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"sudo make install\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done
sudo ldconfig
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"sudo ldconfig\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

#Finishing your OpenCV install
echo -e "\e[32m**** verifying that OpenCV + Python 3 bindings should be located in /usr/local/lib/python3.5/site-packages/  ****\e[39m"
ls -l /usr/local/lib/python3.5/site-packages/

echo -e "\e[32m****  enaming cv2.cpython-35m-x86_64-linux-gnu.so  to simply cv2.so  ****\e[39m"
cd /usr/local/lib/python3.5/site-packages/
sudo mv cv2.cpython-35m-x86_64-linux-gnu.so cv2.so
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"sudo mv cv2.cpython-35m-x86_64-linux-gnu.so cv2.so\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done

echo -e "\e[32m**** verifying that OpenCV + Python 3 bindings should be located in /usr/local/lib/python3.5/site-packages/  ****\e[39m"
cd ~/.virtualenvs/cv/lib/python3.5/site-packages/
ln -s /usr/local/lib/python3.5/site-packages/cv2.so cv2.so
while [ "$?" != "0" ]
do 
	echo -e "\e[31m**** Erreur !!!! lors de l'execution de la commande \"ln -s /usr/local/lib/python3.5/site-packages/cv2.so cv2.so\" ****\e[39m"
	echo -e "\e[31m****  merci d'essayer de la taper manuellement	****\e[39m"
	read command
	$command
done
