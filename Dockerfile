# FROM nvidia/cuda:11.6-devel-ubi7
# FROM python:3.7.16
FROM nvidia/cuda:11.6.0-devel-ubuntu18.04   


WORKDIR /Academic_Repositories/volterra-net

RUN apt update && apt install -y wget && apt install -y git && apt install -y python3.7 && apt install -y python3.7-distutils && rm -rf /var/lib/apt/lists/*
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.7 get-pip.py
COPY . . 
RUN pip3 install --no-cache-dir -r requirements.txt
RUN wget https://download.pytorch.org/whl/cu92/torch-0.4.1.post2-cp37-cp37m-linux_x86_64.whl
RUN pip3 install torch-0.4.1.post2-cp37-cp37m-linux_x86_64.whl

RUN LD_LIBRARY_PATH=/usr/local/cuda-11.6/compat
WORKDIR /
RUN git clone https://github.com/jonkhler/s2cnn.git
WORKDIR /s2cnn
RUN git checkout 3d3d2cebebfe9a13bb60f5ac9c4bfa55989ca853
RUN python3.7 setup.py install


WORKDIR /Academic_Repositories/volterra-net
RUN mv /s2cnn/s2cnn s2cnn
# RUN chmod +x run_experiment.sh
CMD [ "./run_experiment.sh"]