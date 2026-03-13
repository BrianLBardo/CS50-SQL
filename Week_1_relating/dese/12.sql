SELECT
  expenditures.per_pupil_expenditure AS "per pupil expenditure",
  staff_evaluations.exemplary AS "exemplary teachers percentage",
  districts.name AS "district"
FROM
  districts
  INNER JOIN expenditures
  INNER JOIN staff_evaluations
  ON districts.id = expenditures.district_id
  AND staff_evaluations.district_id = districts.id
WHERE
  districts.type = "Public School District"
  AND expenditures.per_pupil_expenditure > (
    SELECT
      AVG(per_pupil_expenditure)
    FROM
      expenditures
  )
  AND staff_evaluations.exemplary > (
    SELECT
      AVG(exemplary)
    FROM
      staff_evaluations
  )
ORDER BY
  "exemplary teachers percentage" DESC,
  "per pupil expenditure" DESC;
