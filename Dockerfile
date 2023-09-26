FROM python:3.9-alpine3.13
LABEL authors="Adam Lapidoth"

ENV PYTHONBUFFERED 1

COPY ./requirements.txt /tmp/requirement.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

RUN python -m venv /py &&\
    /py/bin/pip install --upgrate pip && \
    /py/bin/pip install -r /tmp/requirements.txt \
    rm -rf /tmp && \
    adduser \
    --disablrd-password \
    --no-create-home \
    django-user

ENV PATH="/py/bin:$PATH"

USER django-user