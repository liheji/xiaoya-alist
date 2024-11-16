FROM xiaoyaliu/alist:hostmode

LABEL MAINTAINER me@yilee.top

ENV TZ=Asia/Shanghai

EXPOSE 5678

VOLUME /data

ARG TARGETARCH

RUN apk add --no-cache tzdata dumb-init

COPY --chmod=755 ./*.sh /

RUN /service.sh download

ENTRYPOINT [ "/usr/bin/dumb-init", "--", "/start.sh" ]

CMD []
