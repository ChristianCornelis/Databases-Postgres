CREATE TABLE vendor (vno CHAR(3) PRIMARY KEY, vname CHAR(10), city CHAR(10), VBALANCE float);
CREATE TABLE customer (account CHAR(3) PRIMARY KEY, cname CHAR(10), province CHAR(3), cbalance FLOAT, climit FLOAT);
CREATE TABLE transaction (tno CHAR(3) PRIMARY KEY, vno CHAR(3), account CHAR(3), t_date DATE, amount FLOAT);
INSERT INTO vendor VALUES ('V1', 'Sears', 'Toronto', 200.0);
INSERT INTO vendor VALUES ('V2', 'WalMart', 'Waterloo', 671.05);
INSERT INTO vendor VALUES ('V3', 'Esso', 'Windsor', 0.0);
INSERT INTO vendor VALUES ('V4', 'Esso', 'Waterloo', 225.0);

INSERT INTO customer VALUES ('A1', 'Smith', 'ONT', 2515, 2000);
INSERT INTO customer VALUES ('A2', 'Jones', 'BC', 2014, 2500);
INSERT INTO customer VALUES ('A3', 'Doc', 'ONT', 150, 1000);

INSERT INTO transaction VALUES ('T1', 'V2', 'A1', '2019-07-15', 1325);
INSERT INTO transaction VALUES ('T2', 'V2', 'A3', '2018-12-16', 1900);
INSERT INTO transaction VALUES ('T3', 'V3', 'A1', '2019-09-01', 2500);
INSERT INTO transaction VALUES ('T4', 'V4', 'A2', '2019-03-20', 1613);
INSERT INTO transaction VALUES ('T5', 'V4', 'A3', '2019-07-31', 3312);

