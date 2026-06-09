# Авторизация пользователя (Вход)

Метод проверяет пароль и выдает JWT-токен для последующих защищенных операций (например, совершения ставок).

* **URL метода:** `/api/v1/auth/login`
* **HTTP-метод:** `POST`
* **Заголовки (Headers):** `Content-Type: application/json`

### Тело запроса (Request Body):

```json
{

  "username": "player_123",
  "password": "super_secret_password"
}
```

### Ответ при успехе сервера (HTTP 200 OK).

```json
{
  "status": "success",
  "data": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0NSwidXNlcm5hbWUiOiJwbGF5ZXJfMTIzIn0.signature_code",
    "expires_in": 86400
  }
}
```