-- DDL
-- 테이블 생성
create table 고객(
    고객아이디 VARCHAR(20) not null primary key, 
    고객이름 VARCHAR(10) not null,
    나이 INT,
    등급 VARCHAR(10) not null,
    직업 VARCHAR(20),
    적립금 INT DEFAULT 0
);

create table 제품(
    제품번호 VARCHAR(5) not null,
    제품명 VARCHAR(20),
    재고량 int,
    단가 int,
    제조업체 VARCHAR(20),
    PRIMARY key(제품번호),
    check(재고량>=0 and 재고량<=10000)
);

create table 주문(
    주문번호 varchar(5) not null,
    주문고객 varchar(20),
    주문제품 varchar(5), 
    수량 int,
    배송지 varchar(30),
    주문일자 date,
    primary key(주문번호),
    foreign key(주문고객) references 고객(고객아이디),
    foreign key(주문제품) references 제품(제품번호)  
);

create table 배송업체(
    업체번호 varchar(5) not null primary key,
    업체명 varchar(20),
    주소 varchar(100),
    전화번호 varchar(20)
);

-- 테이블 변경
alter table 고객 add 가입날짜 date;
alter table 고객 drop COLUMN 가입날짜;