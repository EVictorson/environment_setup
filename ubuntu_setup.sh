#!/bin/bash
# Ubuntu Environment Setup
# Author: Eric Victorson
#
# super rough and simple script to setup new ubuntu environment after fresh install

# add all ubuntu repos
sudo add-apt-repository main universe multiverse restricted

# check for updates and upgrades
sudo apt update && sudo apt upgrade

# install essentials
sudo apt install build-essential cmake unzip pkg-config

# install chrome web browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb

rm google-chrome-stable_current_ambd64.deb

# install media codecs
sudo apt install ubuntu-restricted-extras

# install java
sudo apt install openjdk-8-jdk

# install terminator and configure infinite scrollback
sudo apt install terminator
echo "    scrollback_infinite = True">>.config/terminator/config

# install nano
sudo apt install nano

# install git
sudo apt install git

# install gnome tweak tool
sudo apt install gnome-tweak-tool

# install htop
sudo apt install htop

# install iotop
sudo apt install iotop

# install wireshark
sudo add-apt-repository ppa:wireshark-dev/stable
sudo apt-get update
sudo apt-get install wireshark

# install fortune and associated cookies
sudo apt install fortune-mod fortunes-min fortunes

# install atom
sudo add-apt-repository ppa:webupd8team/atom
sudo apt update
sudo apt install atom

# install curl
sudo apt install curl

# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

# install numpy and others (system wide)
sudo apt install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose

# install scikit-learn
pip install -U scikit-learn

# install opencv
sudo apt install libjpeg-dev libpng-dev libtiff-dev
sudo apt install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt install libxvidcore-dev libx264-dev
sudo apt install libgtk-3-dev
sudo apt install libatlas-base-dev gfortran
sudo apt install python3-dev
mkdir ~/libraries
cd ~/libraries
wget -O opencv.zip https://github.com/opencv/opencv/archive/3.4.4.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.4.4.zip
unzip opencv.zip
unzip opencv_contrib.zip
cd ~/libraries/opencv-3.4.4
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D INSTALL_C_EXAMPLES=OFF \
	-D OPENCV_ENABLE_NONFREE=ON \
	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
	-D PYTHON_EXECUTABLE=~/.virtualenvs/cv/bin/python \
	-D BUILD_EXAMPLES=ON ..
make -j4
sudo make install
sudo ldconfig
pkg-config --modversion opencv
cd ~

# install ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt update
sudo apt install ros-melodic-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential



