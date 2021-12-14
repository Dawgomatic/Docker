FROM anibali/pytorch:1.8.1-cuda11.1-ubuntu20.04

# Set up time zone.
ENV TZ=UTC
RUN sudo ln -snf /usr/share/zoneinfo/$TZ /etc/localtime

# Install system libraries required by OpenCV.
RUN sudo apt-get update \
 && sudo apt-get install -y libgl1-mesa-glx libgtk2.0-0 libsm6 libxext6 \
 && sudo rm -rf /var/lib/apt/lists/*
 && sudo apt-get clean
 
RUN pip install --upgrade pip

COPY requirements.txt .
RUN pip install --no-cache -r requirements.txt

COPY ./code /opt/program
ENTRYPOINT ["python3", "/opt/program/serve.py"]

