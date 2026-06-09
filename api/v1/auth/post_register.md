# Регистрация нового пользователя

Метод создает новый аккаунт в системе и автоматически выделяет стартовый демо-баланс.

* **URL метода:** `/api/v1/auth/register`
* **HTTP-метод:** `POST`
* **Заголовки (Headers):** `Content-Type: application/json`

### Тело запроса (Request Body):
```json
{
  "username": "player_123",
  "password": "super_secret_password"
}
```
### Ответ сервера при успехе (HTTP 201 Created):

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