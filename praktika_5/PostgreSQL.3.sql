CREATE OR REPLACE FUNCTION number_to_words(n INTEGER) 
RETURNS TEXT AS $$
DECLARE
    units TEXT[] := ARRAY['', 'один', 'два', 'три', 'четыре', 'пять', 'шесть', 'семь', 'восемь', 'девять'];
    teens TEXT[] := ARRAY['десять', 'одиннадцать', 'двенадцать', 'тринадцать', 'четырнадцать', 
                          'пятнадцать', 'шестнадцать', 'семнадцать', 'восемнадцать', 'девятнадцать'];
    tens TEXT[] := ARRAY['', '', 'двадцать', 'тридцать', 'сорок', 'пятьдесят', 
                         'шестьдесят', 'семьдесят', 'восемьдесят', 'девяносто'];
    hundreds TEXT[] := ARRAY['', 'сто', 'двести', 'триста', 'четыреста', 
                             'пятьсот', 'шестьсот', 'семьсот', 'восемьсот', 'девятьсот'];
    thousands TEXT := 'тысяча';
    result TEXT := '';
BEGIN
    IF n = 0 THEN
        RETURN 'ноль';
    END IF;

    IF n >= 1000 THEN
        result := result || units[n / 1000] || ' ' || thousands || ' ';
        n := n % 1000;
    END IF;

    IF n >= 100 THEN
        result := result || hundreds[n / 100] || ' ';
        n := n % 100;
    END IF;

    IF n >= 20 THEN
        result := result || tens[n / 10] || ' ';
        n := n % 10;
    ELSIF n >= 10 THEN
        result := result || teens[n - 10] || ' ';
        RETURN TRIM(result);
    END IF;

    IF n > 0 THEN
        result := result || units[n] || ' ';
    END IF;

    RETURN TRIM(result);
END;
$$ LANGUAGE plpgsql;
