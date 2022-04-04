sudo apt install build-essential cmake g++ wget unzip
sudo apt install jasper ffmpeg libqt4-dev qt5-default python3 python3-pip python3.8 doxygen libeigen3-dev
# if use gtk instead of qt5
sudo apt install libgtk2.0-dev libgtk-3-dev
# then add -DWITH_GTK=OFF

# other https://stackoverflow.com/questions/45582565/opencv-cmake-error-no-such-file-or-directory-on-ubuntu
sudo apt install pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev libxvidcore-dev libx264-dev 
sudo apt install libjasper-dev

# gstreamer
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio

python3 -m pip install numpy

mkdir ~/opencv-3.4.17
cd ~/opencv-3.4.17
wget wget "https://github.com/opencv/opencv/archive/refs/tags/3.4.17.zip" -O opencv.zip
wget "https://github.com/opencv/opencv_contrib/archive/refs/tags/3.4.17.zip" -O opencv_contrib.zip
unzip opencv.zip
unzip opencv_contrib.zip

mkdir build
cd build
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
  -DCMAKE_INSTALL_PREFIX=/home/haipnh/opencv \
  -DOPENCV_EXTRA_MODULES_PATH=/home/haipnh/opencv-3.4.17/opencv_contrib/modules \
  ../opencv
