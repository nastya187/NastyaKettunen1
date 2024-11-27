
UPDATE personnel
SET surname = 'Иванов' 
WHERE id = 1; 

UPDATE Airplane
SET model = 'Boeing 747'
WHERE number_registration = 'AB123'; 

UPDATE Salary
SET qualification = 'Старший пилот'
WHERE id_personnel IN (
    SELECT id FROM personnel WHERE post = 'пилот' AND age > 30
); 

UPDATE Flights
SET status_flight = 'Задержан', arrival_time = '20:00:00'
WHERE departure_date < DATE('now');

UPDATE Flights
SET status_flight = 'Отменен'
WHERE id = 1;  -- Замените 1 на нужный ID рейса