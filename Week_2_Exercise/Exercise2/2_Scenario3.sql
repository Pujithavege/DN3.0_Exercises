CREATE OR REPLACE PROCEDURE AddNewCustomer (
    p_customer_id IN NUMBER,
    p_name IN VARCHAR2,
    p_dob IN DATE,
    p_balance IN NUMBER
) IS
    e_duplicate_customer EXCEPTION;
    v_error_message VARCHAR2(4000);
BEGIN
    -- Insert the new customer
    INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
    VALUES (p_customer_id, p_name, p_dob, p_balance, SYSDATE);

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        v_error_message := 'Customer ID ' || p_customer_id || ' already exists.';
        DBMS_OUTPUT.PUT_LINE(v_error_message);
        RAISE e_duplicate_customer;
    WHEN OTHERS THEN
        v_error_message := 'Error occurred during customer insertion: ' || SQLERRM;
        DBMS_OUTPUT.PUT_LINE(v_error_message);
        ROLLBACK;
END AddNewCustomer;
