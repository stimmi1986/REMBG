FROM python:3.12-slim

# download this https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx
# copy model to avoid unnecessary download

RUN curl https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["python", "app.py"]