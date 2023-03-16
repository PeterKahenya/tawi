FROM python:3.10.7-alpine
WORKDIR /app

COPY requirements.txt requirements.txt

RUN apk add python3-dev \ 
            mariadb-connector-c-dev \
            mariadb-client \
            build-base \
    && rm -rf /var/cache/apk/* \
    && pip install pip --upgrade \
    && pip install -r requirements.txt \
    && apk del --purge build-base python3-dev

COPY . .

RUN chmod +x entrypoint.sh

CMD ["/app/entrypoint.sh"]