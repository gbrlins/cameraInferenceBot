# Imagem docker para camera

Created: October 21, 2024 10:59 AM

### Descrição

A imagem descrita usa a biblioteca ultralytics Yolov5 para, dentro do treinamento padrão, assim que reconhecer um rosto humano, tirar foto e mandar para um bot no telegram.

A recomendação é utilizar para monitoramento de segurança e sistema contra invasão e/ou detecção de pessoas.

### Pré requisito

1. Criar um bot no telegram via API: seguir o procedimento de criação usando o BotFather ([https://t.me/botfather](https://t.me/botfather)). Ao criar, tenha anotado o `token` de uso único e não deve ser compartilhado e o `chatID` da conversa. Todo o procedimento está descrito nessa página: https://gist.github.com/nafiesl/4ad622f344cd1dc3bb1ecbe468ff9f8a
2. Possuir uma câmera disponível para a detecção da imagem. Essa câmera pode tanto ser uma webcam adicionada ao dispositivo que irá hospedar o container ou um dispositivo de câmera com IP (recomendado).

---

### Sobre as imagens disponíveis:

As imagens disponíveis estão nesse dockerhub ([https://hub.docker.com/repository/docker/gabriellins/camerainferencebot/general](https://hub.docker.com/repository/docker/gabriellins/camerainferencebot/general))

obs: Atentar-se para as tags das imagens. Todas estão sendo geradas com versão para arm e x86;

1.0-ultralytics: Usa como imagem base o ultralytics/yolov5. 

Entradas: por padrão, foi desenvolvida amarrada ao IP final .32 e usa a conta padrão; Para chama-la basta:

```jsx
docker run gabriellins/camerainferencebot:1.0-ultralytics 
```

1.0-ultralytics-global: Imagem totalmente personalizável que espera como entrada:

--source '[0]/[rtsp:<email>:<senha>@<ip>/<stream>]'

--chat-id '[`chatID`]'

--token '[`token`]'

--imgsz 256

Para usá-la basta 

```jsx
docker run -e WEIGHTS="yolov5s.pt" -e SOURCE="rtsp://<email>:<senha>/stream1" -e CHAT_ID="<chatID>" -e TOKEN="<token>" gabriellins/camerainferencebot:1.0-ultralytics-global
```

---

### Melhorias a serem feitas

1. Usar imagem base SUSE python
2. Verificar se a forma utilizada para converter as variáveis de entrada foi a recomendada
    1. Pensar em utilizar sidecar para injetar essas conversões no script padrão



### Usando fora do container
Primeiro chamar git clone https://github.com/ultralytics/yolov5.git

Entra na pasta yolov5, move o arquivo 'detect-mod.py' para dentro de yolov5

python3 .\yolov5\detect-mod.py --weights yolov5s.pt --source 0 --chat-id -1002409785541 --token <token> --imgsz 128

python3 yolov5/detect-mod.py --weights yolov5s.pt --source 'rtsp://<EMAIL>:<SENHA>@192.168.1.32/stream2' --chat-id -1002409785541 --token <TOKEN> --imgsz 128


O Dockerfile foi criado com um padrão, mas se quiser alterar chamar o container assim:

docker run nome-do-container --source 'rtsp://outro_stream' --chat-id '-1001234567890' --token '<TOKEN>' --imgsz 256
