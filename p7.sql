--Function to charge a 10% service fee to customers who have exceeded their credit limit.
CREATE OR REPLACE FUNCTION P7() RETURNS VOID AS $$
    DECLARE
        C1 CURSOR FOR SELECT customer.account, cname, cbalance, climit FROM customer;
        customer_account CHAR(3);
        customer_name CHAR(10);
        customer_bal FLOAT;
        customer_lim FLOAT;
        customer_fee FLOAT;

    BEGIN
        OPEN C1;
        LOOP
            FETCH C1 INTO customer_account, customer_name, customer_bal, customer_lim;
            EXIT WHEN NOT FOUND;
            IF (customer_bal > customer_lim) THEN
                customer_fee := (customer_bal - customer_lim) * 0.1;
                UPDATE customer SET cbalance = customer.cbalance + customer_fee WHERE customer.account = customer_account;
                RAISE NOTICE 'Customer: % | New Balance %', customer_name, customer_bal + customer_fee;
            END IF;
        END LOOP;
    END;
$$ LANGUAGE PLPGSQL;
