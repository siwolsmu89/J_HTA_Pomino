DROP SEQUENCE side_order_no_seq;
CREATE SEQUENCE side_order_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
DROP SEQUENCE etc_order_no_seq;
CREATE SEQUENCE etc_order_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
DROP SEQUENCE topping_order_no_seq;
CREATE SEQUENCE topping_order_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
DROP SEQUENCE pizza_order_no_seq;
CREATE SEQUENCE pizza_order_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
DROP SEQUENCE order_no_seq;
CREATE SEQUENCE order_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;

INSERT INTO orders
(order_no, order_total_price, order_discount_price, order_status, order_receiver_name, order_receiver_tel, user_no, order_request_time, branch_no, order_request_detail, location_no, order_type, order_reg_date)
VALUES
(order_no_seq.NEXTVAL, 0, 0, 0, '김김이', '010-1234-1234', 100, sysdate, 100, '빨리배달해주세요', 100, 'C', sysdate );

INSERT INTO side_orders
(side_order_no, side_no, side_order_amount, side_order_price, order_no)
VALUES
(side_order_no_seq.NEXTVAL, 100, 2, 8800*2, 100);

INSERT INTO etc_orders
(etc_order_no, etc_no, etc_order_amount, etc_order_price, order_no)
VALUES
(etc_order_no_seq.NEXTVAL, 100, 2, 1400*2, 100);

INSERT INTO pizza_orders
(pizza_order_no, pizza_no, pizza_size, dough_no, pizza_order_amount, pizza_order_price, pizza_discount_price, order_no)
VALUES
(pizza_order_no_seq.NEXTVAL, 101, 'L', 100, 1, 35000, 33000, 100);

INSERT INTO pizza_orders
(pizza_order_no, pizza_no, pizza_size, dough_no, pizza_order_amount, pizza_order_price, pizza_discount_price, order_no)
VALUES
(pizza_order_no_seq.NEXTVAL, 102, 'M', 100, 3, 75000, 72000, 100);

INSERT INTO topping_orders
(topping_order_no, pizza_order_no, topping_no, topping_order_amount, topping_order_price)
VALUES
(topping_order_no_seq.NEXTVAL, 100, 100, 2, 2500*2);

INSERT INTO topping_orders
(topping_order_no, pizza_order_no, topping_no, topping_order_amount, topping_order_price)
VALUES
(topping_order_no_seq.NEXTVAL, 100, 101, 2, 500*2);
