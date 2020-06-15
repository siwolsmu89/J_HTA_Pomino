-- 수동으로 편집한 제약조건들
-- FULL 주소가 중복되지 않도록
ALTER TABLE deliver_locations
    ADD CONSTRAINT location_full_addr_uk UNIQUE (location_addr_first, location_addr_second, location_addr_detail)
;

ALTER TABLE branches
    ADD CONSTRAINT branch_full_addr_uk UNIQUE (branch_addr_first, branch_addr_second, branch_addr_detail)
;

-- 사용자의 성별은 M또는 F여야 한다는 체크 제약조건
ALTER TABLE users
    ADD CONSTRAINT user_gender_cc CHECK (user_gender IN ('M', 'F'))
;

-- 매장 영업 시작/종료 시간은 __:__:__ 형태로 작성되어야 한다는 체크 제약조건
ALTER TABLE branches
    ADD CONSTRAINT branch_open_time_cc CHECK (branch_open_time LIKE ('__:__:__'))
    ADD CONSTRAINT branch_close_time_cc CHECK (branch_close_time LIKE('__:__:__'))
;

-- 토핑 주문 수량은 5개 이하여야 함
ALTER TABLE topping_orders
    ADD CONSTRAINT topping_amount_cc CHECK (topping_order_amount <= 5)
;