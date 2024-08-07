CREATE OR REPLACE PROCEDURE UpdateSalary (
    p_employee_id IN NUMBER,
    p_percentage IN NUMBER
) IS
    e_employee_not_found EXCEPTION;
    v_salary NUMBER;
    v_error_message VARCHAR2(4000);

BEGIN
    -- Check if the employee exists
    SELECT Salary INTO v_salary
    FROM Employees
    WHERE EmployeeID = p_employee_id;

    -- Update the salary
    UPDATE Employees
    SET Salary = Salary + (Salary * p_percentage / 100)
    WHERE EmployeeID = p_employee_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        v_error_message := 'Employee ID ' || p_employee_id || ' does not exist.';
        DBMS_OUTPUT.PUT_LINE(v_error_message);
        RAISE e_employee_not_found;
    WHEN OTHERS THEN
        v_error_message := 'Error occurred during salary update: ' || SQLERRM;
        DBMS_OUTPUT.PUT_LINE(v_error_message);
        ROLLBACK;
END UpdateSalary;
