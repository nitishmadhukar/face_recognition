FROM python:3.10
RUN apt-get update -y
RUN apt-get install ffmpeg libsm6 libxext6 python3-pip python3-dev  -y
RUN pip install flask deepface
WORKDIR /app
COPY . /app

CMD ["python", "./api.py"]
