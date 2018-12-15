FROM python:3.6-alpine
LABEL maintainer="medmrgh"

COPY Dockerfile /
COPY /scripts/entrypoint.sh /

RUN    apk --no-cache add --virtual=.build-dep build-base \
    && apk --no-cache add libzmq \
    && pip install --no-cache-dir locustio==0.9.0 \
    && apk del .build-dep \
    && chmod +x /entrypoint.sh

RUN  mkdir /locust
COPY /locust-scripts/locustfile.py /locust

WORKDIR /locust
EXPOSE 8089 5557 5558

ENTRYPOINT ["/entrypoint.sh"]
