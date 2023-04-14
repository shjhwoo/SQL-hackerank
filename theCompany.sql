SELECT C.company_code, C.founder, COUNT(DISTINCT LM.lead_manager_code), COUNT(DISTINCT SM.senior_manager_code),
COUNT(DISTINCT M.manager_code), COUNT(DISTINCT E.employee_code)
FROM company as C
LEFT JOIN lead_manager as LM on C.company_code = LM.company_code
LEFT JOIN senior_manager as SM on LM.lead_manager_code = SM.lead_manager_code
LEFT JOIN manager as M on SM.senior_manager_code = M.senior_manager_code
LEFT JOIN employee as E on M.manager_code = E.manager_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code ASC;

-- sql 기본 정렬:
-- 문자와 숫자가 섞여있는 경우엔 숫자 크리를 비교안하고 문자 기준으로 정렬함
-- 예를 들어 C1, C2, C3, C4, C10이 있을 경우
-- 오름차순 정렬하면 
-- C1, C10, C2, C3, C4 이렇게 정렬된다

--group by 규칙
-- 집계로 계산되는 컬럼은 group by 항목에 미포함
-- 그렇지 않은 컬럼은 반드시 집계기준에 같이 포함해야 에러가 나지않는다