--Function to list all transactions of a given customer
CREATE OR REPLACE FUNCTION P1(customer_name char) RETURNS TABLE (vname CHAR(10), vendor_date DATE, amount FLOAT) AS $$
	BEGIN
		RETURN QUERY SELECT vendor.vname, transaction.t_date, transaction.amount 
		FROM vendor, transaction, customer
		WHERE vendor.vno = transaction.vno AND
	        transaction.account = customer.account AND
		customer.cname = customer_name;
	END;

$$ LANGUAGE PLPGSQL;
