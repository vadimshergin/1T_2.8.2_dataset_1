CREATE TABLE IF NOT EXISTS stations (
    latitude NUMERIC(7,5),
    "location" VARCHAR(128),
    longitude NUMERIC(7,5),
    "name" VARCHAR(128),
    station_id NUMERIC PRIMARY KEY,
    "status" VARCHAR(128)
);

CREATE TABLE IF NOT EXISTS trips (
    bikeid FLOAT,
    checkout_time TIME,
    duration_minutes NUMERIC,
    end_station_id NUMERIC REFERENCES stations(station_id),
    end_station_name VARCHAR(256),
    "month" NUMERIC,
    start_station_id NUMERIC REFERENCES stations(station_id),
    start_station_name VARCHAR(256),
    start_time TIMESTAMP,
    subscriber_type VARCHAR(256),
    trip_id NUMERIC PRIMARY KEY,
    trip_year NUMERIC 
);

COPY stations (
    latitude,
    "location",
    longitude,
    "name",
    station_id,
    "status"
)
    FROM '/userfiles/austin_bikeshare_stations.csv' DELIMITER ',' CSV HEADER;


COPY trips (
    bikeid,
    checkout_time,
    duration_minutes,
    end_station_id,
    end_station_name,
    "month",
    start_station_id,
    start_station_name,
    start_time,
    subscriber_type,
    trip_id,
    trip_year
)
    FROM '/userfiles/austin_bikeshare_trips.csv' DELIMITER ',' CSV HEADER;