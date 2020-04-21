--Function to charge each vedor a 4% service fee
CREATE OR REPLACE FUNCTION P6() RETURNS VOID AS $$
    DECLARE
        C1 CURSOR FOR SELECT vendor.vno, vname, vbalance FROM vendor;
        vendor_no CHAR(3);
        vendor_name CHAR(10);
        vendor_bal FLOAT;
        fee FLOAT;

    BEGIN
        OPEN C1;
        LOOP
            FETCH C1 INTO vendor_no, vendor_name, vendor_bal;
	          EXIT WHEN NOT FOUND;
            fee := vendor_bal * 0.04;
            UPDATE vendor SET vbalance = vendor.vbalance - fee WHERE vendor.vno = vendor_no;
            RAISE NOTICE 'Vendor Name: % | Fee: % | New Balance: %', vendor_name, fee, vendor_bal - fee;
        END LOOP;
    END;
$$ LANGUAGE PLPGSQL;
