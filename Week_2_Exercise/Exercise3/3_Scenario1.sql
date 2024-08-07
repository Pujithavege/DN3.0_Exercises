CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
    v_interest_rate CONSTANT NUMBER := 0.01; 
BEGIN
    FOR account_rec IN (SELECT AccountID, Balance 
                        FROM Accounts 
                        WHERE AccountType = 'Savings') LOOP
        UPDATE Accounts
        SET Balance = Balance + (Balance * v_interest_rate),
            LastModified = SYSDATE
        WHERE AccountID = account_rec.AccountID;
    END LOOP;
    COMMIT;
END ProcessMonthlyInterest;
