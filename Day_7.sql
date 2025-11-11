#  DAY 7. Practice Questions
# 1. Find services that have admitted more than 500 patients in total.

SELECT service, SUM(patients_admitted) as Total_admitted_patients
FROM services_weekly
GROUP BY service
HAVING SUM(patients_admitted) > 500;

# 2. Show services where average patient satisfaction is below 75.

SELECT service, AVG(patient_satisfaction) AS Average_satisfaction
FROM services_weekly
GROUP BY service
HAVING AVG(patient_satisfaction) < 75
ORDER BY Average_satisfaction DESC;

SELECT service, AVG(patient_satisfaction) FROM services_weekly
GROUP BY service;

# 3. List weeks where total staff presence across all services was less than 50.

SELECT service, week, SUM(present) AS Staff_schedule
FROM staff_schedule
GROUP BY service, week
HAVING SUM(present) < 50
ORDER BY week;




# DAY-07 DAILY CHALLENGE
# Identify services that refused more than 100 patients in total
# and had an average patient satisfaction below 80. Show service name, total refused, and average satisfaction.

SELECT
    service,
    SUM(patients_refused) AS Total_patient_refused,
    AVG(patient_satisfaction) AS Average_patient_satisfaction
FROM services_weekly
GROUP BY service
HAVING Total_patient_refused > 100 AND Average_patient_satisfaction < 80
ORDER BY Total_patient_refused DESC, Average_patient_satisfaction;
























