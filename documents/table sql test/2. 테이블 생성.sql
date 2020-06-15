
/* Drop Tables */

DROP TABLE answers CASCADE CONSTRAINTS;
DROP TABLE etc_orders CASCADE CONSTRAINTS;
DROP TABLE side_orders CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE branches CASCADE CONSTRAINTS;
DROP TABLE deliver_locations CASCADE CONSTRAINTS;
DROP TABLE topping_orders CASCADE CONSTRAINTS;
DROP TABLE pizza_orders CASCADE CONSTRAINTS;
DROP TABLE doughs CASCADE CONSTRAINTS;
DROP TABLE etcs CASCADE CONSTRAINTS;
DROP TABLE events CASCADE CONSTRAINTS;
DROP TABLE questions CASCADE CONSTRAINTS;
DROP TABLE users CASCADE CONSTRAINTS;
DROP TABLE grades CASCADE CONSTRAINTS;
DROP TABLE pizzas CASCADE CONSTRAINTS;
DROP TABLE sides CASCADE CONSTRAINTS;
DROP TABLE toppings CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE answers
(
	answer_no number(3) NOT NULL,
	-- 문의테이블 PK 참조
	question_no number(3),
	answer_content varchar2(4000) NOT NULL,
	answer_del_yn char DEFAULT 'n',
	answer_reg_date date DEFAULT sysdate,
	PRIMARY KEY (answer_no)
);


CREATE TABLE branches
(
	branch_no number(3,0) NOT NULL,
	branch_name varchar2(30) NOT NULL UNIQUE,
	branch_addr_first varchar2(30) NOT NULL,
	branch_addr_second varchar2(100) NOT NULL,
	branch_addr_detail varchar2(100) NOT NULL,
	branch_tel varchar2(15) NOT NULL UNIQUE,
	branch_reg_date date DEFAULT sysdate,
	branch_parking_yn char DEFAULT 'n',
	-- HH:MI:SS 형식으로 작성
	branch_open_time varchar2(8),
	-- HH:MI:SS
	branch_close_time varchar2(8),
	branch_comment varchar2(300),
	branch_discount_rate number(3,1) DEFAULT 0,
	branch_quit_yn char DEFAULT 'n',
	branch_image_src varchar2(300) NOT NULL,
	PRIMARY KEY (branch_no)
);


CREATE TABLE deliver_locations
(
	location_no number(3,0) NOT NULL,
	location_addr_first varchar2(30) NOT NULL,
	location_addr_second varchar2(100) NOT NULL,
	location_addr_detail varchar2(100) NOT NULL,
	user_no number(3) NOT NULL,
	PRIMARY KEY (location_no)
);


CREATE TABLE doughs
(
	dough_no number(3,0) NOT NULL,
	dough_name varchar2(30) NOT NULL UNIQUE,
	dough_price number(5,0) NOT NULL,
	dough_image_src varchar2(300) NOT NULL,
	PRIMARY KEY (dough_no)
);


CREATE TABLE etcs
(
	etc_no number(3,0) NOT NULL,
	etc_name varchar2(30) NOT NULL UNIQUE,
	etc_price number(5,0) NOT NULL,
	etc_image_src varchar2(300) NOT NULL,
	PRIMARY KEY (etc_no)
);


CREATE TABLE etc_orders
(
	etc_order_no number(3,0) NOT NULL,
	etc_no number(3,0) NOT NULL,
	etc_order_amount number(10,0) NOT NULL,
	etc_order_price number(10,0) NOT NULL,
	-- 주문 테이블 PK
	order_no number(3),
	PRIMARY KEY (etc_order_no)
);


CREATE TABLE events
(
	event_no number(3,0) NOT NULL,
	event_name varchar2(30) NOT NULL,
	event_start_date date DEFAULT sysdate NOT NULL,
	event_end_date date NOT NULL,
	event_image_src varchar2(300) NOT NULL,
	event_discount_rate number(3,1) DEFAULT 0,
	event_disable_yn char DEFAULT 'n',
	event_reg_date date DEFAULT sysdate,
	-- 피자 테이블 pk 참조
	pizza_no number(3,0),
	PRIMARY KEY (event_no)
);


CREATE TABLE grades
(
	grade_name varchar2(10) NOT NULL,
	grade_order_count number(2) DEFAULT 0,
	grade_order_price number(10) DEFAULT 0,
	grade_discount_rate number(3,1),
	grade_achieved_date date DEFAULT SYSDATE,
	PRIMARY KEY (grade_name)
);


CREATE TABLE orders
(
	order_no number(3) NOT NULL,
	order_total_price number(10) NOT NULL,
	order_discount_price number(10) NOT NULL,
	-- 0부터 5까지
	order_status number(1) DEFAULT 0 NOT NULL,
	order_receiver_name varchar2(20) NOT NULL,
	order_receiver_tel varchar2(15) NOT NULL,
	-- 사용자 테이블 pk 참조
	user_no number(3) NOT NULL,
	order_request_time date DEFAULT sysdate NOT NULL,
	branch_no number(3,0) NOT NULL,
	order_request_detail varchar2(300),
	location_no number(3,0),
	-- 주문 : o
	-- 장바구니 : c
	order_type char DEFAULT 'c' NOT NULL,
	order_reg_date date DEFAULT sysdate,
	PRIMARY KEY (order_no)
);


CREATE TABLE pizzas
(
	pizza_no number(3,0) NOT NULL,
	pizza_name varchar2(30) NOT NULL UNIQUE,
	pizza_image_src varchar2(300) NOT NULL,
	pizza_L_price number(5,0) NOT NULL,
	pizza_M_price number(5,0) NOT NULL,
	pizza_disable_yn char DEFAULT 'n',
	pizza_reg_date date DEFAULT sysdate,
	PRIMARY KEY (pizza_no)
);


CREATE TABLE pizza_orders
(
	pizza_order_no number(3,0) NOT NULL,
	-- 피자 테이블 PK 참조
	pizza_no number(3,0) NOT NULL,
	-- L, M 중 하나
	pizza_size char NOT NULL,
	-- 도우 테이블 pk 참조
	dough_no number(3,0) NOT NULL,
	pizza_order_amount number(3,0) DEFAULT 0 NOT NULL,
	-- pizza 테이블 피자 가격 * dough 테이블 dough 가격 * amount
	pizza_order_price number(10,0) NOT NULL,
	-- grade 테이블 discount * order_price
	pizza_discount_price number(10,0) NOT NULL,
	-- 주문 테이블 PK 참조
	order_no number(3,0) NOT NULL,
	PRIMARY KEY (pizza_order_no)
);


CREATE TABLE questions
(
	question_no number(3) NOT NULL,
	-- 사용자 테이블 pk 참조
	question_writer number(3),
	question_title varchar2(300) NOT NULL,
	quesetion_content varchar2(4000) NOT NULL,
	answered_yn char DEFAULT 'n',
	question_del_yn char DEFAULT 'n',
	question_reg_date date DEFAULT sysdate,
	PRIMARY KEY (question_no)
);


CREATE TABLE sides
(
	side_no number(3,0) NOT NULL,
	side_name varchar2(30) NOT NULL UNIQUE,
	side_price number(5,0) NOT NULL,
	side_image_src varchar2(300) NOT NULL,
	PRIMARY KEY (side_no)
);


CREATE TABLE side_orders
(
	side_order_no number(3,0) NOT NULL,
	-- 사이드 테이블 PK 참조
	side_no number(3,0),
	side_order_amount number(3,0) NOT NULL,
	-- side 테이블 price * amount
	side_order_price number(10) NOT NULL,
	-- 주문 테이블 PK 참조
	order_no number(3),
	PRIMARY KEY (side_order_no)
);


CREATE TABLE toppings
(
	topping_no number(3,0) NOT NULL,
	topping_name varchar2(30) NOT NULL UNIQUE,
	topping_price number(5,0) NOT NULL,
	topping_category number(1) NOT NULL,
	topping_image_src varchar2(300) NOT NULL,
	PRIMARY KEY (topping_no)
);


CREATE TABLE topping_orders
(
	topping_order_no number(3,0) NOT NULL,
	-- 피자 주문 상세 테이블 PK 참조
	pizza_order_no number(3,0) NOT NULL,
	-- 토핑 테이블 PK 참조
	topping_no number(3,0) NOT NULL,
	-- 최대값5
	topping_order_amount number(1) NOT NULL,
	topping_order_price number(6) NOT NULL,
	PRIMARY KEY (topping_order_no)
);


CREATE TABLE users
(
	user_no number(3) NOT NULL,
	user_id varchar2(20) NOT NULL UNIQUE,
	user_password varchar2(20) NOT NULL,
	user_name varchar2(20) NOT NULL,
	user_birth date NOT NULL,
	user_gender char NOT NULL,
	user_tel varchar2(15) NOT NULL,
	user_email varchar2(40) NOT NULL,
	user_reg_date date DEFAULT sysdate,
	-- 등급테이블 PK를 참조하는 FK
	user_grade_name varchar2(10),
	user_quit_yn char DEFAULT 'n',
	user_quit_reason varchar2(300),
	-- 
	-- 
	user_quit_detail varchar2(4000),
	user_order_count number(5) DEFAULT 0,
	-- 주문테이블 PK를 참조하는 FK
	quick_order_no number(3),
	PRIMARY KEY (user_no)
);



/* Create Foreign Keys */

ALTER TABLE orders
	ADD FOREIGN KEY (branch_no)
	REFERENCES branches (branch_no)
;


ALTER TABLE pizza_orders
	ADD FOREIGN KEY (dough_no)
	REFERENCES doughs (dough_no)
;


ALTER TABLE etc_orders
	ADD FOREIGN KEY (etc_no)
	REFERENCES etcs (etc_no)
;


ALTER TABLE users
	ADD FOREIGN KEY (user_grade_name)
	REFERENCES grades (grade_name)
;


ALTER TABLE etc_orders
	ADD FOREIGN KEY (order_no)
	REFERENCES orders (order_no)
;


ALTER TABLE side_orders
	ADD FOREIGN KEY (order_no)
	REFERENCES orders (order_no)
;


ALTER TABLE events
	ADD FOREIGN KEY (pizza_no)
	REFERENCES pizzas (pizza_no)
;


ALTER TABLE pizza_orders
	ADD FOREIGN KEY (pizza_no)
	REFERENCES pizzas (pizza_no)
;


ALTER TABLE topping_orders
	ADD FOREIGN KEY (pizza_order_no)
	REFERENCES pizza_orders (pizza_order_no)
;


ALTER TABLE answers
	ADD FOREIGN KEY (question_no)
	REFERENCES questions (question_no)
;


ALTER TABLE side_orders
	ADD FOREIGN KEY (side_no)
	REFERENCES sides (side_no)
;


ALTER TABLE topping_orders
	ADD FOREIGN KEY (topping_no)
	REFERENCES toppings (topping_no)
;


ALTER TABLE deliver_locations
	ADD FOREIGN KEY (user_no)
	REFERENCES users (user_no)
;


ALTER TABLE orders
	ADD FOREIGN KEY (user_no)
	REFERENCES users (user_no)
;


ALTER TABLE questions
	ADD FOREIGN KEY (question_writer)
	REFERENCES users (user_no)
;



/* Comments */

COMMENT ON COLUMN answers.question_no IS '문의테이블 PK 참조';
COMMENT ON COLUMN branches.branch_open_time IS 'HH:MI:SS 형식으로 작성';
COMMENT ON COLUMN branches.branch_close_time IS 'HH:MI:SS';
COMMENT ON COLUMN etc_orders.order_no IS '주문 테이블 PK';
COMMENT ON COLUMN events.pizza_no IS '피자 테이블 pk 참조';
COMMENT ON COLUMN orders.order_status IS '0부터 5까지';
COMMENT ON COLUMN orders.user_no IS '사용자 테이블 pk 참조';
COMMENT ON COLUMN orders.order_type IS '주문 : o
장바구니 : c';
COMMENT ON COLUMN pizza_orders.pizza_no IS '피자 테이블 PK 참조';
COMMENT ON COLUMN pizza_orders.pizza_size IS 'L, M 중 하나';
COMMENT ON COLUMN pizza_orders.dough_no IS '도우 테이블 pk 참조';
COMMENT ON COLUMN pizza_orders.pizza_order_price IS 'pizza 테이블 피자 가격 * dough 테이블 dough 가격 * amount';
COMMENT ON COLUMN pizza_orders.pizza_discount_price IS 'grade 테이블 discount * order_price';
COMMENT ON COLUMN pizza_orders.order_no IS '주문 테이블 PK 참조';
COMMENT ON COLUMN questions.question_writer IS '사용자 테이블 pk 참조';
COMMENT ON COLUMN side_orders.side_no IS '사이드 테이블 PK 참조';
COMMENT ON COLUMN side_orders.side_order_price IS 'side 테이블 price * amount';
COMMENT ON COLUMN side_orders.order_no IS '주문 테이블 PK 참조';
COMMENT ON COLUMN topping_orders.pizza_order_no IS '피자 주문 상세 테이블 PK 참조';
COMMENT ON COLUMN topping_orders.topping_no IS '토핑 테이블 PK 참조';
COMMENT ON COLUMN topping_orders.topping_order_amount IS '최대값5';
COMMENT ON COLUMN users.user_grade_name IS '등급테이블 PK를 참조하는 FK';
COMMENT ON COLUMN users.user_quit_detail IS '
';
COMMENT ON COLUMN users.quick_order_no IS '주문테이블 PK를 참조하는 FK';



