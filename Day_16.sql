# DAY - 16 PRACTICE QUESTIONS

# 1. Find patients who are in services with above-average staff count.
SELECT p.patient_id, p.name AS patient_name, p.service
FROM patients p
WHERE p.service IN (SELECT service
                    FROM staff
                    GROUP BY service
                    HAVING COUNT(staff_id) > (SELECT AVG(staff_count)
                                              FROM (SELECT COUNT(staff_id) AS staff_count
                                                    FROM staff
                                                    GROUP BY service) sc));
# 2. List staff who work in services that had any week with patient satisfaction below 70.
SELECT s.staff_id, s.staff_name, s.service
FROM staff s
WHERE service IN (
    SELECT DISTINCT service
    FROM services_weekly
    WHERE patient_satisfaction <70
    );
# 3. Show patients from services where total admitted patients exceed 1000.
SELECT p.patient_id, p.name AS patient_name, p.service
FROM patient p
WHERE p.service IN (
    SELECT service FROM service_weekly
    GROUP BY service
    HAVING SUM(patients_admitted) > 1000
    );

# DAY - 16 DAILY CHALLENGE
# Find all patients who were admitted to services that had at least one week where patients were refused
# AND the average patient satisfaction for that service was below the overall hospital average satisfaction.
# Show patient_id, name, service, and their personal satisfaction score.

SELECT p.patient_id, p.name AS patient_name, p.service, p.satisfaction
FROM patients p
WHERE p.service IN (SELECT service FROM services_weekly
                    WHERE patients_refused > 0
                    GROUP BY service)
AND p.service IN (SELECT service FROM PATIENTS
                  GROUP BY service
                  HAVING AVG(satisfaction)<(SELECT AVG(satisfaction) FROM patients));





