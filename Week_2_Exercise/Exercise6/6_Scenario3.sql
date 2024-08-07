DECLARE
    CURSOR cur_loans IS
        SELECT LoanID, InterestRate
        FROM Loans;

    v_loanID Loans.LoanID%TYPE;
    v_interestRate Loans.InterestRate%TYPE;
    v_new_interestRate CONSTANT NUMBER := 4; -- New interest rate

BEGIN
    OPEN cur_loans;
    LOOP
        FETCH cur_loans INTO v_loanID, v_interestRate;
        EXIT WHEN cur_loans%NOTFOUND;

        v_interestRate := v_new_interestRate;

        UPDATE Loans
        SET InterestRate = v_interestRate
        WHERE LoanID = v_loanID;
    END LOOP;
    CLOSE cur_loans;

    COMMIT;
END;
