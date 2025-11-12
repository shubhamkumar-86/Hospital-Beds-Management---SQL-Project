#  DAY 8. Practice Questions


# 1. Convert all patient names to uppercase.

SELECT UPPER(name) AS upper_name
FROM patients;

# 2. Find the length of each staff member's name.

SELECT staff_name, LENGTH(staff_name) AS length_of_name
FROM staff;

# 3. Concatenate staff_id and staff_name with a hyphen separator.

SELECT CONCAT(staff_id,'-',staff_name) AS staff_id_name
FROM staff;


# DAY-08 DAILY CHALLENGE
# Question - Create a patient summary that shows patient_id, full name in uppercase, service in lowercase, age category
# (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length.
# Only show patients whose name length is greater than 10 characters.

SELECT
    patient_id,
    UPPER(name) AS full_name,
    LOWER(service) AS service,
    CASE
        WHEN age >= 65 THEN 'Senior'
        WHEN age >=18 THEN 'Adult'
        ELSE 'Minor'
END AS age_category
FROM patients
WHERE LENGTH(name) > 10
GROUP BY patient_id;























