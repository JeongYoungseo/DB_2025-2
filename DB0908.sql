-- <like 연산자>

-- 1. 고객테이블에서 성이 김씨인 고객의 고객이름, 나이, 등급 조회
select 고객이름, 나이, 등급 from 고객 where 고객이름 like '김%';

select * from 고객;

-- 2. 고객테이블에서 등급이 i문자가 포함된 고객의 고객이름, 등급, 직업 조회
select 고객이름, 등급, 직업 from 고객 where 등급 like '%i%';

-- 3.고객테이블에서 고객아이디에 a자가 포함된 고객의 고객아이다, 고객이름, 등급, 직업 조회
select 고객아이디, 고객이름, 등급, 직업 from 고객 where 고객아이디 like '%a%';

-- 4. 고객테이블에서 고객아이디에 a자가 포함되고, 등급에 i자가 포함된 고객의 고객아이디, 고객이름, 등급, 직업 조회
select 고객아이디, 고객이름, 등급, 직업 from 고객 where (고객아이디 like '%a%') and (등급 like '%i%');

-- 5. 고객테이블에서 고객아이디에 a자가 포함되고, 고객이름이 김씨이거나 등급에 i자가 포함된 고객의 고객아이디, 고객이름, 등급, 직업 조회
select 고객아이디, 고객이름, 등급, 직업 from 고객 where (고객이름 like '김%') and (고객아이디 like '%a%') and (등급 like '%i%');

-- 6. 고객테이블에서 고객아이디가 5글자인 고객의 고객아이디, 나이, 등급, 직업, 적립금 조회
select 고객아이디, 나이, 등급, 직업, 적립금 from 고객 where 고객아이디 like '_____';

-- 7. 고객테이블에서 고객아이디가 5글자이고 적립금이 3000원 이상인 고객의 고객아이디, 나이, 등급, 직업, 적립금 조회
select 고객아이디, 나이, 등급, 직업, 적립금 from 고객 where 고객아이디 like '_____' and 적립금 >= 3000;

-- 8. 고객테이블에서 직업명이 '사'자로 끝나는 고객의 고객이름, 직업, 등급 조회
select 고객이름, 직업, 등급 from 고객 where 직업 like '%사';

-- 9. 고객테이블에서 직업명이 '사'자로 끝나는 고객의 고객이름, 직업, 등급 조회
select 고객이름, 직업, 등급 from 고객 where 직업 like '_사';

-- <null 사용 is null or is not null> 
-- * 입력된 값이 없는 컬럼(필드)는 비교연산 결과가 false -> 조회x *

-- 1. 고객테이블에서 나이가 아직 입력되지 않은 고객의 고객이름, 나이 조회
select 고객이름, 나이 from 고객 where 나이 is null;

-- 2. 고객테이블에서 나이가 입력된 고객의 고객이름, 나이 조회
select 고객이름, 나이 from 고객 where 나이 is not null;

-- 3. 고객테이블에서 나이가 25세 미만인 고객의 고객이름, 나이 조회
select 고객이름, 나이 from 고객 where 나이 < 25;

-- 4. 고객테이블에서 나이가 25세 미만인 고객의 고객이름, 나이 조회
select 고객이름, 나이 from 고객 where 나이 >= 25;

-- <정렬: order by 속성리스트 asc(오름차순), desc(내림차순)>
-- null값: asc -> 맨 뒤 / desc -> 맨 위

-- 1. 고객테이블에서 고객이름, 나이 조회(나이 오름차순)
select 고객이름, 나이 from 고객 order by 나이 asc;

-- 2. 고객테이블에서 고객이름, 나이 조회(나이 내림차순)
select 고객이름, 나이 from 고객 order by 나이 desc;

-- 3. 고객테이블에서 등급이 Gold 혹은 Vip인 고객의 고객이름, 나이, 등급 조회(등급 오름차순)
select 고객이름, 나이, 등급 from 고객 where (등급 = 'Gold') or (등급 = 'Vip') order by 등급 asc;
select 고객이름, 나이, 등급 from 고객 where 등급 in('Gold', 'Vip') order by 등급 asc;

-- 4. 주문테이블에서 주문제품이 p03 또는 p06의 제품을 주문하고 배송지가 경기도인 행 조회(주문수량 내림차순)
select * from 주문 where (주문제품 = 'p03' or 주문제품 = 'p06') and 배송지 like '%경기도%' order by 수량 desc;

-- 5. 주문테이블에서 수량이 10개 이상인 주문의 주문고객, 주문제품, 수량, 주문일자 조회(주문제품 오름차순, 동일 제품 수량 기준 내림차순)
select 주문고객, 주문제품 , 수량, 주문일자 from 주문 where 수량 >=10 order by 주문제품 asc, 수량 desc;

-- 6. 주문테이블에서 a 또는 b로 시작하고 수량이 10개 이상인 주문의 주문고객, 주문제품, 수량, 배송지 조회(주문고객 내림차순, 동일 주문고객 배송지 기준 내림차순)    
select 주문고객, 주문제품, 수량, 배송지 from 주문 where (주문고객 like 'a%' or 주문고객 like 'b%') and (수량 >= 10) order by 주문고객 desc, 배송지 desc;

-- <집계함수: count(), max(), min(), sum(), avg() -> select절, having절에서만 사용 가능)>
-- * null값이 들어있는 컬럼의 값은 제외하고 계산 *

-- 1. 제품테이블에서 모든 제품의 단가 평균 조회
select  avg(단가) from 제품;

-- 2. 제품테이블에서 단가의 평균 조회(소수점 세째자리 반올림하여 둘째자리까지 표시.(round(avg(단가),2))
select round(avg(단가),2) 단가평균 from 제품;
select round(avg(단가),0) 단가평균 from 제품;
-- * 올림함수: ceil, 내림함수: floor *
select ceil(avg(단가)) 단가평균 from 제품;
select floor(avg(단가)) 단가평균 from 제품;

-- 3. 제품테이블에서 한빛제과에서 제조한 제품의 재고량 합계 조회
select sum(재고량) as "재고량 합계" from 제품 where 제조업체 = '한빛제과'; 

-- 4. 제품테이블에서 단가가 2500원 이상인 제품의 단가의 합계 조회
select sum(단가) as "2500원 이상의 단가 합계" from 제품 where 단가 >= 2500;

-- 5. 고객테이블에서 전체 고객수 조회
-- 5-1. 고객아이디(PK) -> 7명 
select count(고객아이디) as "고객수" from 고객; 
-- 5-2. 나이(null값 존재) -> 6명
select count(나이) 고객수 from 고객;
-- 5-3. * 사용 -> 7명(제일 많이 사용)
select count(*) as "고객수" from 고객;