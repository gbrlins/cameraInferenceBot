# Usar uma imagem base leve com Python
FROM registry.suse.com/bci/python:3.12

# Diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar os arquivos necessários para o contêiner
#COPY . .
COPY yolov5/models /app/yolov5/models
COPY yolov5/utils /app/yolov5/utils
COPY yolov5/data /app/yolov5/data
COPY yolov5/detect-mod.py /app/yolov5/detect-mod.py
COPY yolov5/requirements.txt /app/yolov5/requirements.txt

# Instalar as dependências
RUN pip install --no-cache-dir -r yolov5/requirements.txt

# Definir o ponto de entrada para o contêiner
ENTRYPOINT ["python3", "yolov5/detect-mod.py", "--weights", "yolov5s.pt", "--source"]
CMD ["rtsp://linsgabriel@hotmail.com:Pamw1404*@192.168.1.32/stream2", "--chat-id", "-1002409785541", "--token", "7153243257:AAFJ3hFCneP3QSQY2UwTSm-yO0vW0sKcjSA", "--imgsz", "128"]
