DECLARE
    CURSOR cur_accounts IS
        SELECT AccountID, Balance
        FROM Accounts;

    v_accountID Accounts.AccountID%TYPE;
    v_balance Accounts.Balance%TYPE;
    v_annual_fee CONSTANT NUMBER := 50; -- Annual fee amount

BEGIN
    OPEN cur_accounts;
    LOOP
        FETCH cur_accounts INTO v_accountID, v_balance;
        EXIT WHEN cur_accounts%NOTFOUND;

        v_balance := v_balance - v_annual_fee;

        UPDATE Accounts
        SET Balance = v_balance,
            LastModified = SYSDATE
        WHERE AccountID = v_accountID;
    END LOOP;
    CLOSE cur_accounts;

    COMMIT;
END;
