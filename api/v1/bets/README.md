# Спецификация эндпоинта: Размещение ставки

| Параметр | Описание / Данные |
| :--- | :--- |
| URL эндпоинта | /api/v1/bets/ |
| HTTP Метод | POST |
| Заголовки (Headers) | 1. Authorization: Bearer <JWT_TOKEN> (Авторизация)<br>2. Idempotency-Key: <UUID> (Защита от повторов) |

---

## Структура данных (JSON)

### 1. Тело запроса (Request Body)
```json
{
  "match_id": 19724,
  "outcome": "W1",
  "coefficient": 2.15,
  "amount": 500.00
}
```

### 2. Успешный ответ сервера (Response: 200 OK)
```json
{
  "status": "success",
  "bet_id": "b8a91c72-411a",
  "balance_remaining": 4500.00
}
```

### 3. Ответ при ошибке (Response: 400 Bad Request)
```json
{
  "status": "error",
  "code": "INSUFFICIENT_FUNDS",
  "message": "Недостаточно средств на балансе"
}
```