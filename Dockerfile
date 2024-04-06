FROM python:3.12-slim

# download this https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx
# copy model to avoid unnecessary download
RUN mkdir -p /app

RUN wget https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx -O /app/u2net.onnx

WORKDIR /app

RUN pip install --upgrade pip

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["python", "app.py"]