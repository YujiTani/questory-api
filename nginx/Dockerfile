FROM nginx:alpine

# 環境変数を展開するためのパッケージをインストール
RUN apk --no-cache add libintl && \
  apk --no-cache add --virtual .gettext gettext && \
  cp /usr/bin/envsubst /usr/local/bin/envsubst && \
  apk del .gettext

RUN apk --no-cache add vim

# nginx.conf.templateをコピー
COPY /nginx/nginx.conf.template /etc/nginx/

# ホストマシンの静的ファイルをコンテナのドキュメントルートにコピー
COPY ./static/50x.html /var/www/html/50x.html
COPY ./static/image /var/www/html/image

CMD /bin/sh -c "envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"