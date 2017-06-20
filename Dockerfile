FROM hub.alterway.fr/library/python:3.5

ADD ./requirements.txt /tmp

RUN pip install -U pip && \
    pip install -r  /tmp/requirements.txt

ADD ./src /src

WORKDIR /src

ENTRYPOINT ["python", "docker_stats_to_rocket.py"]