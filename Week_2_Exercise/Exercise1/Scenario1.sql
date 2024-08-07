DECLARE
    v_customer_id NUMBER;
    v_dob DATE;
    v_age NUMBER;
BEGIN
    FOR rec IN (SELECT CustomerID, DOB FROM Customers) LOOP
        v_customer_id := rec.CustomerID;
        v_dob := rec.DOB;
        v_age := FLOOR(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);
        
        IF v_age > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = v_customer_id;
        END IF;
    END LOOP;
END;
