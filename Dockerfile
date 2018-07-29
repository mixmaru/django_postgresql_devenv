FROM python:3.6.6

WORKDIR /docker_build
ADD ./requirements.txt /docker_build
ADD ./Pipfile /docker_build
ADD ./Pipfile.lock /docker_build

RUN pip install --no-cache-dir -r requirements.txt
RUN pipenv install --system --ignore-pipfile

WORKDIR /app
EXPOSE 8000
