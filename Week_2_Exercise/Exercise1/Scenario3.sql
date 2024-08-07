BEGIN
    FOR rec IN (SELECT CustomerID, LoanID, EndDate FROM Loans WHERE EndDate <= SYSDATE + 30) LOOP
        DBMS_OUTPUT.PUT_LINE('Reminder: Loan ' || rec.LoanID || ' for customer ' || rec.CustomerID || ' is due within 30 days.');
    END LOOP;
END;