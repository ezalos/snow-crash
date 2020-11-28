FROM debian:latest
RUN apt-get upgrade -y && apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y ssh
RUN apt-get install -y john
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tshark
RUN git clone https://github.com/longld/peda.git