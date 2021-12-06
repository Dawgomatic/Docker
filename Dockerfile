FROM alpine:3

RUN apk add --no-cache --update \
    python3 python3-dev gcc \
    gfortran musl-dev \
    libffi-dev openssl-dev\
    py3-pip mysql-client git gfortran build-base musl linux-headers g++

RUN pip3 install setuptools wheel cython numpy
RUN pip3 install sklearn matplotlib torch torchvision scipy pandas pyteal gym gym-atari appnope backcall cycler decorator ipython ipython-genutils jedi joblib kiwisolver matplotlib nltk numpy opencv-python pandas parso pexpect pickleshare Pillow prompt-toolkit ptyprocess Pygments pyparsing python-dateutil pytz scikit-learn six tqdm traitlets wcwidth cython

RUN git clone https://github.com/Neurales/Neurales_Beta
