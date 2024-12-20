CREATE OR REPLACE PROCEDURE Fill_Personnel AS
    TYPE NameArray IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;
    TYPE SurnameArray IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;
    TYPE PatronymicArray IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;

    Names NameArray;
    Surnames SurnameArray;
    Patronymics PatronymicArray;

    v_id NUMBER := 1; 
    v_count NUMBER := 10; -- 

BEGIN
    
    Names(1) := 'Иван'; Surnames(1) := 'Иванов'; Patronymics(1) := 'Иванович';
    Names(2) := 'Сергей'; Surnames(2) := 'Сергеев'; Patronymics(2) := 'Сергеевич';
    Names(3) := 'Анна'; Surnames(3) := 'Зайцева'; Patronymics(3) := 'Петровна';
    Names(4) := 'Елена'; Surnames(4) := 'Петрова'; Patronymics(4) := 'Алексеевна';
    Names(5) := 'Алексей'; Surnames(5) := 'Алексеев'; Patronymics(5) := 'Михайлович';
    Names(6) := 'Дмитрий'; Surnames(6) := 'Дмитриев'; Patronymics(6) := 'Игоревич';
    Names(7) := 'Ольга'; Surnames(7) := 'Волкова'; Patronymics(7) := 'Сергеевна';
    Names(8) := 'Мария'; Surnames(8) := 'Сидорова'; Patronymics(8) := 'Вадимовна';
    Names(9) := 'Андрей'; Surnames(9) := 'Кузнецов'; Patronymics(9) := 'Викторович';
    Names(10) := 'Наталья'; Surnames(10) := 'Лебедева'; Patronymics(10) := 'Станиславовна';

    FOR i IN 1 .. v_count LOOP
        INSERT INTO Personnel (id, name, surname, patronymic, age, address, phone_number, post)
        VALUES (
            v_id,
            Names(DBMS_RANDOM.VALUE(1, 11)),
            Surnames(DBMS_RANDOM.VALUE(1, 11)),
            Patronymics(DBMS_RANDOM.VALUE(1, 11)),
            TRUNC(DBMS_RANDOM.VALUE(18, 65)), 
            'Город, ул. Примерная, ' || TO_CHAR(DBMS_RANDOM.VALUE(1, 100)), 
            '+7(999)' || LPAD(TRUNC(DBMS_RANDOM.VALUE(0, 10000000)), 7, '0'), 
            CASE 
                WHEN DBMS_RANDOM.VALUE < 0.5 THEN 'Пилот' 
                ELSE 'Стюардесса' 
            END
        );
        v_id := v_id + 1; 
    END LOOP;

    COMMIT; 
END Fill_Personnel;
/
