CREATE OR REPLACE FUNCTION count_passengers_by_age(min_age INTEGER) 
RETURNS INTEGER AS $$
DECLARE
    passenger_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO passenger_count FROM Passengers WHERE age::INTEGER >= min_age;
    RETURN passenger_count;
END;
$$ LANGUAGE plpgsql;
