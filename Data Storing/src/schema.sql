DROP TABLE IF EXISTS results, races, drivers, teams, circuits CASCADE;

CREATE TABLE circuits (
    circuit_id SERIAL PRIMARY KEY,
    circuit_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL UNIQUE,
    points DECIMAL(5, 1),
    detail_url VARCHAR(255)
);

CREATE TABLE drivers (
    driver_id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams(team_id), 
    driver_name VARCHAR(100) NOT NULL,
    driver_number INTEGER,
    nationality VARCHAR(10),
    points DECIMAL(5, 1),
    detail_url VARCHAR(255)
);

CREATE TABLE races (
    race_id SERIAL PRIMARY KEY,
    circuit_id INTEGER REFERENCES circuits(circuit_id), 
    grand_prix VARCHAR(100) NOT NULL,
    race_date DATE,
    laps INTEGER,
    winner_name VARCHAR(100),
    time VARCHAR(50),
    detail_url VARCHAR(255)
);

CREATE TABLE results (
    result_id SERIAL PRIMARY KEY,
    race_id INTEGER REFERENCES races(race_id),    
    driver_id INTEGER REFERENCES drivers(driver_id), 
    position INTEGER,
    laps INTEGER,
    time_or_status VARCHAR(50),
    points DECIMAL(4, 1)
);