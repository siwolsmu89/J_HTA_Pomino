SELECT order_no, order_total_price, order_discount_price, order_status, 
							order_receiver_name, order_receiver_tel, user_no, order_request_time, 
							branch_no, order_request_detail, location_no, order_type, order_reg_date 
FROM orders 
WHERE user_no = 100
AND order_type = 'C';

INSERT INTO sides
(side_no, side_name, side_price, side_image_src)
VALUES
(side_no_seq.NEXTVAL, '한돈 빠에야', 8800, 'test.png');

INSERT INTO side_orders
(side_order_no, side_no, side_order_amount, side_order_price, order_no)
VALUES
(side_order_no_seq.NEXTVAL, 100, 2, 8800*2, 100);

INSERT INTO etcs
(etc_no, etc_name, etc_price, etc_image_src)
VALUES
(etc_no_seq.NEXTVAL, '코카콜라 500ml', 1400, 'null.png');

INSERT INTO etc_orders
(etc_order_no, etc_no, etc_order_amount, etc_order_price, order_no)
VALUES
(etc_order_no_seq.NEXTVAL, 100, 2, 1400*2, 100);

INSERT INTO toppings
(topping_no, topping_name, topping_price, topping_category, topping_image_src)
VALUES
(topping_no_seq.NEXTVAL, '도미노 치즈', 2500, 1, 'top');

INSERT INTO toppings
(topping_no, topping_name, topping_price, topping_category, topping_image_src)
VALUES
(topping_no_seq.NEXTVAL, '페퍼로니', 500, 2, 'top');

INSERT INTO topping_orders
(topping_order_no, pizza_order_no, topping_no, topping_order_amount, topping_order_price)
VALUES
(topping_order_no_seq.NEXTVAL, 100, 100, 2, 2500*2);

INSERT INTO topping_orders
(topping_order_no, pizza_order_no, topping_no, topping_order_amount, topping_order_price)
VALUES
(topping_order_no_seq.NEXTVAL, 100, 101, 2, 500*2);

INSERT INTO grades
(grade_name, grade_order_count, grade_order_price, grade_discount_rate)
VALUES
('regular', 2, 50000, 0.1);

SELECT grade_name, grade_order_count, grade_order_price, grade_discount_rate 
				   FROM grades 
				   ORDER BY grade_order_count DESC;
                   
                   SELECT order_no_seq.NEXTVAL
                   FROM dual;