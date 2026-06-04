# Получение детальной информации о матче

Метод возвращает полную роспись всех доступных исходов и коэффициентов для конкретного матча.

* **URL метода:** `/api/v1/matches/detail`
* **HTTP-метод:** `GET`
* **Авторизация:** Не требуется

### Параметры запроса (Query Parameters)

| Параметр | Тип данных | Обязательный | Описание |
| :--- | :--- | :--- | :--- |
| `match_id` | Integer | Да | Уникальный идентификатор матча в системе |

### Успешный ответ (Response 200 OK)

Сервер возвращает полные данные о матче и структурированный список всех доступных рынков ставок (маркетов) и их исходов:

```json
{
  "status": "success",
  "data": {
    "match_id": 85732,
    "sport_id": "football",
    "league_name": "Лига Чемпионов УЕФА",
    "home_team": "Фенербахче",
    "away_team": "Галатасарай",
    "start_time": "2026-06-03T20:00:00Z",
    "match_type": "live",
    "current_score": "2:1",
    "markets": [
      {
        "market_id": "main_outcome",
        "market_name": "Основной исход (90 минут)",
        "outcomes": [
          { "outcome_id": 1001, "outcome_name": "Победа 1", "coefficient": 1.85 },
          { "outcome_id": 1002, "outcome_name": "Ничья", "coefficient": 3.40 },
          { "outcome_id": 1003, "outcome_name": "Победа 2", "coefficient": 4.20 }
        ]
      },
      {
        "market_id": "match_winner",
        "market_name": "Победа в матче (с учетом ОТ и пенальти)",
        "outcomes": [
          { "outcome_id": 1004, "outcome_name": "Победа 1", "coefficient": 1.52 },
          { "outcome_id": 1005, "outcome_name": "Победа 2", "coefficient": 2.45 }
        ]
      },
      {
        "market_id": "total_goals_2.5",
        "market_name": "Тотал голов (2.5)",
        "outcomes": [
          { "outcome_id": 2001, "outcome_name": "Больше 2.5", "coefficient": 1.75 },
          { "outcome_id": 2002, "outcome_name": "Меньше 2.5", "coefficient": 2.08 }
        ]
      },
      {
        "market_id": "handicap_1.5",
        "market_name": "Фора (1.5)",
        "outcomes": [
          { "outcome_id": 3001, "outcome_name": "Фора 1 (-1.5)", "coefficient": 3.10 },
          { "outcome_id": 3002, "outcome_name": "Фора 2 (+1.5)", "coefficient": 1.38 }
        ]
      }
    ]
  }
}
```

### Описание параметров успешного ответа

| Параметр | Тип данных | Обязательный | Описание |
| :--- | :--- | :--- | :--- |
| `match_id` | Integer | Да | Уникальный идентификатор матча |
| `sport_id` | String | Да | Текстовый идентификатор вида спорта (`football`, `hockey`) |
| `league_name` | String | Да | Название турнира / лиги |
| `home_team` | String | Да | Название команды хозяев |
| `away_team` | String | Да | Название команды гостей |
| `start_time` | String (ISO 8601) | Да | Дата и время начала матча в формате UTC |
| `match_type` | String | Да | Тип линии: `prematch` или `live` |
| `current_score` | String | Нет | Текущий счет матча (передается только для `live`) |
| `markets` | Array | Да | Массив доступных рынков ставок (маркетов) |
| `market_id` | String | Да | Уникальный идентификатор маркета (`main_outcome`, `handicap_1.5`) |
| `market_name` | String | Да | Название маркета для отображения на экране |
| `outcomes` | Array | Да | Массив конкретных вариантов исходов внутри данного маркета |
| `outcome_id` | Integer | Да | Уникальный идентификатор конкретного исхода для оформления ставки |
| `outcome_name` | String | Да | Название исхода для пользователя (`Победа 1`, `Фора 1 (-1.5)`) |
| `coefficient` | Float / Null | Да | Значение коэффициента. Может быть `null`, если прием ставок временно заблокирован |