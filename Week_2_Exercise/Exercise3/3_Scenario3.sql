CREATE OR REPLACE PROCEDURE TransferFunds (
    p_from_account_id IN NUMBER,
    p_to_account_id IN NUMBER,
    p_amount IN NUMBER
) IS
    e_insufficient_funds EXCEPTION;
    v_from_balance NUMBER;
    v_to_balance NUMBER;
    v_error_message VARCHAR2(4000);
BEGIN
    -- Check the balance of the from account
    SELECT Balance INTO v_from_balance
    FROM Accounts
    WHERE AccountID = p_from_account_id
    FOR UPDATE; -- Lock the row for update

    IF v_from_balance < p_amount THEN
        RAISE e_insufficient_funds;
    END IF;

    -- Transfer the funds
    UPDATE Accounts
    SET Balance = Balance - p_amount,
        LastModified = SYSDATE
    WHERE AccountID = p_from_account_id;

    UPDATE Accounts
    SET Balance = Balance + p_amount,
        LastModified = SYSDATE
    WHERE AccountID = p_to_account_id;

    -- Log the transaction
    INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
    VALUES (TRANSACTION_SEQ.NEXTVAL, p_from_account_id, SYSDATE, p_amount, 'Transfer Out');

    INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
    VALUES (TRANSACTION_SEQ.NEXTVAL, p_to_account_id, SYSDATE, p_amount, 'Transfer In');
    COMMIT;
EXCEPTION
    WHEN e_insufficient_funds THEN
        v_error_message := 'Insufficient funds in account ' || p_from_account_id;
        DBMS_OUTPUT.PUT_LINE(v_error_message);
        ROLLBACK;
    WHEN OTHERS THEN
        v_error_message := 'Error occurred during fund transfer: ' || SQLERRM;
        DBMS_OUTPUT.PUT_LINE(v_error_message);
        ROLLBACK;
END TransferFunds;
