# NOTE: Still working on this

sudo apt install build-essential cmake wget unzip checkinstall pkg-config yasm gfortran software-properties-common
sudo apt install jasper ffmpeg libqt4-dev qt5-default python3-minimal python3 python3-pip python3.8 python3.8-dev doxygen libeigen3-dev
# if use gtk instead of qt5
sudo apt install libgtk2.0-dev libgtk-3-dev
# then add -DWITH_GTK=OFF

# codec
sudo apt install libjpeg8-dev libpng-dev libjasper1 libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine2-dev libv4l-dev

# other https://stackoverflow.com/questions/45582565/opencv-cmake-error-no-such-file-or-directory-on-ubuntu
# video
sudo apt install pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev libxvidcore-dev libx264-dev 
# gstreamer
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio

# OpenGL
sudo apt-get install libgtkglext1 libgtkglext1-dev 

sudo apt install python3-vtk7

python3 -m pip install --upgrade pip
 
# from charlie
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h

sudo apt -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt -y install libgtk2.0-dev libtbb-dev qt5-default
sudo apt -y install libatlas-base-dev
sudo apt -y install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt -y install libvorbis-dev libxvidcore-dev
sudo apt -y install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt -y install libavresample-dev
sudo apt -y install x264 v4l-utils
sudo apt -y install libprotobuf-dev protobuf-compiler
sudo apt -y install libgoogle-glog-dev libgflags-dev
sudo apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen
sudo apt -y install python3-dev python3-pip python3-vev
sudo -H pip3 install -U pip numpy
sudo apt -y install python3-testresources
sudo apt-get install libhdf5-serial-dev


# switch python3.6 - python3.8
sudo apt update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
sudo apt update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 0
sudo apt install python3.8-venv
cd ~
python3.8 -m venv .venv --prompt OCV
source ~/.venv/bin/activate
pip3 install -U pip
pip3 install -U setuptools
pip install jupyterlab
pip install Pillow matplotlib


cd $cwd
python3 -m venv OpenCV-"$cvVersion"-py3
pip install wheel numpy scipy matplotlib scikit-image scikit-learn ipython 
pip install dlib
#todo: arrange the dependencies

# download repositories
export OCV_VER=3.4.2
mkdir ~/opencv-$OCV_VER
cd ~/opencv-$OCV_VER
wget wget "https://github.com/opencv/opencv/archive/refs/tags/$OCV_VER.zip" -O opencv.zip
wget "https://github.com/opencv/opencv_contrib/archive/refs/tags/$OCV_VER.zip" -O opencv_contrib.zip
unzip opencv.zip
mv opencv-$OCV_VER opencv
unzip opencv_contrib.zip
mv opencv_contrib-$OCV_VER opencv_contrib

mkdir build
cd build

# there are 3 options to choose. Be patience this step.
# recommend: option2 (cpu only)

# option 1: install to ~/opencv
cmake -DBUILD_DOCS=ON \
  -DBUILD_TESTS=ON \
  -DBUILD_EXAMPLES=ON \
  -DBUILD_PERF_TESTS=ON \
  -DBUILD_opencv_apps=ON \
  -DENABLE_PROFILING=ON \
  -DENABLE_COVERAGE=ON \
  -DBUILD_JASPER=ON \
  -DBUILD_JPEG=ON \
  -DBUILD_PNG=ON \
  -DBUILD_TBB=ON \
  -DBUILD_TIFF=ON \
  -DBUILD_ZLIB=ON \
  -DBUILD_opencv_world=ON \
  -DINSTALL_C_EXAMPLES=ON \
  -DINSTALL_PYTHON_EXAMPLES=ON \
  -DINSTALL_TESTS=ON \
  -DMKL_USE_SINGLE_DYNAMIC_LIBRARY=ON \
  -DMKL_WITH_OPENMP=ON \
  -DMKL_WITH_TBB=ON \
  -DWITH_OPENGL=ON \
  -DWITH_OPENMP=ON \
  -DWITH_OPENNI2=ON \
  -DWITH_OPENVX=ON \
  -DWITH_QT=OFF \
  -DWITH_GTK=OFF \
  -DWITH_TBB=ON \
  -DWITH_HPX=ON \
  -DWITH_VA_INTEL=ON \
  -DBUILD_NEW_PYTHON_SUPPORT=ON \
  -DBUILD_opencv_python2=OFF \
  -DBUILD_opencv_python3=ON \
  -DHAVE_opencv_python3=ON \
  -DPYTHON_DEFAULT_EXECUTABLE=/usr/bin/python3.8 \ 
  -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
  -DPYTHON_LIBRARY=/usr/lib \
  -DCMAKE_INSTALL_PREFIX=~/opencv \
  -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
  ../opencv
  
# option2: install to /usr/local/opencv-$OCV_VER 
cmake -DCMAKE_BUILD_TYPE=RELEASE \
 -D CMAKE_INSTALL_PREFIX=/usr/local/opencv-$OCV_VER \
 -D BUILD_DOCS=ON \
 -D BUILD_TESTS=ON \
 -D BUILD_PERF_TESTS=ON \
 -D BUILD_EXAMPLES=ON \
 -D INSTALL_C_EXAMPLES=ON \
 -D INSTALL_PYTHON_EXAMPLES=ON \
 -D BUILD_opencv_apps=ON \
 -D WITH_OPENMP=ON \
 -D WITH_TBB=ON \
 -D WITH_V4L=ON \
 -D BUILD_SHARED_LIBS=ON \
 -D WITH_QT=OFF \
 -D WITH_GTK=ON \
 -D BUILD_NEW_PYTHON_SUPPORT=ON \
 -D BUILD_opencv_python2=OFF \
 -D BUILD_opencv_python3=ON \
 -D PYTHON_DEFAULT_EXECUTABLE=~/.venv/bin/python3.8 \
 -D PYTHON_INCLUDE_DIR=~/.venv/include \
 -D PYTHON_LIBRARY=~/.venv/lib \
 -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
 -D BUILD_EXAMPLES=ON \
 ../opencv
# todo: add opengl support 
 
 # option3: install with CUDA-enabled and Python3 virtual env.
cmake -DBUILD_DOCS=ON \
  -DBUILD_TESTS=ON \
  -DBUILD_EXAMPLES=ON \
  -DBUILD_PERF_TESTS=ON \
  -DBUILD_opencv_apps=ON \
  -DENABLE_PROFILING=ON \
  -DENABLE_COVERAGE=ON \
  -DBUILD_JASPER=ON \
  -DBUILD_JPEG=ON \
  -DBUILD_PNG=ON \
  -DBUILD_TBB=ON \
  -DBUILD_TIFF=ON \
  -DBUILD_ZLIB=ON \
  -DBUILD_opencv_world=ON \
  -DINSTALL_C_EXAMPLES=ON \
  -DINSTALL_PYTHON_EXAMPLES=ON \
  -DINSTALL_TESTS=ON \
  -DMKL_USE_SINGLE_DYNAMIC_LIBRARY=ON \
  -DMKL_WITH_OPENMP=ON \
  -DMKL_WITH_TBB=ON \
  -DWITH_OPENGL=ON \
  -DWITH_OPENMP=ON \
  -DWITH_OPENNI2=ON \
  -DWITH_OPENVX=ON \
  -DWITH_QT=OFF \
  -DWITH_GTK=OFF \
  -DWITH_TBB=ON \
  -DWITH_HPX=ON \
  -DWITH_VA_INTEL=ON \
  -DBUILD_NEW_PYTHON_SUPPORT=ON \
  -DBUILD_opencv_python2=OFF \
  -DBUILD_opencv_python3=ON \
  -DHAVE_opencv_python3=ON \
  -DPYTHON_DEFAULT_EXECUTABLE=~/.venv/bin/python3 \
  -DPYTHON_INCLUDE_DIR=~/.venv/include \
  -DPYTHON_LIBRARY=~/.venv/lib \
  -DWITH_CUDA=ON \
  -DENABLE_FAST_MATH=1 \
  -DCUDA_FAST_MATH=1 \
  -DWITH_CUBLAS=1 \
  -DCMAKE_INSTALL_PREFIX=/usr/local/opencv-3.4.17 \
  -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
  ../opencv
#todo: add cuda support

# install OpenCV-4.2.0
set OCV-VERSION=4.2.0
mkdir ~/opencv-$OCV-VERSION
cd ~/opencv-$OCV-VERSION
wget wget "https://github.com/opencv/opencv/archive/refs/tags/$OCV-VERSION.zip" -O opencv.zip
wget "https://github.com/opencv/opencv_contrib/archive/refs/tags/$OCV-VERSION.zip" -O opencv_contrib.zip
unzip opencv.zip
mv opencv-$OCV-VERSION opencv
unzip opencv_contrib.zip
mv opencv_contrib-$OCV-VERSION opencv_contrib

mkdir opencv/build
cd opencv/build

source ~/.venv/bin/activate

### OpenCV-4.2.0: C++, Python2, Python3, OpenMP & TBB, docs, examples, tests ==> Not working
cmake -DCMAKE_BUILD_TYPE=RELEASE \
 -D CMAKE_INSTALL_PREFIX=/usr/local/opencv-4.2.0 \
 -D BUILD_DOCS=ON \
 -D BUILD_TESTS=ON \
 -D BUILD_PERF_TESTS=ON \
 -D BUILD_EXAMPLES=ON \
 -D INSTALL_C_EXAMPLES=ON \
 -D INSTALL_PYTHON_EXAMPLES=ON \
 -D BUILD_opencv_apps=ON \
 -D WITH_OPENMP=ON \
 -D WITH_TBB=ON \
 -D WITH_V4L=ON \
 -D BUILD_SHARED_LIBS=ON \
 -D WITH_QT=OFF \
 -D WITH_GTK=ON \
 -D BUILD_NEW_PYTHON_SUPPORT=ON \
 -D BUILD_opencv_python2=OFF \
 -D BUILD_opencv_python3=ON \
 -D PYTHON_DEFAULT_EXECUTABLE=~/.venv/bin/python3.8 \
 -D PYTHON_INCLUDE_DIR=~/.venv/include \
 -D PYTHON_LIBRARY=~/.venv/lib \
 -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
 -D BUILD_EXAMPLES=ON \
 .. 

### OpenCV-3.4.2: C++ only, pthreads, no docs, no examples, no tests
cmake -DCMAKE_BUILD_TYPE=RELEASE \
 -D CMAKE_INSTALL_PREFIX=/usr/local/opencv-3.4.2 \
 -D BUILD_DOCS=OFF \
 -D BUILD_TESTS=OFF \
 -D BUILD_PERF_TESTS=OFF \
 -D BUILD_opencv_apps=OFF \
 -D WITH_OPENMP=OFF \
 -D WITH_TBB=OFF \
 -D WITH_V4L=ON \
 -D BUILD_SHARED_LIBS=ON \
 -D WITH_QT=OFF \
 -D WITH_GTK=ON \
 -D BUILD_opencv_java=OFF \
 -D BUILD_opencv_python2=OFF \
 -D BUILD_opencv_python3=OFF \
 -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
 ../opencv
make -j16

# build and install
sudo make install

sudo -s
# make linking library setting
echo /usr/local/opencv-3.4.2/lib >> /etc/ld.so.conf.d/opencv.conf
exit 

# update linking library
sudo ldconfig

# now create a resize Eclipse Project
