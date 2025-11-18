#  DAY 14. Practice Questions

# 1. Show all staff members and their schedule information (including those with no schedule entries).
SELECT s.staff_id, s.staff_name, s.role, s.service AS primary_service, ss.week, ss.service AS schedule_service
FROM staff s
LEFT JOIN staff_schedule ss
ON s.staff_id = ss.staff_id
ORDER BY s.staff_id, ss.week;

# 2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
SELECT DISTINCT sw.service AS weekly_service_name, s.staff_id, s.staff_name, s.role
FROM services_weekly sw
LEFT JOIN staff_schedule ss
ON sw.service=ss.service
LEFT JOIN staff s
ON ss.staff_id=s.staff_id
ORDER BY sw.service, s.staff_name;

# 3. Display all patients and their service's weekly statistics (if available).

SELECT p.*, sw.*
FROM patients p
LEFT JOIN services_weekly sw
ON p.service=sw.service AND sw.week=WEEK(p.arrival_date,1)
ORDER BY patient_id, sw.week;


# DAY-14 DAILY CHALLENGE
# Create a staff utilisation report showing all staff members (staff_id, staff_name, role, service) and
# the count of weeks they were present (from staff_schedule). Include staff members even if they have no schedule records.
# Order by weeks present descending.

SELECT s.staff_id, s.staff_name, s.role, s.service AS primary_service, COALESCE(SUM(ss.present),0) AS present_count
FROM staff s
LEFT JOIN staff_schedule ss
ON s.staff_id=ss.staff_id
GROUP BY s.staff_id, s.staff_name, s.role, s.service
ORDER BY present_count DESC, s.staff_name

