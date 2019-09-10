# chatti_alpha
API通信で利用できるチャットルームアプリα版

# USAGE
## 1. トークン発行
POST: /api/users へ、以下の`body`を付与してHTTPリクエストを送ってください。

```
{"uid": 1,
 "name": "user",
 "room_id": 1,
 "room_name": "chatti",
 "tenant_id": 1
}
```

bodyが正しい場合、bodyの情報を含んだJWTトークンが返却されます。

トークン発行コマンド例：

```
curl -i -X POST -H "Content-Type: application/json" \
https://chatti-alpha.herokuapp.com/api/users \
-d '{"uid":1, "name":"user", "room_id":1, "room_name":"chatti", "tenant_id":1}'
```

## 2. チャットログイン
1. で返却されたJWTトークンを使いチャットにログインします。
GET: /room  にクエリパラメータで、 `?token=発行されたJWTトークン` を付与してください

例：
> room?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJKb2tlbiIsImV4cCI6MTU2Nzk2NzY2OCwiaWF0IjoxNTY3OTYwNDY4LCJpc3MiOiJKb2tlbiIsImp0aSI6IjJuMTg3Zjk4M2k0dTMxdGo1NDAwMDAwNSIsIm5hbWUiOiLoqrDjgaAiLCJuYmYi...

α版では、1. トークン発行の`room_id`の情報に基づき、同じ`room_id`の投稿のみ表示されます。
