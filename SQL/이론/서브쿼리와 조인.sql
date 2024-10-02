-- 서브쿼리(Subquery)와 조인(JOIN)을 같이 사용하는 것은 데이터베이스 쿼리 작성 시 다양한 데이터 집합을 결합하고 필터링하는 데 유용하다. 이를 통해 복잡한 조건을 만족하는 데이터를 추출할 수 있다.
-- 실무에서도 서브쿼리와 조인을 사용할 수 있는 능력은 기본이며, 다양한 연계키와 조인해서 데이터를 추출하거나 검증하는 경우 서브쿼리와 조인의 조합은 필수로 사용된다.


-- 서브쿼리(Subquery):

-- 서브쿼리는 쿼리 내에서 실행되는 또 다른 쿼리이다.
-- 주로 SELECT, INSERT, UPDATE, DELETE 문 안에서 사용되며, 주 쿼리(main query)의 필터링이나 데이터 처리에 사용된다.
-- 서브쿼리는 한 행 또는 다중 행을 반환할 수 있다.
  
-- 대표적인 서브쿼리 종류:
-- 스칼라 서브쿼리(Scalar Subquery): 하나의 값을 반환하는 서브쿼리입니다. 예를 들어, 특정 값을 비교할 때 사용
-- 행 서브쿼리(Row Subquery): 하나의 행을 반환하는 서브쿼리로, 여러 값을 동시에 비교할 때 사용.
-- 테이블 서브쿼리(Table Subquery): 여러 행을 반환하는 서브쿼리입니다. IN, EXISTS 같은 키워드와 함께 많이 사용


  
-- 조인(JOIN):

-- 조인은 두 개 이상의 테이블을 연결하여 데이터를 결합하는 방법이다. 조인의 종류에는 INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN 등이 있다.
-- INNER JOIN: 두 테이블 간에 일치하는 행만 반환
-- LEFT JOIN: 왼쪽 테이블의 모든 행과 오른쪽 테이블의 일치하는 행을 반환, 일치하지 않는 오른쪽 테이블의 데이터는 NULL로 표시
-- RIGHT JOIN: 오른쪽 테이블의 모든 행과 왼쪽 테이블의 일치하는 행을 반환, 일치하지 않는 왼쪽 테이블의 데이터는 NULL로 표시
-- FULL OUTER JOIN: 두 테이블의 모든 행을 반환하며, 일치하지 않는 부분은 NULL로 표시





-- 문제 : FOOD_PRODUCT와 FOOD_ORDER 테이블에서 생산일자가 2022년 5월인 식품들의 식품 ID, 식품 이름, 총매출을 조회하는 SQL문을 작성해주세요. 
--        이때 결과는 총매출을 기준으로 내림차순 정렬해주시고 총매출이 같다면 식품 ID를 기준으로 오름차순 정렬해주세요.

SELECT p.PRODUCT_ID, p.PRODUCT_NAME, o.AMOUNT * p.PRICE as TOTAL_SALES
FROM FOOD_PRODUCT p JOIN (SELECT PRODUCT_ID, SUM(AMOUNT) as AMOUNT
                          FROM FOOD_ORDER
                          WHERE DATE_FORMAT(PRODUCE_DATE, '%Y-%m') = '2022-05'
                          GROUP BY PRODUCT_ID) as o
                    ON p.PRODUCT_ID = o.PRODUCT_ID
ORDER BY TOTAL_SALES DESC, p.PRODUCT_ID ASC;

