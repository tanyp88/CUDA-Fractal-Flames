FROM nvidia/cuda:11.4.3-base-ubuntu20.04
RUN apt -y update
RUN DEBIAN_FRONTEND=noninteractive apt -yq install git nano libtiff-dev cuda-toolkit-11-4
#RUN git config --global http.proxy http://10.8.11.11:3128
RUN git clone --depth 1 https://github.com/tanyp88/CUDA-Fractal-Flames /src
WORKDIR /src
RUN sed 's/4736/1024/' -i fractal_cuda.cu # Make the generated image smaller
RUN make
