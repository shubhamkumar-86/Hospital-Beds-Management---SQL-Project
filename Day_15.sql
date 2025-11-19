#  DAY 15. Practice Questions
# 1. Join patients, staff, and staff_schedule to show patient service and staff availability.
SELECT p.name AS patient_name, p.service AS patient_service, s.staff_name, s.role, WEEK(p.arrival_date,1) AS week,
       CASE WHEN ss.present = 1 THEN 'Yes' ELSE 'No' END AS availability
FROM patients p
JOIN staff s
ON p.service=s.service
JOIN staff_schedule ss
ON s.staff_id=ss.staff_id AND week = ss.week;

# 2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
SELECT sw.service, sw.week, sw.patient_satisfaction, s.staff_name, ss.present
FROM services_weekly sw
JOIN staff s
ON sw.service=s.service
LEFT JOIN staff_schedule ss
ON s.staff_id=ss.staff_id AND sw.week=ss.week;

# 3. Create a multi-table report showing patient admissions with staff information.
SELECT p.patient_id, p.name AS patient_name, p.service, sw.week,sw.patients_admitted, s.staff_name, s.role, ss.present
FROM patients p
LEFT JOIN services_weekly sw
ON p.service = sw.service
LEFT JOIN staff s
ON p.service = s.service
LEFT JOIN staff_schedule ss
ON s.staff_id = ss.staff_id AND sw.week = ss.week;


# DAY-15 DAILY CHALLENGE
# Create a comprehensive service analysis report for week 20 showing: service name, total patients admitted that week,
# total patients refused, average patient satisfaction, count of staff assigned to service,
# and count of staff present that week. Order by patients admitted descending.

SELECT sw.service, SUM(sw.patients_admitted) AS total_admitted, SUM(sw.patients_refused) AS total_refused,
ROUND(AVG(sw.patient_satisfaction), 2) AS avg_satisfaction, COUNT(DISTINCT s.staff_id) AS staff_assigned,
COUNT(DISTINCT CASE WHEN ss.present = 'Yes' THEN ss.staff_id END) AS staff_present
FROM services_weekly sw
LEFT JOIN staff s
ON sw.service = s.service
LEFT JOIN staff_schedule ss
ON s.staff_id = ss.staff_id
AND sw.week = ss.week WHERE sw.week = 20
GROUP BY sw.service
ORDER BY total_admitted DESC;
















