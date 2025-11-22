# DAY - 17 PRACTICE QUESTIONS

# 1. Show each patient with their service's average satisfaction as an additional column.

SELECT patient_id, name AS patient_name, service,
       (SELECT AVG(satisfaction) FROM patients p2
        WHERE p2.service=p1.service) AS avg_satisfaction
FROM patients p1;

# 2. Create a derived table of service statistics and query from it.

SELECT p.patient_id, p.name AS patient_name, p.service,s.avg_satisfaction
FROM patients p
JOIN (SELECT service, AVG(satisfaction) avg_satisfaction FROM patients
    GROUP BY service) AS s
ON p.service=s.service;

# 3. Display staff with their service's total patient count as a calculated field.

SELECT s.staff_id, s.staff_name, s.service, p.patient_count
FROM staff s
JOIN(
    SELECT service, COUNT(patient_id) AS patient_count
    FROM patients
    GROUP BY service
) AS p
ON s.service=p.service;



# DAY - 17 DAILY CHALLENGE
# Create a report showing each service with: service name, total patients admitted, the difference between their
# total admissions and the average admissions across all services, and a rank indicator ('Above Average', 'Average', 'Below Average').
# Order by total patients admitted descending.

SELECT s.service AS service_name, s.total_admitted,
       ROUND(s.total_admitted - b.avg_total_admitted, 2) AS 'total & average admission difference',
       CASE
           WHEN s.total_admitted > b.avg_total_admitted THEN 'Above Average'
           WHEN s.total_admitted = b.avg_total_admitted THEN 'Average'
           ELSE 'Below average'
END AS 'rank_indicate'
FROM (
    SELECT service, sum(patients_admitted) AS total_admitted
    FROM services_weekly
    GROUP BY service
     ) AS s
CROSS JOIN (
    SELECT AVG(total_per_service) AS avg_total_admitted
    FROM (
        SELECT SUM(patients_admitted) AS total_per_service
        FROM services_weekly
        GROUP BY service
         ) AS a
) AS b
ORDER BY total_admitted DESC;














