select CONCAT(h.hacker_id,'  ', h.name)
from submissions s
left join challenges c on s.challenge_id = c.challenge_id
left join difficulty d on c.difficulty_level = d.difficulty_level
left join hackers h on s.hacker_id = h.hacker_id
where s.score = d.score
group by h.hacker_id, h.name
having count(s.hacker_id) > 1
order by count(s.hacker_id) desc, h.hacker_id;
