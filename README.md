Primeiro chamar git clone https://github.com/ultralytics/yolov5.git

Entra na pasta yolov5, move o arquivo 'detect-mod.py' para dentro de yolov5

python3 .\yolov5\detect-mod.py --weights yolov5s.pt --source 0 --chat-id -1002409785541 --token 7153243257:AAFJ3hFCneP3QSQY2UwTSm-yO0vW0sKcjSA --imgsz 128

python3 yolov5/detect-mod.py --weights yolov5s.pt --source 'rtsp://<EMAIL>:<SENHA>@192.168.1.32/stream2' --chat-id -1002409785541 --token 7153243257:AAFJ3hFCneP3QSQY2UwTSm-yO0vW0sKcjSA --imgsz 128


O Dockerfile foi criado com um padrão, mas se quiser alterar chamar o container assim:

docker run nome-do-container --source 'rtsp://outro_stream' --chat-id '-1001234567890' --token 'novo_token' --imgsz 256
