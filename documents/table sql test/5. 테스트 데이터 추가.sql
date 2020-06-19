-- 복붙해서 쓸것
INSERTO INTO 
()
VALUES
()
;

INSERT INTO users
(user_no, user_id, user_password, user_name, user_birth, user_gender, user_tel, user_email)
VALUES
(user_no_seq.NEXTVAL, 'kimkim', 'zxcv1234', '김김', '1989:10:27', 'M', '010-1234-1234', 'kkim@gmail.com')
;

INSERT INTO users
(user_no, user_id, user_password, user_name, user_birth, user_gender, user_tel, user_email)
VALUES
(user_no_seq.NEXTVAL, 'parkpak', 'zxcv1234', '박박', '1989:10:31', 'F', '010-1234-1234', 'ppak@gmail.com')
;

INSERT INTO deliver_locations
(location_no, location_addr_first, location_addr_second, location_addr_detail, user_no)
VALUES
(location_no_seq.NEXTVAL, '서울시 종로구', '봉익동 율곡로', '어디어디 디아망빌당4층', 100)
;

INSERT INTO deliver_locations
(location_no, location_addr_first, location_addr_second, location_addr_detail, user_no)
VALUES
(location_no_seq.NEXTVAL, '서울시 종로구', '익선동 어디어디', '어디어디 디아망빌당4층', 100)
;

INSERT INTO deliver_locations
(location_no, location_addr_first, location_addr_second, location_addr_detail, user_no)
VALUES
(location_no_seq.NEXTVAL, '서울시 종로구', '봉익동 율곡로', '어디어디 디아망빌당3층', 101)
;

INSERT INTO pizzas
(pizza_no, pizza_name, pizza_image_src, pizza_L_price, pizza_M_price)
VALUES
(pizza_no_seq.NEXTVAL, '이베리코더블크러스트', 'images/ed01.png', 35000, 25000)
;

INSERT INTO pizzas
(pizza_no, pizza_name, pizza_image_src, pizza_L_price, pizza_M_price)
VALUES
(pizza_no_seq.NEXTVAL, '페퍼로니', 'images/ed01.png', 35000, 25000)
;

INSERT INTO pizzas
(pizza_no, pizza_name, pizza_image_src, pizza_L_price, pizza_M_price)
VALUES
(pizza_no_seq.NEXTVAL, '치즈', 'images/ed01.png', 35000, 25000)
;

INSERT INTO doughs
(dough_no, dough_name, dough_price, dough_image_src)
VALUES
(dough_no_seq.NEXTVAL, '기본 도우', 0, 'images/dough.png')
;

INSERT INTO branches
(branch_no, branch_name, branch_addr_first, branch_addr_second, branch_addr_detail, branch_tel, branch_reg_date, branch_image_src)
VALUES
(branch_no_seq.NEXTVAL, '종로4가점', '서울시 종로구', '봉익동 율곡로 어디쯤', '디아망빌딩4층', '010-1234-1234', sysdate, 'images/branch.png');

INSERT INTO orders
(order_no, order_total_price, order_discount_price, order_status, order_receiver_name, order_receiver_tel, user_no, order_request_time, branch_no, order_request_detail, location_no, order_type, order_reg_date)
VALUES
(order_no_seq.NEXTVAL, 0, 0, 0, '김김이', '010-1234-1234', 100, sysdate, 100, '빨리배달해주세요', 100, 'C', sysdate );

INSERT INTO pizza_orders
(pizza_order_no, pizza_no, pizza_size, dough_no, pizza_order_amount, pizza_order_price, pizza_discount_price, order_no)
VALUES
(pizza_order_no_seq.NEXTVAL, 101, 'L', 100, 1, 35000, 33000, 107);

INSERT INTO pizza_orders
(pizza_order_no, pizza_no, pizza_size, dough_no, pizza_order_amount, pizza_order_price, pizza_discount_price, order_no)
VALUES
(pizza_order_no_seq.NEXTVAL, 102, 'M', 100, 3, 25000, 23000, 107);