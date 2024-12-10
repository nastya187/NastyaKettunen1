CREATE OR REPLACE FUNCTION insert_airline(name VARCHAR, country VARCHAR) 
RETURNS VOID AS $$
BEGIN
    INSERT INTO Airlines (name, country) VALUES (name, country);
    RAISE NOTICE 'Запись вставлена';
EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Ошибка: %', SQLERRM;
END;
$$ LANGUAGE plpgsql;
