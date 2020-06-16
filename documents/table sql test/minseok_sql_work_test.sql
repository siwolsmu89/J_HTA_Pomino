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