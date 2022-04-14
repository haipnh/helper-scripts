# Installation: https://docs.docker.com/engine/install/ubuntu/

# Verify the Installation
docker run hello-world

# Create Ubuntu-18.04 image on docker
docker pull ubuntu:18.04

# Start the image
docker run -t -d -p 4000:80 --name ubuntu-18.04 ubuntu:18.04

# Open bash on the image
docker exec -it ubuntu-18.04 /bin/bash

# The command prompt should show
# root@<image-id>:/#

# Install GCC 
apt update && apt install -y gcc vim

# Configure .bashrc
echo 'cd ~' >> ~/.bashrc

# Create program
cd ~
vi 9x9.c

### >> BEGIN: Paste these lines
#include<stdio.h>
int main()
{
  int i,j;
  for(i=1;i<=9;i++){
    for(j=1;j<=9;j++){
      printf("%dx%d=%d\t",j,i,i*j);
    }
    printf("\n");
  }
}
### << END: Paste these lines

# Compile the program
gcc 9x9.c -o 9x9
