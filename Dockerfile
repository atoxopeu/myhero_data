FROM alpine:3.11
EXPOSE 5000
MAINTAINER Julio Gomez "jgomez2@cisco.com"

VOLUME ["/app/data"]

# Install python, pip and basic utilities
RUN apk add -U \
        python \
        py-pip \
        ca-certificates \
  && rm -rf /var/cache/apk/* \
  && pip install --no-cache-dir \
          setuptools \
          wheel

# This is failing for some odd pip upgrade error commenting out for now
#RUN pip install --upgrade pip

ADD . /app
WORKDIR /app
RUN pip install --requirement ./requirements.txt

CMD [ "python", "./myhero_data/myhero_data.py" ]

