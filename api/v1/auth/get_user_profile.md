# Получение профиля пользователя

Метод возвращает данные текущего авторизованного игрока (включая актуальный баланс) на основе переданного JWT-токена.

* URL метода: /api/v1/auth/profile
* HTTP-метод: GET
* Заголовки (Headers): * Authorization: Bearer <token> (Строго обязательно)

### Ответ сервера при успехе (HTTP 200 OK):
```json
{
  "status": "success",
  "data": {
    "user_id": 45,
    "username": "player_123",
    "balance_available": 1000.00
  }
}
```