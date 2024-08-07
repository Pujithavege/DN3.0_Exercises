CREATE OR REPLACE PROCEDURE SafeTransferFunds (
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
    WHERE AccountID = p_from_account_id;

    IF v_from_balance < p_amount THEN
        RAISE e_insufficient_funds;
    END IF;

    -- Transfer the funds
    UPDATE Accounts
    SET Balance = Balance - p_amount
    WHERE AccountID = p_from_account_id;

    UPDATE Accounts
    SET Balance = Balance + p_amount
    WHERE AccountID = p_to_account_id;

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
END SafeTransferFunds;

