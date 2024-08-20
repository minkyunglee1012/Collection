-- Window 함수 왜 OVER을 붙이는지
-- OVER 절은 윈도우 함수의 작동 범위(윈도우)를 지정하는 데 사용된다. 윈도우 함수는 테이블 전체 또는 테이블의 특정 부분에서 작동하는데, OVER 절을 통해 어떤 기준으로 데이터를 정렬하거나 그룹화할지 명확히 정의할 수 있다.

-- 역할:
-- 윈도우 정의: 어떤 행들을 대상으로 연산을 수행할지 범위를 지정
-- 정렬 순서: 데이터를 어떤 순서로 정렬할지 결정. 이 순서는 윈도우 함수의 계산 결과에 직접 영향을 미친다.
-- 파티션(그룹) 설정: 데이터를 그룹으로 나누고, 각 그룹 내에서 별도의 계산을 할 수 있도록 설정.
-- OVER 절을 사용하지 않으면, SQL은 윈도우 함수가 어떤 데이터를 대상으로 작업해야 하는지 알 수 없으므로 반드시 필요하다.

-- 윈도우 함수의 종류와 사용법

-- 1. 순위 관련 함수

-- RANK(): 특정 기준으로 순위를 매긴다. 동일한 값에 동일한 순위를 부여하고, 그다음 순위는 해당 순위 개수만큼 건너뛴다. (1, 2, 2, 4, 4, 4, 7..)
-- DENSE_RANK(): RANK()와 유사하지만, 동일한 순위를 가진 다음 행은 바로 다음 순위를 부여받는다. 순위가 건너뛰지 않는다. (1, 2, 2, 3, 3, 3, 4, ..)
-- ROW_NUMBER(): 각 행에 대해 고유한 순번을 부여합니다. 같은 값이라도 순번이 중복되지 않습니다. (1, 2, 3, 4, 5, 6, 7..)

SELECT 
    employee_id,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_dense_rank,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS salary_row_number
FROM employees;

-- RANK()와 DENSE_RANK()는 동일한 값을 가진 행들에 대해 같은 순위를 부여합니다. ROW_NUMBER()는 항상 연속된 번호를 부여**


-- 2. 집계 함수

-- SUM(): 특정 범위 내의 값들을 합산한다.
-- AVG(): 특정 범위 내의 값들의 평균을 계산한다.
-- COUNT(): 특정 범위 내의 행의 개수를 센다.
-- MAX(): 특정 범위 내에서 최대 값을 반환한다.
-- MIN(): 특정 범위 내에서 최소 값을 반환한다.

SELECT 
    department_id,
    employee_id,
    salary,
    SUM(salary) OVER (PARTITION BY department_id) AS dept_total_salary,
    AVG(salary) OVER (PARTITION BY department_id) AS dept_avg_salary
FROM employees;

-- 이 예제에서는 각 부서별로 총 급여(SUM)와 평균 급여(AVG) 계산


-- 3. 비율 계산 함수

-- NTILE(n): 데이터를 n개의 그룹으로 나눈다
-- PERCENT_RANK(): 순위 값을 0과 1 사이의 비율로 변환한다.
-- CUME_DIST(): 누적 분포를 계산합니다. 각 값이 데이터 집합 내에서 어느 정도의 비율로 누적되어 있는지를 보여준다.

SELECT 
    employee_id,
    salary,
    NTILE(4) OVER (ORDER BY salary DESC) AS salary_quartile,
    PERCENT_RANK() OVER (ORDER BY salary DESC) AS salary_percent_rank,
    CUME_DIST() OVER (ORDER BY salary DESC) AS salary_cume_dist
FROM employees;

-- NTILE(4)은 데이터를 4개의 그룹으로 나누고, PERCENT_RANK()는 순위가 전체 데이터에서 어느 정도에 해당하는지를 비율로 보여준다. CUME_DIST()는 누적 비율을 계산한다.


-- 4. LAG/LEAD 함수

-- LAG(): 현재 행을 기준으로 이전 행의 값을 반환
-- LEAD(): 현재 행을 기준으로 다음 행의 값을 반환

SELECT 
    employee_id,
    salary,
    LAG(salary, 1) OVER (ORDER BY salary) AS previous_salary,
    LEAD(salary, 1) OVER (ORDER BY salary) AS next_salary
FROM employees;

-- LAG()는 현재 행의 이전 행에 있는 값을, LEAD()는 다음 행의 값을 가져온다.


  

-- OVER 절: 윈도우 함수가 데이터의 어느 부분에 대해 작업을 수행할지 범위를 정의
-- 윈도우 함수의 종류: 순위 매기기, 집계, 비율 계산, 시계열 분석(LAG/LEAD) 등 다양한 연산을 수행
-- 사용법: ORDER BY로 정렬을 지정하고, PARTITION BY로 데이터를 그룹화하여 각 그룹 내에서 별도의 계산을 수행
-- 윈도우 함수는 복잡한 집계 작업이나 분석을 간결하게 처리할 수 있는 강력한 도구이다.
