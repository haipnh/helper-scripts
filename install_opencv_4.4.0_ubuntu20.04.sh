#!/bin/bash

# Tested on Ubuntu-18.04

# sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"

sudo apt update
sudo apt upgrade

sudo apt install -y build-essential cmake wget unzip checkinstall pkg-config yasm gfortran software-properties-common \
jasper ffmpeg python3-minimal python3 python3-pip doxygen libeigen3-dev libgtk2.0-dev libgtk-3-dev libjpeg8-dev libpng-dev \
libjasper1 libjasper-dev libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine2-dev libv4l-dev \
python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libxvidcore-dev libx264-dev \
libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base \
gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc \
gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-pulseaudio libgtkglext1 \
libgtkglext1-dev libatlas-base-dev libfaac-dev libmp3lame-dev libtheora-dev libvorbis-dev libopencore-amrnb-dev libopencore-amrwb-dev \
libavresample-dev x264 v4l-utils libprotobuf-dev protobuf-compiler libgoogle-glog-dev libgflags-dev libgphoto2-dev libhdf5-dev libhdf5-serial-dev

sudo apt-get install gcc-multilib # added 22/12/21

# Download, build and install OpenCV-4.4.0
export OCV_VER=4.4.0
mkdir ~/opencv-$OCV_VER && cd ~/opencv-$OCV_VER
wget "https://github.com/opencv/opencv/archive/refs/tags/$OCV_VER.zip" -O opencv.zip
wget "https://github.com/opencv/opencv_contrib/archive/refs/tags/$OCV_VER.zip" -O opencv_contrib.zip
unzip opencv.zip
mv opencv-$OCV_VER opencv
unzip opencv_contrib.zip
mv opencv_contrib-$OCV_VER opencv_contrib

mkdir build && cd build

export LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/
cmake -D CMAKE_BUILD_TYPE=RELEASE \
  -D CMAKE_INSTALL_PREFIX=/usr/local/opencv-$OCV_VER \
  -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
  -D WITH_V4L=ON \
  -D BUILD_TESTS=OFF \
  -D BUILD_ZLIB=ON \
  -D BUILD_JPEG=ON \
  -D WITH_JPEG=ON \
  -D WITH_PNG=ON \
  -D WITH_QT=OFF \
  -D WITH_GTK=ON \
  -D BUILD_EXAMPLES=OFF \
  -D INSTALL_C_EXAMPLES=OFF \
  -D INSTALL_PYTHON_EXAMPLES=OFF \
  -D WITH_OPENEXR=OFF \
  -D BUILD_OPENEXR=OFF \
  -D BUILD_opencv_java=OFF \
  -D BUILD_opencv_python2=OFF \
  -D BUILD_opencv_python3=OFF \
  ../opencv

make -j$(nproc)
sudo make install

# make linking library setting
sudo mkdir -p /etc/ld.so.conf.d/
sudo -s
export OCV_VER=4.4.0
echo '/usr/local/opencv-'$OCV_VER'/lib' > /etc/ld.so.conf.d/opencv-$OCV_VER.conf
exit
sudo ldconfig -v

#############################################################################################################
### Test OpenCV: Read and Write an image                                                                  ###
#############################################################################################################

cd ~
mkdir test_opencv && cd test_opencv
wget https://raw.githubusercontent.com/opencv/opencv_contrib/master/samples/data/corridor.jpg -O corridor.jpg

vi main.cpp

# >>> Paste these lines of code
#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <iostream>

using namespace cv;

int main()
{
  std::string image_path = "corridor.jpg";
  Mat img = imread(image_path, IMREAD_COLOR);
  if(img.empty())
  {
    std::cout << "Could not read the image: " << image_path << std::endl;
    return 1;
  }
  imshow("Display window", img);
  int k = waitKey(0); // Wait for a keystroke in the window
  if(k == 's')
  {
    imwrite("corridor.png", img);
  }
  return 0;
}
# <<< Paste these lines of code

# Compile
g++ ./main.cpp -o main -std=c++11 -I/usr/local/opencv-4.4.0/include/opencv4 -L/usr/local/opencv-4.4.0/lib -lopencv_imgcodecs -lopencv_core -lopencv_highgui

# Run test
#export LD_LIBRARY_PATH="/usr/lib64/:$LD_LIBRARY_PATH"
./main
