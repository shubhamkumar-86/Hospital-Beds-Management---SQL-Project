#  DAY 5. Practice Questions

# 1. Count the total number of patients in the hospital.

SELECT COUNT(patient_id) AS total_no_of_patients
FROM patients;

# 2. Calculate the average satisfaction score of all patients.

SELECT AVG(satisfaction) AS average_satisfaction_score
FROM patients;

# 3. Find the minimum and maximum age of patients.

SELECT MIN(age) AS min_age, MAX(age) AS max_age
FROM patients;



# DAY-05 DAILY CHALLENGE
# Question: Calculate the total number of patients admitted, total patients refused, and
# the average patient satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places.

SELECT
    COUNT(patients_admitted) AS total_admitted_petients,
    COUNT(patients_refused) AS total_patients_refused,
    ROUND(AVG(patient_satisfaction),2) AS average_satisfaction
FROM services_weekly;






















