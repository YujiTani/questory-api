FROM nginx:alpine

# 環境変数を展開するためのパッケージをインストール
RUN apk --no-cache add libintl && \
  apk --no-cache add --virtual .gettext gettext && \
  cp /usr/bin/envsubst /usr/local/bin/envsubst && \
  apk del .gettext

COPY /nginx/nginx.conf.template /etc/nginx/
CMD /bin/sh -c "envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"