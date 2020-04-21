--Function to create a new customer.
CREATE OR REPLACE FUNCTION P3(customer_account char, customer_name char, customer_province char, customer_limit float)
RETURNS TABLE(account char(3), cname char(10), province char(3), cbalance float, climit float) AS $$
	BEGIN
		INSERT INTO customer VALUES (customer_account, customer_name, customer_province, 0.0, customer_limit);
		RETURN QUERY
		SELECT * FROM customer;
	END;
$$ LANGUAGE PLPGSQL;
