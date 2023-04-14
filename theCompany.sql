SELECT C.company_code, C.founder, COUNT(DISTINCT LM.lead_manager_code), COUNT(DISTINCT SM.senior_manager_code),
COUNT(DISTINCT M.manager_code), COUNT(DISTINCT E.employee_code)
FROM company as C
LEFT JOIN lead_manager as LM on C.company_code = LM.company_code
LEFT JOIN senior_manager as SM on LM.lead_manager_code = SM.lead_manager_code
LEFT JOIN manager as M on SM.senior_manager_code = M.senior_manager_code
LEFT JOIN employee as E on M.manager_code = E.manager_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code ASC;