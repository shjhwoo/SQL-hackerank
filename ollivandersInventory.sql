select temp.id, wp.age, temp.mincoin, temp.power
from (select w.id, MIN(w.coins_needed) as mincoin, w.power, w.code
from Wands w
group by w.code, w.power) temp
join Wands_property wp 
on temp.code = wp.code
where wp.is_evil = 0
order by temp.power desc, wp.age desc

//이것도 안됨