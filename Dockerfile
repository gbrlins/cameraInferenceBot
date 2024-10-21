# Usar uma imagem base leve com Python
#FROM registry.suse.com/bci/python:3.12
FROM ultralytics/yolov5
# Diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar os arquivos necessários para o contêiner
COPY . .

# Instalar as dependências
RUN pip install -r yolov5/requirements.txt
RUN chmod +x start.sh

# Definir o ponto de entrada para o contêiner
#ENTRYPOINT ["python", "yolov5/detect-mod.py"]
#CMD ["--weights", "yolov5s.pt", "--source", "rtsp://linsgabriel@hotmail.com:Pamw1404*@192.168.1.34/stream1", "--chat-id", "-1002409785541", "--token", "7153243257:AAFJ3hFCneP3QSQY2UwTSm-yO0vW0sKcjSA"]

CMD ["./start.sh"]
