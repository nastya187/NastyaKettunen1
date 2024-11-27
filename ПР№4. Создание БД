CREATE TABLE Airlines ( 
  id INTEGER,
  name VARCHAR(100), 
  country VARCHAR(50)
);
CREATE TABLE Airplane (
    id INTEGER,
    airlines_id INTEGER,
    model VARCHAR(50) PRIMARY KEY,
    number_registration VARCHAR(10),
    number_seats VARCHAR(50),
    number_serial VARCHAR(50),
    date_manufacture DATE,
    operation_period VARCHAR(50),
    ready_departure VARCHAR(10),
    FOREIGN KEY (airlines_id) REFERENCES Airlines(id)
);
CREATE TABLE Passengers (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    surname VARCHAR(50),
    patronymic VARCHAR(50),
    age VARCHAR(20),
    date_dirth DATE,
    address VARCHAR(30),
    phone_number VARCHAR(20),
    passport_series VARCHAR(15),
    passport_number VARCHAR(15),
    loyalty_status VARCHAR(30)
);
CREATE TABLE Flights (
    id INTEGER,
    airplane_id INTEGER,
    number_flights INTEGER (100) PRIMARY KEY,
    departure_date DATE,
    arrival_date DATE,
    departure_time TIME,
    arrival_time TIME,
    status_flight VARCHAR(20),
    FOREIGN KEY (airplane_id) REFERENCES Airplane(id)
);
CREATE TABLE Tickets (
    id INTEGER PRIMARY KEY,
    passanger_id INTEGER,
    flight_id INTEGER,
    name_ticket VARCHAR(50),
    price VARCHAR(50),
    status_ticket VARCHAR(20),
    number_place INTEGER (30),
    FOREIGN KEY (passanger_id) REFERENCES Passengers(id),
    FOREIGN KEY (flight_id) REFERENCES Flights(id)
);
CREATE TABLE personnel (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    surname VARCHAR(50),
    patronymic VARCHAR(50),
    age INTEGER (5),
    Date_birth DATE,
    address VARCHAR(50),
    phone_number VARCHAR(20),
    post VARCHAR(50),
    airlines_id INTEGER,
    FOREIGN KEY (airlines_id) REFERENCES Airlines(id)
);
CREATE TABLE security_checks (
    id INTEGER PRIMARY KEY,
    data DATE,
    start_time TIME,
    end_time TIME,
    result VARCHAR(50),
    id_flights INTEGER,
    FOREIGN KEY (id_flights) REFERENCES Flights(id)
);
CREATE TABLE Reports (
    id INTEGER PRIMARY KEY,
    data DATE,
    type_reports VARCHAR(50),
    content VARCHAR(100),
    airlines_id INTEGER,
    FOREIGN KEY (airlines_id) REFERENCES Airlines(id)
);
CREATE TABLE Place (
    id INTEGER PRIMARY KEY,
    id_flights INTEGER,
    place_departure VARCHAR(50),
    place_arrival VARCHAR(50),
    FOREIGN KEY (id_flights) REFERENCES Flights(id)
);
CREATE TABLE Salary (
    id INTEGER PRIMARY KEY,
    id_personnel INTEGER,
    work_experience VARCHAR (20),
    qualification VARCHAR(50),
    FOREIGN KEY (id_personnel) REFERENCES personnel(id)
);
CREATE TABLE Loyality_Status (
    id INTEGER PRIMARY KEY,
    passengers_id INTEGER,
    scores VARCHAR(50),
    level VARCHAR(15),
    dateLast_update DATE,
    FOREIGN KEY (passengers_id) REFERENCES Passengers(id)
);
CREATE TABLE Employees (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    surname VARCHAR(50),
    patronymic VARCHAR(50),
    position VARCHAR(50),
    hire_date DATE,
    termination_date DATE,
    status VARCHAR(20) CHECK (status IN ('Работает', 'Уволен'))
);
