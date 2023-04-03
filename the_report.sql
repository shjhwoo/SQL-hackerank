-- Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
-- The report must be in descending order by grade -- i.e. higher grades are entered first. 
-- If there is more than one student with the same grade (8-10) assigned to them,
--  order those particular students by their name alphabetically. 
--  Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
--  If there is more than one student with the same grade (1-7) assigned to them, 
--  order those particular students by their marks in ascending order.
-- Write a query to help Eve.

SELECT if(g.grade < 8, NULL, s.name), g.grade, s.marks
from students s
join grades g 
on s.marks between g.min_mark and g.max_mark
order by g.grade desc, s.marks asc;


//추가로 생각해볼 거
/*
LEFT JOIN해도 결과는 같았다.
다만 점수가 없는 학생 레코드의 경우엔 등급과 점수 모두 null로 처리되었다.
*/