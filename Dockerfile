FROM cr.freeb.vip/freeb/filebrowser-cache:latest AS builder
COPY . /app
RUN export GOPROXY=https://goproxy.cn,direct && make build


FROM cr.freeb.vip/docker/library/alpine:latest
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

COPY docker_config.json /.filebrowser.json
COPY --from=builder /app/filebrowser /app/filebrowser

VOLUME /app/data
EXPOSE 7000

ENTRYPOINT [ "/app/filebrowser" ]