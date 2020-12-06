# rails6_docker-compose_template

docker-compose を用いて Rails 6 アプリケーションの開発を始めるためのテンプレート


## 方針

* PostgreSQL を使用する。
* Sprockets を使わない。
* Webpacker を使う。

## 手順概要

* docker-compose で2個のコンテナ（`db` と `web`）を構築、起動、停止、破棄を行う。
* `web` コンテナにログインして `rails new` と、データベースの初期化を行う。

## コンテナ群の起動

```
% docker-compose up -d
```

## Web コンテナにログイン

```
% docker-compose exec web bash
```

※ ログアウトするには `exit` コマンドを実行するか、`Ctrl-D` を入力する。

## コンテナ群の停止

```
% docker-compose stop
```

## コンテナ群の破棄

```
% docker-compose down
```

## Web コンテナにログインして、 rails new

```
$ cd /apps
$ rails new myapp -BJS -d postgresql
```