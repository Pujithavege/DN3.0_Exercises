DECLARE
    CURSOR cur_transactions IS
        SELECT c.CustomerID, c.Name, t.TransactionDate, t.Amount, t.TransactionType
        FROM Customers c
        JOIN Accounts a ON c.CustomerID = a.CustomerID
        JOIN Transactions t ON a.AccountID = t.AccountID
        WHERE t.TransactionDate BETWEEN TRUNC(SYSDATE, 'MM') AND LAST_DAY(SYSDATE);

    v_customerID Customers.CustomerID%TYPE;
    v_name Customers.Name%TYPE;
    v_transactionDate Transactions.TransactionDate%TYPE;
    v_amount Transactions.Amount%TYPE;
    v_transactionType Transactions.TransactionType%TYPE;

BEGIN
    OPEN cur_transactions;
    LOOP
        FETCH cur_transactions INTO v_customerID, v_name, v_transactionDate, v_amount, v_transactionType;
        EXIT WHEN cur_transactions%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customerID);
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
        DBMS_OUTPUT.PUT_LINE('Transaction Date: ' || TO_CHAR(v_transactionDate, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Amount: ' || v_amount);
        DBMS_OUTPUT.PUT_LINE('Transaction Type: ' || v_transactionType);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    END LOOP;
    CLOSE cur_transactions;
END;

