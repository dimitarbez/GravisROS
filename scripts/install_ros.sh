#!/bin/bash

# Exit on error
set -e

# Set Locale
echo "Setting locale..."
sudo apt update && sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# Setup Sources
echo "Setting up sources..."
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS 2 packages
echo "Installing ROS 2 packages..."
sudo apt update
sudo apt upgrade -y

# You can uncomment one of the following package options or prompt the user to choose

# Desktop Install
sudo apt install ros-humble-desktop -y
# ROS-Base Install
# sudo apt install ros-humble-ros-base -y
# Development tools
# sudo apt install ros-dev-tools -y

# Sourcing the setup script
echo "Sourcing the setup script..."
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source /opt/ros/humble/setup.bash

# Print completion message
echo "ROS 2 installation completed."

# If you want to run demo examples, uncomment the following lines:
# echo "Running demo nodes..."
# gnome-terminal -- bash -c "source /opt/ros/humble/setup.bash; ros2 run demo_nodes_cpp talker"
# gnome-terminal -- bash -c "source /opt/ros/humble/setup.bash; ros2 run demo_nodes_py listener"
