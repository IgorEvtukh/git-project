-- 1. Таблица пользователей (храним баланс)
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    balance_available NUMERIC(12, 2) NOT NULL DEFAULT 0.00
);

-- 2. Таблица матчей (события линии)
CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    sport_id VARCHAR(30) NOT NULL,
    league_name VARCHAR(150) NOT NULL,
    home_team VARCHAR(100) NOT NULL,
    away_team VARCHAR(100) NOT NULL,
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    match_type VARCHAR(10) NOT NULL -- 'prematch' или 'live'
);

-- 3. Таблица маркетов (привязана к конкретному матчу через match_id)
CREATE TABLE markets (
    id VARCHAR(50) PRIMARY KEY, -- например, 'main_outcome'
    match_id INTEGER NOT NULL REFERENCES matches(id) ON DELETE CASCADE,
    market_name VARCHAR(150) NOT NULL
);

-- 4. Таблица исходов (привязана к маркету через market_id)
CREATE TABLE outcomes (
    id SERIAL PRIMARY KEY,
    market_id VARCHAR(50) NOT NULL REFERENCES markets(id) ON DELETE CASCADE,
    outcome_name VARCHAR(150) NOT NULL,
    coefficient NUMERIC(5, 2) -- Может быть NULL, если исход заблокирован
);

-- 5. Таблица ставок (связывает пользователя и исход, на который он ставит)
CREATE TABLE bets (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    outcome_id INTEGER NOT NULL REFERENCES outcomes(id),
    stake_amount NUMERIC(12, 2) NOT NULL,
    potential_win NUMERIC(12, 2) NOT NULL,
    bet_status VARCHAR(20) NOT NULL DEFAULT 'single_active', -- 'won', 'lost'
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

-- ИНДЕКСЫ ДЛЯ СКОРОСТИ РАБОТЫ (чтобы база не тормозила при нагрузках)
-- Ускоряет поиск истории ставок конкретного пользователя
CREATE INDEX idx_bets_user_id ON bets(user_id);

-- Ускоряет поиск всех маркетов внутри матча
CREATE INDEX idx_markets_match_id ON markets(match_id);

-- Ускоряет фильтрацию матчей (например, мгновенный выбор только 'live')
CREATE INDEX idx_matches_match_type ON matches(match_type);