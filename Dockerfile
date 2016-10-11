
FROM python:3.5-slim

WORKDIR /opt/

RUN apt-get update && apt-get install -y --no-install-recommends \
        libpq-dev \
    && rm -rf /var/lib/apt/lists/*


COPY requirements.txt requirements.txt

RUN apt-get update && apt-get install -y --no-install-recommends \
        gcc \
    && rm -rf /var/lib/apt/lists/* \
    && pip install -r requirements.txt \
    && apt-get purge -y --auto-remove \
        gcc

RUN pip list --outdated

COPY ./ /opt/
CMD python manage.py migrate && \
    gunicorn heroes_symbiote.wsgi \
        -k gaiohttp \
        --bind 0.0.0.0:8000 \
        --log-file -
