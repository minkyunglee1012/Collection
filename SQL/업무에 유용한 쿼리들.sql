-- 내가 보려고 만든 업무에 유용한 쿼리들 -- 

--테이블 컬럼 개수 확인 쿼리
SELECT count(*)
FROM table_columns
WHERE table_name = '테이블 명'
AND schema_name = '스키마 명'

  
-- 테이블 그룹별 코드 카운트 쿼리
SELECT 
    'COL1' AS COLUMN_NAME, 
    COL1 AS VALUE, 
    COUNT(*) AS GROUP_COUNT
FROM 스키마명.테이블명
GROUP BY COL1
UNION ALL
SELECT 
    'COL2' AS COLUMN_NAME, 
    COL2 AS VALUE, 
    COUNT(*) AS GROUP_COUNT
FROM 스키마명.테이블명
GROUP BY COL2
UNION ALL
SELECT 
    'COL3' AS COLUMN_NAME, 
    COL3 AS VALUE, 
    COUNT(*) AS GROUP_COUNT
FROM 스키마명.테이블명
GROUP BY COL3
  ...
ORDER BY COLUMN_NAME, VALUE 

  
-- 중복 개수 확인
SELECT COUNT(1), COUNT(distinct COL1)
FROM 테이블명

SELECT COL1, count(COL1)
FROM 테이블명
GROUP BY COL1
HAVING count(COL1) > 1


-- 특정 행 데이터 삭제
DELETE FROM 테이블명 WHERE a = '_';
-- 모든 데이터 삭제
TRUNCATE TABLE 스키마명.테이블명
-- 테이블 삭제
DROP TABLE 테이블명

  
-- 보고싶은 테이블 찾기
SELECT * 
FROM TABLE_COLUMNS           -- VIEW도 마찬가지로 하면 된다
WHERE 1=1 
AND SCHEMA_NAME = '스키마명'
AND TABLE_NAME LIKE '%CQ_%'
ORDER BY POSITION 

  
-- 중복 있을 때 컬럼명은 그대로 새로운 테이블 만들어서(1) 중복 없애고 데이터 값 넣기(2)
CREATE COLUMN TABLE 스키마명.새로운테이블명
LIKE 스키마명.기존테이블명;

SELECT DISTINCT * 
FROM 스키마명.기존테이블명 
INTO 스키마명.새로운테이블명;

SELECT * FROM 스키마명.새로운테이블명


-- 교집합
INTERSECT
-- 차집합
EXCEPT 
