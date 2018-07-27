FROM python:3.6.6

WORKDIR /docker_build
ADD ./requirements.txt /docker_build
ADD ./Pipfile /docker_build
ADD ./Pipfile.lock /docker_build

RUN pip install --no-cache-dir -r requirements.txt
RUN pipenv install --system --deploy --ignore-pipfile

WORKDIR /
RUN django-admin startproject app

WORKDIR /app
EXPOSE 80

CMD [ "python", "manage.py", "runserver", "0.0.0.0:80" ]
