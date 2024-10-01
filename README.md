# 環境構築

- 1 touch .env
- 2 touch db/.env
- 3 1,2 の.env に対して環境変数を設定
- 4 docker compose up -d
- 5 docker compose exec app bash
- 6 rails db:migrate

**.env フォーマット**

```
MYSQL_ROOT_PASSWORD=
MYSQL_DATABASE=
MYSQL_USER=
MYSQL_PASSWORD=
```

**注意点**  
DB の healthCheck をしていないので、DB 起動が完了するまで migration を待つ
