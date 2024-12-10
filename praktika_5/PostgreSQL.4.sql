CREATE OR REPLACE PROCEDURE fill_airlines_randomly() 
LANGUAGE plpgsql AS $$
DECLARE
    names TEXT[] := ARRAY['Аэрофлот', 'S7 Airlines', 'Победа', 'UTair'];
    countries TEXT[] := ARRAY['Россия', 'США', 'Германия', 'Франция'];
BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO Airlines (name, country) 
        VALUES (names[FLOOR(RANDOM() * array_length(names, 1)) + 1], 
                countries[FLOOR(RANDOM() * array_length(countries, 1)) + 1]);
    END LOOP;
END;
$$;
