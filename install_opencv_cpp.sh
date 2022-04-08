sudo apt install -y build-essential cmake wget unzip checkinstall pkg-config yasm gfortran software-properties-common \
jasper ffmpeg python3-minimal python3 python3-pip doxygen libeigen3-dev libgtk2.0-dev libgtk-3-dev libjpeg8-dev libpng-dev \
libjasper1 libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine2-dev libv4l-dev \
python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libxvidcore-dev libx264-dev \
libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base \
gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc \
gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-pulseaudio libgtkglext1 \
libgtkglext1-dev libatlas-base-dev libfaac-dev libmp3lame-dev libtheora-dev libvorbis-dev libopencore-amrnb-dev libopencore-amrwb-dev \
libavresample-dev x264 v4l-utils libprotobuf-dev protobuf-compiler libgoogle-glog-dev libgflags-dev libgphoto2-dev libhdf5-dev libhdf5-serial-dev

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

### OpenCV-3.4.2: C++ only, GUI with GTK, pthreads, no docs, no examples, no tests
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
make -j$(nproc) 

# build and install
sudo make install

sudo -s
# make linking library setting
echo /usr/local/opencv-3.4.2/lib >> /etc/ld.so.conf.d/opencv.conf
exit 

# update linking library
sudo ldconfig

# now create a resize Eclipse Project
