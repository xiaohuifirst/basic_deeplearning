# base image
FROM ubuntu:16.04

MAINTAINER hhp <hanxiaohui93@163.com>

# install basic dependencies
RUN apt-get update
RUN apt-get install -y wget  bzip2 \
                   libgl1-mesa-glx
# install Anaconda3 python3.6
RUN wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh -O ~/anaconda3.sh
RUN bash ~/anaconda3.sh -b -p /usr/local/anaconda3 \
                   && rm ~/anaconda3.sh
ENV PATH /usr/local/anaconda3/bin:$PATH
# update repo
#RUN sh -c echo -e "y\n" | conda update conda
RUN pip install --upgrade pip
# install tensorflow
#RUN pip install --upgrade tensorflow
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ tensorflow==1.12.0
# solve import warning
RUN pip install --upgrade h5py
