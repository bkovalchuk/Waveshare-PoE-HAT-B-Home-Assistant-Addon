ARG BUILD_FROM
FROM $BUILD_FROM

SHELL [ "/bin/bash", “-c” ]

# Install requirements for add-on

RUN \
  apk add --no-cache \
    python3 \
    openjpeg \
    tiff \
    openblas-dev \
    py3-pip

FROM python:3
RUN \
  pip install --no-cache-dir pillow && \
  pip install --no-cache-dir numpy && \
  pip3 install --no-cache-dir RPi.GPIO && \
  pip3 install --no-cache-dir smbus

COPY . .
RUN chmod a+x /.

CMD [ "python", "./bin/main.py" ]

