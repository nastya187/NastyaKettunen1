   DELETE FROM Airlines
   WHERE id IN (
       SELECT id FROM Airlines
       ORDER BY id
       LIMIT 3
   );
   Airlines
   
     DELETE FROM Airplane
   WHERE id IN (
       SELECT id FROM Airplane
       WHERE date_manufacture < DATE('2015-01-01')
       ORDER BY id
       LIMIT 3
   );
   
      DELETE FROM Passengers
   WHERE id IN (
       SELECT id FROM Passengers
       ORDER BY id
       LIMIT 3
   );
   
   
      DELETE FROM Flights
   WHERE id IN (
       SELECT id FROM Flights
       WHERE status_flight = 'Отменён'  
       ORDER BY id
       LIMIT 3
   );
   
    DELETE FROM Employees
   WHERE id IN (
       SELECT id FROM Employees
       WHERE termination_date < DATE('2020-01-01') 
       ORDER BY id
       LIMIT 3
   );
   
   
   