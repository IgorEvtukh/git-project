# Получение истории ставок пользователя

Метод возвращает список всех купонов (ставок), которые совершил игрок, с их текущими статусами и результатами расчета.

* URL метода: /api/v1/bets/history
* HTTP-метод: GET
* Авторизация: Требуется (Токен пользователя)

### Успешный ответ (Response 200 OK)

Сервер возвращает статус успеха и массив bets со списком всех ставок пользователя:

```json
{
  "status": "success",
  "data": {
    "bets": [
      {
        "bet_id": 948271,
        "created_at": "2026-06-03T14:20:00Z",
        "match_id": 85732,
        "match_name": "Фенербахче - Галатасарай",
        "outcome_name": "Победа хозяев",
        "coefficient": 2.10,
        "bet_amount": 1000.00,
        "status": "won",
        "payout_amount": 2100.00
      },
      {
        "bet_id": 948250,
        "created_at": "2026-06-02T18:15:00Z",
        "match_id": 85611,
        "match_name": "Реал Мадрид - Боруссия Д",
        "outcome_name": "Ничья",
        "coefficient": 3.40,
        "bet_amount": 500.00,
        "status": "lost",
        "payout_amount": 0.00
      },
      {
        "bet_id": 948210,
        "created_at": "2026-06-01T12:00:00Z",
        "match_id": 85400,
        "match_name": "Ливерпуль - Челси",
        "outcome_name": "Тотал больше 2",
        "coefficient": 1.85,
        "bet_amount": 2000.00,
        "status": "refunded",
        "payout_amount": 2000.00
      },
      {
        "bet_id": 948300,
        "created_at": "2026-06-03T20:00:00Z",
        "match_id": 85999,
        "match_name": "Манчестер Сити - Арсенал",
        "outcome_name": "Победа гостей",
        "coefficient": 2.50,
        "bet_amount": 1500.00,
        "status": "pending",
        "payout_amount": 0.00
      }
    ]
  }
}
```