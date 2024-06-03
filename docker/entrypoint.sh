#!/bin/bash
# set -e はエラーが発生したら終了する
set -e

# 古いサーバープロセスファイルの削除
rm -f /app/tmp/pids/server.pid

# Dockerfileの CMD で指定されたコマンドを実行します
exec "$@"