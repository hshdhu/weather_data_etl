# Base image
FROM apache/airflow:2.9.1-python3.10

WORKDIR /opt/airflow

# Install Java (Spark)
USER root
RUN apt-get update && apt-get install -y openjdk-17-jdk && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Copy & install dependencies
COPY requirements.txt .
USER airflow
RUN pip install --no-cache-dir -r requirements.txt

# Copy project source (trừ logs vì đã có .dockerignore)
COPY . .

# Expose Flask nếu có app.py
EXPOSE 5000

CMD ["bash", "-c", "airflow db init && airflow webserver & airflow scheduler & python app.py"]

