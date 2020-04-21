--Function to update the total transactions for all vendors
CREATE OR REPLACE FUNCTION P5() RETURNS TABLE (vno CHAR(3), vname CHAR(10), vbalance FLOAT)  AS $$
	DECLARE
		c1 CURSOR FOR SELECT vendor.vno FROM vendor;
		total_transacts float;
		vendor_no CHAR(3);
	BEGIN
		OPEN c1;
		LOOP
			FETCH c1 INTO vendor_no;
			EXIT WHEN NOT FOUND;
			SELECT SUM(transaction.amount) into total_transacts FROM transaction
			WHERE transaction.vno = vendor_no;
			IF (total_transacts IS NOT NULL) THEN
				UPDATE vendor SET vbalance = vendor.vbalance + total_transacts
				WHERE vendor.vno = vendor_no;
			END IF;
		END LOOP;
		RETURN QUERY SELECT vendor.vno, vendor.vname, vendor.vbalance FROM vendor;
	END;

$$ LANGUAGE PLPGSQL;
