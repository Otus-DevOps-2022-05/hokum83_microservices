FROM python:3.6.0-alpine

WORKDIR /app
COPY . /app

RUN apk --no-cache --update add build-base=0.4-r1 musl-dev=1.1.14-r16 \
  && pip install --upgrade --no-cache-dir pip==21.3.1 \
  && pip install --upgrade --no-cache-dir -r /app/requirements.txt \
  && apk del build-base

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

ENTRYPOINT ["python3", "post_app.py"]
