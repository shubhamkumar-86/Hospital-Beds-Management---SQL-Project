#  DAY 6. Practice Questions

# 1. Count the number of patients by each service.

SELECT
    service,
    COUNT(patient_id) AS Number_of_patients
FROM patients
GROUP BY service
ORDER BY Number_of_patients DESC;

# 2. Calculate the average age of patients grouped by service.

SELECT
    service,
    AVG(age) AS Average_age_of_patients
FROM patients
GROUP BY service
ORDER BY Average_age_of_patients DESC;

# 3. Find the total number of staff members per role.

SELECT
    role,
    COUNT(staff_id) AS Number_of_staff_members
FROM staff
GROUP BY role
ORDER BY Number_of_staff_members DESC;





# DAY-06 DAILY CHALLENGE
# Question: For each hospital service, calculate the total number of patients admitted,
# total patients refused, and the admission rate (percentage of requests that were admitted). Order by admission rate descending.

SELECT
    service,
    SUM(patients_admitted) AS Total_no_of_patient_admitted,
    SUM(patients_refused) AS Total_no_of_patient_refused,
    ROUND((SUM(patients_admitted) * 100.0) / (SUM(patients_admitted) + SUM(patients_refused)), 2) AS admission_rate_percentage
FROM services_weekly
GROUP BY service
ORDER BY Admission_rate_percentage DESC;

















