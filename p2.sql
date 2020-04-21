--Function to display all data of customers with transactions with a given vendor
CREATE OR REPLACE FUNCTION P2(vendor_name char) RETURNS TABLE (account char(3), cname char(10), province char(3)) AS $$
	BEGIN
		RETURN QUERY SELECT customer.account, customer.cname, customer.province
		FROM customer, vendor, transaction
		WHERE vendor.vname = vendor_name AND
		customer.account = transaction.account AND
		vendor.vno = transaction.vno;
	END;
$$ LANGUAGE PLPGSQL;
