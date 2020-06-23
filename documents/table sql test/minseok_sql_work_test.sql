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

SELECT O.order_no, O.user_no, O.order_total_price, O.order_discount_price, O.order_status, 
       PI.pizza_name || PI.pizza_size || '(' || PI.dough_name || ')' AS menu_name,
       PI.pizza_order_amount AS menu_order_amount, 'pizza' AS menu_type
FROM orders O, 
    (SELECT PO.pizza_order_no, PO.pizza_no, PO.pizza_size, PO.pizza_order_amount,
            P.pizza_name, D.dough_name
     FROM orders O, pizza_orders PO, pizzas P, doughs D
     WHERE O.order_no = 144
     AND (PO.order_no = O.order_no
     AND P.pizza_no = PO.pizza_no
     AND PO.dough_no = D.dough_no)
     ORDER BY pizza_order_no) PI
WHERE order_no = 144

UNION

SELECT O.order_no, O.user_no, O.order_total_price, O.order_discount_price, O.order_status, S.side_name, SO.side_order_amount, 'side' AS menu_type
FROM orders O, side_orders SO, sides S
WHERE O.order_no = 144

UNION

SELECT O.order_no, O.user_no, O.order_total_price, O.order_discount_price, O.order_status, E.etc_name, EO.etc_order_amount, 'etc' AS menu_type
FROM orders O, etc_orders EO, etcs E
WHERE O.order_no=144

ORDER BY menu_type
;

SELECT O.order_no, PI.pizza_name || PI.pizza_size || '(' || PI.dough_name || ')' AS menu_name,
       PI.pizza_order_amount AS menu_order_amount
						  FROM orders O, 
    						   (SELECT PO.pizza_order_no, PO.pizza_no, PO.pizza_size, PO.pizza_order_amount, 
          							   P.pizza_name, D.dough_name
    							FROM orders O, pizza_orders PO, pizzas P, doughs D
    							WHERE O.order_no = 144 
    							AND PO.order_no = O.order_no 
     							AND P.pizza_no = PO.pizza_no 
     							AND PO.dough_no = D.dough_no
     							ORDER BY pizza_order_no) PI 
						  WHERE order_no = 144

						  UNION 
 
						  SELECT O.order_no, S.side_name, SO.side_order_amount 
						  FROM orders O, side_orders SO, sides S 
						  WHERE O.order_no = 144 
                          AND SO.order_no = O.order_no
                          AND SO.side_no = S.side_no

						  UNION 
                          
						  SELECT O.order_no, E.etc_name, EO.etc_order_amount 
						  FROM orders O, etc_orders EO, etcs E
						  WHERE O.order_no = 144
                          AND EO.order_no = O.order_no
                          AND EO.etc_no = E.etc_no;
                        
CREATE VIEW simple_order_info
AS SELECT ROW_NUMBER() OVER(ORDER BY O.order_no) AS RN, O.order_no, O.branch_no, B.branch_name, O.order_discount_price, O.order_request_time, O.order_status,
     ((SELECT COUNT(order_no) FROM pizza_orders PO WHERE PO.order_no = O.order_no) 
     + (SELECT COUNT(order_no) FROM side_orders SO WHERE SO.order_no = O.order_no)
     + (SELECT COUNT(order_no) FROM etc_orders EO WHERE EO.order_no = O.order_no)) AS total_count,
    (SELECT PI.pizza_name || PI.pizza_size || '(' || PI.dough_name || ')'
	 FROM orders O, (SELECT PO.pizza_size, PO.pizza_order_amount, P.pizza_name, D.dough_name
    				 FROM orders O, pizza_orders PO, pizzas P, doughs D
    				 WHERE O.order_no = 100
    				 AND PO.order_no = O.order_no 
     				 AND P.pizza_no = PO.pizza_no 
     				 AND PO.dough_no = D.dough_no) PI 
     WHERE order_no = 100 AND rownum = 1) AS pizza_name, 
    (SELECT S.side_name FROM orders O, side_orders SO, sides S WHERE O.order_no = 100 AND SO.order_no = O.order_no AND SO.side_no = S.side_no AND rownum = 1) AS side_name,
    (SELECT E.etc_name FROM orders O, etc_orders EO, etcs E WHERE O.order_no = 100 AND EO.order_no = O.order_no AND EO.etc_no = E.etc_no AND rownum = 1) AS etc_name
FROM orders O, branches B
WHERE O.branch_no = B.branch_no;
                        
                        
                        
                        