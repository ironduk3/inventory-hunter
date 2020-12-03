FROM python:3.9
RUN apt update
RUN apt install -y chromium chromium-driver locales locales-all

ENV LC_ALL en_GB.UTF8
ENV LANG en_GB.UTF8
ENV LANGUAGE en_GB.UTF8

WORKDIR /
ARG requirements=requirements.txt
COPY $requirements /src/requirements.txt
RUN pip install -r /src/requirements.txt
COPY src /src

ENTRYPOINT ["python", "/src/run.py"]
