# 📷 Imagem Docker para Câmera

**Criado em:** 21 de Outubro de 2024 às 10:59 AM

## 📜 Descrição

Esta imagem Docker utiliza a biblioteca [Ultralytics YOLOv5](https://github.com/ultralytics/yolov5) para realizar a detecção de rostos humanos. Assim que um rosto é reconhecido, o sistema captura uma foto e a envia para um bot no Telegram. 

### 💡 Objetivo

O objetivo principal desta aplicação é oferecer uma solução para **monitoramento de segurança**, podendo ser usada como sistema de prevenção contra invasões e para **detecção de pessoas** em ambientes variados.

---

## 🛠️ Pré-requisitos

Antes de utilizar a imagem Docker, é necessário seguir alguns passos:

1. **Criar um bot no Telegram via API**: 
   - Utilize o [BotFather](https://t.me/botfather) para criar um bot. 
   - Anote o `token`, que é único e deve ser mantido em segredo, e o `chatID` da conversa. 
   - Um guia detalhado sobre como criar o bot pode ser encontrado [neste link](https://gist.github.com/nafiesl/4ad622f344cd1dc3bb1ecbe468ff9f8a).

2. **Câmera disponível**:
   - Certifique-se de ter uma câmera acessível para a detecção de imagem. Pode ser uma webcam conectada ao dispositivo que irá hospedar o container ou uma câmera IP (recomendado).

---

## 🖼️ Imagens Disponíveis

As imagens Docker estão disponíveis no Docker Hub: [Camerainferencebot](https://hub.docker.com/repository/docker/gabriellins/camerainferencebot/general).

### ⚠️ Atenção às Tags

As imagens são geradas para arquiteturas ARM e x86. Confira as tags disponíveis:

- **`1.0-ultralytics`**: Utiliza como imagem base o `ultralytics/yolov5`. 
  - **Entradas**: Por padrão, a imagem é configurada para usar o IP final `.32` e a conta padrão. Para executá-la, use:

    ```bash
    docker run gabriellins/camerainferencebot:1.0-ultralytics 
    ```

- **`1.0-ultralytics-global`**: Imagem totalmente personalizável que espera as seguintes entradas:
  - `--source '[0]/[rtsp:<email>:<senha>@<ip>/<stream>]`
  - `--chat-id '[chatID]'`
  - `--token '[token]'`
  - `--imgsz 256`

  Para executá-la, utilize:

  ```bash
  docker run -e WEIGHTS="yolov5s.pt" \
             -e SOURCE="rtsp://<email>:<senha>/stream1" \
             -e CHAT_ID="<chatID>" \
             -e TOKEN="<token>" \
             gabriellins/camerainferencebot:1.0-ultralytics-global
