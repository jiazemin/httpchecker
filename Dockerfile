FROM alpine

RUN apk --no-cache add curl bash

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]