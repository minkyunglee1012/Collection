-- WITH 절은 SQL에서 **공통 테이블 표현식(CTE, Common Table Expression)**을 정의하는 데 사용된다.
-- CTE는 복잡한 쿼리를 구성하는 데 유용한 임시 결과 집합이다. 쿼리의 나머지 부분에서 마치 테이블처럼 사용할 수 있다.

-- WITH 절을 사용하면 쿼리의 가독성이 향상되고, 중복된 서브쿼리를 피할 수 있어 관리가 쉬워진다. 특히, 재귀 쿼리나 복잡한 쿼리에서 많이 사용된다.


-- WITH 절의 구조
WITH CTE_Name AS (
    -- CTE에서 반환할 데이터를 정의하는 쿼리
    SELECT ...
)
-- CTE를 참조하는 메인 쿼리
SELECT ...
FROM CTE_Name


    
-- 예시
WITH RankedRest AS (
    SELECT 
        FOOD_TYPE, 
        REST_ID, 
        REST_NAME, 
        FAVORITES,
        ROW_NUMBER() OVER (PARTITION BY FOOD_TYPE ORDER BY FAVORITES DESC) AS rn
    FROM REST_INFO
)
SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM RankedRest
WHERE rn = 1
ORDER BY FOOD_TYPE DESC;


-- 여기서 RankedRest라는 이름의 CTE가 정의되었다. 
-- 이 CTE는 REST_INFO 테이블에서 FOOD_TYPE별로 가장 높은 FAVORITES를 가진 레스토랑을 찾기 위해 ROW_NUMBER()를 사용해 각 레코드에 순위를 매긴다. 
-- 그 다음 메인 쿼리는 RankedRest CTE를 참조하여, 각 FOOD_TYPE의 가장 인기 있는 레스토랑을 선택한다.


-- WITH 절을 사용하지 않았다면 서브쿼리를 여러 번 중복해서 사용하거나 복잡한 쿼리로 인해 가독성이 떨어진다.
