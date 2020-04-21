--Function to display the most recent transaction of every customer
CREATE OR REPLACE FUNCTION P4() RETURNS VOID AS $$
	DECLARE
		C1 CURSOR FOR SELECT customer.account, count(transaction.account) FROM customer LEFT JOIN transaction ON customer.account = transaction.account GROUP BY customer.account;
		caccount CHAR(3);
		cname CHAR(10);
		t_amount FLOAT;
		vname CHAR(10);
		transaction_cnt INT;
	BEGIN
		OPEN C1;
		LOOP
			FETCH C1 INTO caccount, transaction_cnt;
			EXIT WHEN NOT FOUND;
			IF  (transaction_cnt = 0) THEN
				SELECT customer.cname INTO cname FROM customer
				WHERE customer.account = caccount;
				RAISE NOTICE 'Account: % | Account Name: % | No transactions', caccount, cname;
			ELSE
				SELECT customer.cname, transaction.amount, vendor.vname INTO cname, t_amount, vname
				FROM customer, transaction, vendor
				WHERE customer.account = caccount AND
				customer.account = transaction.account AND
				vendor.vno = transaction.vno
				ORDER BY transaction.t_date DESC LIMIT 1;
				RAISE NOTICE 'Account: % | Account Name: % | Transaction Amount: % | Vendor Name: %', caccount, cname, t_amount, vname;
			END IF;

		END LOOP;


	END;
$$ LANGUAGE PLPGSQL;
