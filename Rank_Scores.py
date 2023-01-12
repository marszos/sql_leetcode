select score, DENSE_RANK() OVER (order by score desc) as 'rank'
from Scores;
