create or replace PROCEDURE new_cart_insert 
(
    in_order_no IN NUMBER,
    in_user_no IN NUMBER,
    in_branch_no IN NUMBER,
    this_seq_no OUT NUMBER
)
IS
BEGIN 
    INSERT INTO orders (order_no, order_total_price, order_discount_price, order_status, order_receiver_name, order_receiver_tel, user_no, order_request_time, branch_no, order_type)
    VALUES (in_order_no, 0, 0, 0, ' ', ' ', in_user_no, SYSDATE, in_branch_no, 'C');
    this_seq_no := in_order_no;
    COMMIT;
END;

CREATE OR REPLACE PROCEDURE new_pizzaorder_insert
(
    in_pizza_order_no IN NUMBER,
    in_pizza_no IN NUMBER,
    in_pizza_size IN CHAR,
    in_dough_no IN NUMBER,
    in_pizza_order_amount IN NUMBER,
    in_pizza_order_price IN NUMBER,
    in_pizza_discount_price IN NUMBER,
    in_order_no IN NUMBER,
    this_seq_no OUT NUMBER
)
IS
BEGIN
    INSERT INTO pizza_orders (pizza_order_no, pizza_no, pizza_size, dough_no, pizza_order_amount, pizza_order_price, pizza_discount_price, order_no)
    VALUES (in_pizza_order_no, in_pizza_no, in_pizza_size, in_dough_no, in_pizza_order_amount, in_pizza_order_price, in_pizza_discount_price, in_order_no);
    this_seq_no := in_pizza_order_no;
    COMMIT;
END;