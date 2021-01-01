FROM python:3
ENV PYTHONUNBUFFERED=1

WORKDIR /usr/src

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
