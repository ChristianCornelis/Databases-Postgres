--Function to add a new transaction
CREATE OR REPLACE FUNCTION P8(transaction_no CHAR(3), vendor_no CHAR(3), customer_account_no CHAR(3), amount FLOAT) RETURNS VOID AS $$
	DECLARE
    transaction_date DATE;
		customer_name CHAR(10);
		customer_province CHAR (10);
		customer_limit FLOAT;
		customer_balance FLOAT;
		vendor_name CHAR(10);
		vendor_city CHAR(10);
		vendor_balance FLOAT;
	BEGIN
		INSERT INTO transaction VALUES (transaction_no, vendor_no, customer_account_no, NOW(), amount);
		-- Select the date in order to get it in the proper YYYY-MM-DD format for output.
		SELECT t_date INTO transaction_date FROM transaction WHERE tno = transaction_no;
		RAISE NOTICE E'**********TRANSACTION DETAILS**********\nTransaction No: %\nVendor No: %\nCustomer Account: %\nDate: %\nAmount: %\n', transaction_no, vendor_no, customer_account_no, transaction_date, amount;
		UPDATE vendor SET vbalance = vendor.vbalance + amount WHERE vendor.vno = vendor_no;
		SELECT vname, city, vbalance INTO vendor_name, vendor_city, vendor_balance FROM vendor WHERE vno = vendor_no;
		RAISE NOTICE E'\n**********VENDOR DETAILS**********\nVendor No: % \nName: %\nCity: %\nBalance: %\n', vendor_no, vendor_name, vendor_city, vendor_balance;
		UPDATE customer SET cbalance = customer.cbalance + amount WHERE customer.account = customer_account_no;
		SELECT cname, province, climit, cbalance INTO customer_name, customer_province, customer_limit, customer_balance  FROM customer WHERE customer.account = customer_account_no;
		RAISE NOTICE E'\n**********CUSTOMER DETAILS**********\nAccount: %\nName: %\nProvince: %\nBalance: %\nLimit: %\n', customer_account_no, customer_name, customer_province, customer_balance, customer_limit;
	END;
$$ LANGUAGE PLPGSQL;
