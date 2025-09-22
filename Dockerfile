FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    libxslt-dev libxml2-dev libffi-dev libssl-dev build-essential git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

ENV PORT=8080
CMD ["python", "searx/webapp.py"]
