-- Flight Reservation System SQL Project

-- 1. Create Database and Use It
CREATE DATABASE IF NOT EXISTS passengers;
USE passengers;

-- 2. Create Tables

CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE Airlines (
    airline_id INT PRIMARY KEY,
    name VARCHAR(50),
    code VARCHAR(10)
);

CREATE TABLE Airports (
    airport_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    airline_id INT,
    from_airport_id INT,
    to_airport_id INT,
    departure_time DATETIME,
    arrival_time DATETIME,
    seat_capacity INT,
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id),
    FOREIGN KEY (from_airport_id) REFERENCES Airports(airport_id),
    FOREIGN KEY (to_airport_id) REFERENCES Airports(airport_id)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    seat_number INT,
    status VARCHAR(10),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_mode VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- 3. Insert Sample Data

INSERT INTO Airlines VALUES (1, 'Air India', 'AI'), (2, 'IndiGo', '6E');

INSERT INTO Airports VALUES
(1, 'Rajiv Gandhi Intl', 'Hyderabad', 'India'),
(2, 'Kempegowda Intl', 'Bangalore', 'India');

INSERT INTO Passengers VALUES
(101, 'Bharath Kumar', 'bharath@example.com', '9876543210');

INSERT INTO Flights VALUES
(1001, 1, 1, 2, '2025-06-10 10:00:00', '2025-06-10 12:00:00', 180);

INSERT INTO Bookings VALUES
(201, 101, 1001, '2025-06-01', 15, 'Confirmed');

INSERT INTO Payments VALUES
(301, 201, 5000.00, '2025-06-01', 'UPI');

-- 4. Sample Queries

-- Available Flights Between Cities
SELECT f.flight_id, a.name AS airline, f.departure_time, f.arrival_time
FROM Flights f
JOIN Airlines a ON f.airline_id = a.airline_id
JOIN Airports ap1 ON f.from_airport_id = ap1.airport_id
JOIN Airports ap2 ON f.to_airport_id = ap2.airport_id
WHERE ap1.city = 'Hyderabad' AND ap2.city = 'Bangalore';

-- Bookings for a Passenger
SELECT b.booking_id, f.flight_id, f.departure_time, b.status
FROM Bookings b
JOIN Flights f ON b.flight_id = f.flight_id
WHERE b.passenger_id = 101;

-- Total Revenue for a Flight
SELECT f.flight_id, SUM(p.amount) AS total_revenue
FROM Flights f
JOIN Bookings b ON f.flight_id = b.flight_id
JOIN Payments p ON b.booking_id = p.booking_id
WHERE f.flight_id = 1001
GROUP BY f.flight_id;
