-- 집계함수(distinct) --

-- 1. 제품테이블에서 제조업체의 수 조회
select 제조업체 from 제품;
select count(제조업체) from 제품;
select count(distinct 제조업체) as "제조업체의 수" from 제품;
-- 2. 주문테이블에서 주문고객의 수 조회
select count(*) from 주문;
select count(DISTINCT 주문고객) as "주문고객의 수"from 주문;
select 주문고객 from 주문;
select * from 주문;

-- 그룹별 검색(grou by), 조건검색(having -> group by에서만 가능) -- 

-- 1. 주문테이블에서 주문제품별 수량의 합계 조회
select 주문제품, sum(수량) as 총주문수량 from 주문 group by 주문제품 order by 주문제품;
-- 2. 주문테이블에서 주문고객별 수량의 평균 조회(주문고객 기준으로 내림차순, 수량 평균은 소수점 이하 첫째자리까지)
select 주문고객, round(avg(수량), 1) as 평균수량 from 주문 group by 주문고객 order by 주문고객 desc;
-- 3. 고객테이블에서 등급별 적립금 평균 등급 기준으로 오름차순 조회(적립금 평균 소수점 둘째자리까지)
select 등급, round(avg(적립금), 2) from 고객 group by 등급 order by 등급;
-- 3. 제품테이블에서 제조업체별 제조한 제품의 개수와 제품 중 가장 비싼 단가 조회(제품의 개수는 제품수, 가장 비싼 단가는 최고가로 출력)
select 제조업체, count(*) as 제품수, max(단가) as 최고가 from 제품 group by 제조업체; 
-- 4. 고객테이블에서 직업별 나이의 평균과 가장 작은 적립금 조회( 나이의 평균은 평균 나이, 가장 작은 적립금은 최저 적립금으로 출력)
select  직업, avg(나이) as "평균 나이", min(적립금) as "최저 적립금" from 고객 group by 직업;
-- 5. 제품테이블에서 제품을 3개 이상 제조한 제조업체별 제조한 제품의 개수와 제품 중 가장 비싼 단가 조회(제품의 개수는 제품수, 가장 비싼 단가는 최고가로 출력)
select 제조업체, count(*) as 제품수, max(단가) as 최고가 from 제품 group by 제조업체 having count(*)>=3; 
-- 6. 제품테이블에서 제조업체별 제조한 제품의 개수와 제품 중 가장 비싼 단가(4000원 이상) 조회(제품의 개수는 제품수, 가장 비싼 단가는 최고가로 출력)
select 제조업체, count(*) as 제품수, max(단가) as 최고가 from 제품 group by 제조업체 having max(단가)>=4000;
-- 7. 제품테이블에서 (제품을 2개 이하) 제조한 제조업체별 제조한 제품의 개수와 제품 중 가장 비싼 단가(4000원 이상) 조회(제품의 개수는 제품수, 가장 비싼 단가는 최고가로 출력)
select 제조업체, count(*) as 제품수, max(단가) as 최고가 from 제품 group by 제조업체 having max(단가)>=4000 and count(*)<=2;
-- 8. 고객테이블에서 적립금 평균이 1000원 이상인 등급에 대해 등급별 고객수와 적립금 평균 조회(등급별 고객수는 고객수로, 적립금 평균은 평균적립금으로 소수점 이하 둘째자리까지 출력.)
select 등급, count(*) as 고객수, round(avg(적립금),2) as "평균 적립금" from 고객 group by 등급 having avg(적립금)>=1000;
-- 9. 주문테이블에서 각 주문고객이 주문한 제품의 총주문수량을 주문제품별로 조회
select 주문제품, 주문고객, sum(수량) as 총주문수량 from 주문 group by 주문제품, 주문고객;
-- 10. 주문테이블에서 각 주문고객이 주문한 제품의 총주문수량을 주문제품별로 조회(총주문수량이 30개 이상,주문제품이 p01~p03까지 출력)
select 주문제품, 주문고객, sum(수량) as 총주문수량 from 주문 group by 주문제품, 주문고객 having sum(수량)>=30 and 주문제품 in('p01','p02','p03') order by 주문제품;

-- 여러 테이블을 조인 검색(join/자연조인-natural join) --

-- 1. 주문테이블과 제품테이블에서 주문번호, 주문고객, 제품명, 단가, 제조업체 조회
select 주문번호, 주문고객, 제품명, 단가, 제조업체 from 주문, 제품 where 주문제품=제품번호;
-- 2. banana 고객이 주문한 제품의 이름 조회
select 제품명 from 주문, 제품 where 주문고객='banana' and 주문제품=제품번호;
-- 3. 고객이름, 나이, 직업, 제품명, 단가, 주문일자, 배송지 등을 apple 고객이 주문한 정보로 조회
select 고객이름, 나이, 직업, 제품명, 단가, 주문일자, 배송지 from 고객, 제품, 주문 where 주문고객='apple' and 주문고객=고객아이디 and 주문제품=제품번호;
-- 4. 나이가 30세 이상인 고객이 주문한 제품의 번호, 제품명, 주문일자 조회
select 제품번호, 제품명, 주문일자, 나이 from 고객, 제품, 주문 where 나이>=30 and 주문고객=고객아이디 and 제품번호=주문제품 order by 제품번호;