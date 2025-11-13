#  DAY 8. Practice Questions

# 1. Extract the year from all patient arrival dates.

SELECT name, YEAR(arrival_date) AS Extracted_arrival_year
FROM patients;

# 2. Calculate the length of stay for each patient (departure_date - arrival_date).

SELECT name, arrival_date, departure_date, (departure_date - arrival_date) AS length_of_stay
FROM patients;

# 3. Find all patients who arrived in a specific month.

SELECT patient_id, name, MONTH(arrival_date) AS specific_month
FROM patients;




# DAY-09 DAILY CHALLENGE
# Question: Calculate the average length of stay (in days) for each service, showing only services
# where the average stay is more than 7 days. Also show the count of patients and order by average stay descending.

SELECT
    service,
    AVG(DATEDIFF(departure_date , arrival_date)) AS average_stay_length,
    COUNT(patient_id) AS total_patient_count
FROM patients
GROUP BY service
HAVING average_stay_length > 7
ORDER BY average_stay_length DESC;





















