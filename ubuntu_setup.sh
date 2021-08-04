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
#curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#python get-pip.py
sudo apt install python3-pip

# install numpy and others (system wide)
sudo apt install python3-numpy python3-scipy python3-matplotlib python3-pandas python3-sympy python3-nose

pip install ipython
pip install ipython-notebook

# install scikit-learn
pip install -U scikit-learn

# install opencv
sudo apt install libopencv-dev python3-opencv

# install ros noetic
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt install ros-noetic-desktop-full
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essentia
sudo rosdep init
rosdep update

# overlay fortune in bashrc
echo "fortune" >> ~/.bashrc

