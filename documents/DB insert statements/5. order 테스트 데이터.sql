INSERT INTO orders
(order_no, order_total_price, order_discount_price, order_status, order_receiver_name, order_receiver_tel, user_no, order_request_time, branch_no, location_no, order_type, order_reg_date)
VALUES
(order_no_seq.NEXTVAL, 36000, 36000, 4, '김김순', '010-9191-1919', 111, SYSDATE-350, 102, 101, 'O', SYSDATE-350);

INSERT INTO pizza_orders
(pizza_order_no, pizza_no, pizza_size, dough_no, pizza_order_amount, pizza_order_price, pizza_discount_price, order_no)
VALUES
(pizza_order_no_seq.NEXTVAL, 101, 'L', 101, 1, 30000, 30000, 100);

INSERT INTO side_orders
(side_order_no, side_no, side_order_amount, side_order_price, order_no)
VALUES
(side_order_no_seq.NEXTVAL, 100, 1, 3000, 100);

INSERT INTO etc_orders
(etc_order_no, etc_no, etc_order_amount, etc_order_price, order_no)
VALUES
(etc_order_no_seq.NEXTVAL, 103, 1, 1000, 100);


INSERT INTO orders
(order_no, order_total_price, order_discount_price, order_status, order_receiver_name, order_receiver_tel, user_no, order_request_time, branch_no, location_no, order_type, order_reg_date)
VALUES
(order_no_seq.NEXTVAL, 36000, 36000, 4, '김김순', '010-9191-1919', 111, SYSDATE-300, 102, 101, 'O', SYSDATE-300);

INSERT INTO pizza_orders
(pizza_order_no, pizza_no, pizza_size, dough_no, pizza_order_amount, pizza_order_price, pizza_discount_price, order_no)
VALUES
(pizza_order_no_seq.NEXTVAL, 101, 'L', 101, 1, 30000, 30000, 101);

INSERT INTO side_orders
(side_order_no, side_no, side_order_amount, side_order_price, order_no)
VALUES
(side_order_no_seq.NEXTVAL, 100, 1, 3000, 101);

INSERT INTO etc_orders
(etc_order_no, etc_no, etc_order_amount, etc_order_price, order_no)
VALUES
(etc_order_no_seq.NEXTVAL, 103, 1, 1000, 101);


INSERT INTO orders
(order_no, order_total_price, order_discount_price, order_status, order_receiver_name, order_receiver_tel, user_no, order_request_time, branch_no, location_no, order_type, order_reg_date)
VALUES
(order_no_seq.NEXTVAL, 36000, 36000, 4, '김김순', '010-9191-1919', 111, SYSDATE-100, 102, 101, 'O', SYSDATE-100);

INSERT INTO pizza_orders
(pizza_order_no, pizza_no, pizza_size, dough_no, pizza_order_amount, pizza_order_price, pizza_discount_price, order_no)
VALUES
(pizza_order_no_seq.NEXTVAL, 101, 'L', 101, 1, 30000, 30000, 102);

INSERT INTO side_orders
(side_order_no, side_no, side_order_amount, side_order_price, order_no)
VALUES
(side_order_no_seq.NEXTVAL, 100, 1, 3000, 102);

INSERT INTO etc_orders
(etc_order_no, etc_no, etc_order_amount, etc_order_price, order_no)
VALUES
(etc_order_no_seq.NEXTVAL, 103, 1, 1000, 102);


UPDATE users
 SET user_order_count = 3, user_grade_date = SYSDATE-100 
WHERE user_no = 111;