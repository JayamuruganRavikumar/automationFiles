##
## TO build with cuda support from base
##
FROM nvidia/cuda:11.6.1-devel-ubuntu20.04

ARG ACCEPT_EULA=y
ARG DEBIAN_FRONTEND=noninteractive

ENV SHELL /bin/bash
SHELL ["/bin/bash", "-c"]

# Env setup
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV ROS_PYTHON_VERSION=3
ENV ROS_DISTRO=humble
ENV ROS_ROOT=/opt/ros/${ROS_DISTRO}
ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp

RUN apt-get -qq update \
    && apt-get -qq upgrade \
    && apt-get -qq install \
    git-core \
	build-essential \
    curl \
    g++ \
    gcc \
    gfortran \
    git \
    libtool \
    automake \
    pkg-config \
    unzip \
    wget \
    ca-certificates \
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Ros2 apt repo

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt-get -qq update \
    && apt-get -qq upgrade \
    && apt-get -qq install \
    ros-foxy-ros-base \
    ros-foxy-rqt-graph \
    ros-foxy-rqt-reconfigure \
    ros-foxy-rqt-image-view \
    ros-foxy-rviz2 \
    ros-foxy-rviz-common \
    ros-foxy-rviz-default-plugins \
    ros-foxy-sensor-msgs \
    python3-rosdep \
	python3-colcon-common-extensions \
	python3-pip \
	python3-pybind11 \
	python3-pytest-cov \
	python3-rosdep \
	python3-rosinstall-generator \
	python3-vcstool \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc 

# Azure kinect

RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN curl -sSL https://packages.microsoft.com/config/ubuntu/18.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft-prod.list

RUN apt-get -qq update \
    && apt-get -qq install \
    libk4a1.4 \
    libk4a1.4-dev \
    k4a-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


