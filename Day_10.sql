#  DAY 10. Practice Questions

# 1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
SELECT name, patient_id, satisfaction,
       CASE WHEN satisfaction >= 90 THEN 'High'
            WHEN satisfaction >=85 THEN 'Medium'
ELSE 'Low' END AS satisfaction_category
FROM patients;


# 2. Label staff roles as 'Medical' or 'Support' based on role type.
SELECT staff_id, role,
       CASE WHEN role = 'Doctor' THEN 'Medical'
ELSE 'Support' END AS role_category
FROM staff;


# 3. Create age groups for patients (0-18, 19-40, 41-65, 65+).
SELECT age,
    CASE WHEN age <= 18 THEN '0-18'
         WHEN age <= 40 THEN '19-40'
         WHEN age <= 65 THEN '41-65'
ELSE '65+' END AS age_group
FROM patients;





# DAY-10 DAILY CHALLENGE
# Question: Create a service performance report showing service name, total patients admitted, and a performance category
# based on the following: 'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65,
# otherwise 'Needs Improvement'. Order by average satisfaction descending.

SELECT
    service,
    SUM(patients_admitted) AS total_admitted_patient,
    AVG(patient_satisfaction) AS average_satisfaction,
    CASE
        WHEN AVG(patient_satisfaction) >=85 THEN 'Excellent'
        WHEN AVG(patient_satisfaction) >=75 THEN 'Good'
        WHEN AVG(patient_satisfaction) >=65 THEN 'Fair'
ELSE 'Needs Improvement' END AS performance_category
FROM services_weekly
GROUP BY service
ORDER BY average_satisfaction DESC;




















