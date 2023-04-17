select w.id, wp.age, w.coins_needed, w.power
from Wands w
left join Wands_property wp on w.code = wp.code
where wp.is_evil = 0
group by wp.age, w.power
order by w.power desc, wp.age desc;