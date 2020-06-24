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