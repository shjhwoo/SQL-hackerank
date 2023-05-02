select temp.id, wp.age, temp.mincoin, temp.power
from (select w.id, MIN(w.coins_needed) as mincoin, w.power, w.code
from Wands w
group by w.code, w.power) temp
join Wands_property wp 
on temp.code = wp.code
where wp.is_evil = 0
order by temp.power desc, wp.age desc

//이것도 안됨


-- 다시

SELECT W.id, P.age, W.coins_needed, W.power
FROM Wands W
JOIN Wands_property P ON W.Code = P.Code
WHERE P.is_evil = 0
AND W.coins_needed = 
(
    SELECT MIN(W1.coins_needed) 
    FROM Wands W1
    JOIN Wands_property P1 ON W1.Code = P1.Code
    WHERE P1.is_evil = 0
    AND W1.power = W.power
    AND P1.age = P.age    
)
ORDER BY W.power DESC, P.age DESC