FROM python:3.7.16

WORKDIR /Academic_Repositories/volterra-net

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
# RUN wget https://download.pytorch.org/whl/cu92/torch-0.4.1-cp37-cp37m-linux_x86_64.whl
RUN wget https://download.pytorch.org/whl/cu92/torch-0.4.1.post2-cp37-cp37m-linux_x86_64.whl
# RUN pip install torch-0.4.1-cp37-cp37m-linux_x86_64.whl
RUN pip install torch-0.4.1.post2-cp37-cp37m-linux_x86_64.whl
RUN git clone https://github.com/jonkhler/s2cnn.git
RUN python s2cnn/setup.py install
COPY . .   

WORKDIR /
RUN git clone https://github.com/jonkhler/s2cnn.git
WORKDIR /s2cnn
RUN git checkout 3d3d2cebebfe9a13bb60f5ac9c4bfa55989ca853
RUN python setup.py install

WORKDIR /Academic_Repositories/volterra-net
# RUN chmod +x run_experiment.sh
CMD [ "./run_experiment.sh"]