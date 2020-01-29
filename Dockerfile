FROM ubuntu:18.04
RUN mkdir /bot
RUN chmod 777 /bot
WORKDIR /bot
COPY . .
RUN apt-get update && apt install -y curl && apt-get install -y apt-utils && apt install -y aria2 && apt install -y git && apt-get install p7zip-full p7zip-rar -y
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt install nodejs -y
RUN curl https://rclone.org/install.sh | bash
RUN rclone rcd --rc-web-gui --rc-user=rana --rc-pass=hi --rc-serve
RUN npm config set unsafe-perm true
RUN chmod -R 777 /bot
RUN npm install
