FROM python:3.8-alpine

ADD . /code

WORKDIR /code

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

RUN apk add --no-cache gcc musl-dev linux-headers
RUN apk --update add build-base jpeg-dev zlib-dev

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

EXPOSE 5000

COPY . .

CMD ["flask", "run"]