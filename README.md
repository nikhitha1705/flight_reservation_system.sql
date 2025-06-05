
# ✈️ Flight Reservation System – SQL Project

## 📌 Project Overview
This project is a complete SQL-based **Flight Reservation System** designed to manage flight schedules, bookings, payments, and passenger information. It is ideal for academic submissions, resumes, or backend practice.

## 🗃️ Database Design

### Tables:
- **Passengers**: Stores passenger details
- **Airlines**: Stores airline names and codes
- **Airports**: Stores airport details by city and country
- **Flights**: Stores flight info, including from/to airports
- **Bookings**: Stores passenger bookings and status
- **Payments**: Tracks payment information for bookings

📊 **[ER Diagram Included](./flight_reservation_er_diagram.png)**

## 🔑 Features
- Add and manage flight schedules
- Book tickets for passengers
- Track payment for each booking
- View upcoming flights and booking history
- Query total revenue for each flight

## 🛠️ Technologies Used
- **SQL**
- Compatible with MySQL / PostgreSQL / SQLite

## 🧪 Sample Queries

### 1. Available Flights from Hyderabad to Bangalore:
```sql
SELECT f.flight_id, a.name AS airline, f.departure_time, f.arrival_time
FROM Flights f
JOIN Airlines a ON f.airline_id = a.airline_id
JOIN Airports ap1 ON f.from_airport_id = ap1.airport_id
JOIN Airports ap2 ON f.to_airport_id = ap2.airport_id
WHERE ap1.city = 'Hyderabad' AND ap2.city = 'Bangalore';
```

### 2. All Bookings of a Passenger:
```sql
SELECT b.booking_id, f.flight_id, f.departure_time, b.status
FROM Bookings b
JOIN Flights f ON b.flight_id = f.flight_id
WHERE b.passenger_id = 101;
```

### 3. Total Revenue per Flight:
```sql
SELECT f.flight_id, SUM(p.amount) AS total_revenue
FROM Flights f
JOIN Bookings b ON f.flight_id = b.flight_id
JOIN Payments p ON b.booking_id = p.booking_id
WHERE f.flight_id = 1001
GROUP BY f.flight_id;
```

## 📁 Files Included
- `flight_reservation_system.sql` – Full database schema and data
- `flight_reservation_er_diagram.png` – ER diagram of the system
- `README.md` – This documentation

---

## 📚 Author
**Bharath Kumar**  
Final Year B.Tech | Computer Science & AI  
[LinkedIn](#) | [GitHub](#)

---
✅ Perfect for resume, interviews, or internships!

