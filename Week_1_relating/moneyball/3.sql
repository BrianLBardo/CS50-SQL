SELECT
  performances.year,
  performances.HR as "home runs"
FROM
  performances INNER JOIN players
ON
  performances.player_id = players.id
WHERE
  players.first_name = "Ken"
  AND players.last_name = "Griffey"
  AND players.birth_year = 1969
ORDER BY
  performances.year DESC;
