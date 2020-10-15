FROM alpine:latest

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

COPY ./files/content/requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

ADD ./files/content/ /app

EXPOSE 5000

ENTRYPOINT [ "python" ]

CMD [ "app/main.py" ]
