-- 1. List all patients who visited the hospital for a consultation.

SELECT 
    p.patient_id, p.first_name, p.last_name, a.reason_for_visit
FROM
    patients p
        JOIN
    appointments a ON p.patient_id = a.patient_id
WHERE
    a.reason_for_visit LIKE '%consultation%';
    
    
-- 2. Find the total number of appointments per doctor.

SELECT 
    d.doctor_id,
    d.first_name,
    d.last_name,
    COUNT(a.appointment_id) AS total_appointments
FROM
    doctors d
        JOIN
    appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY total_appointments DESC;


-- 3. Show patients who have been billed more than ₹10,000 in total.

SELECT 
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
	CONCAT('₹', FORMAT(SUM(b.amount), 2)) AS total_billed
FROM
    patients p
        JOIN
    billing b ON p.patient_id = b.patient_id
GROUP BY p.patient_id
HAVING SUM(b.amount) > 10000
ORDER BY SUM(b.amount) DESC;


-- 4. Find the most common reason patients visit the hospital.

SELECT 
    reason_for_visit, COUNT(*) AS visit_count
FROM
    appointments
GROUP BY reason_for_visit
ORDER BY visit_count DESC
LIMIT 3;


-- 5. List treatments with patient names, doctor names, and treatment cost.

SELECT 
    t.treatment_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    t.treatment_type,
    t.treatment_date,
    CONCAT('₹', FORMAT(t.cost, 2)) AS treatment_cost
FROM
    treatments t
        JOIN
    appointments a ON t.appointment_id = a.appointment_id
        JOIN
    patients p ON a.patient_id = p.patient_id
        JOIN
    doctors d ON a.doctor_id = d.doctor_id
ORDER BY t.treatment_date DESC;


-- 6. Show all appointments with their billing status.

SELECT 
    a.appointment_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    t.treatment_type,
    b.payment_status
FROM
    appointments a
        JOIN
    patients p ON a.patient_id = p.patient_id
        LEFT JOIN
    treatments t ON a.appointment_id = t.appointment_id
        LEFT JOIN
    billing b ON t.treatment_id = b.treatment_id
ORDER BY a.appointment_date DESC;


-- 7. Find the total revenue generated each month.

SELECT 
    DATE_FORMAT(b.bill_date, '%Y-%m') AS billing_month,
    CONCAT('₹', FORMAT(SUM(b.amount), 2)) AS monthly_revenue
FROM
    billing b
GROUP BY billing_month
ORDER BY billing_month;


-- 8. Find each patient's most recent appointment date.

SELECT 
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    MAX(a.appointment_date) AS last_visit_date
FROM
    patients p
        JOIN
    appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id , p.first_name , p.last_name
ORDER BY last_visit_date DESC;


-- 9. Find the doctor who treated the most unique patients.

SELECT 
    d.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    COUNT(DISTINCT a.patient_id) AS unique_patients
FROM
    doctors d
        JOIN
    appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id , d.first_name , d.last_name
ORDER BY unique_patients DESC
LIMIT 1;


-- 10. Rank patients by total treatment cost.

SELECT 
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    SUM(t.cost) AS total_cost,
    RANK() OVER (ORDER BY SUM(t.cost) DESC) AS cost_rank
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
JOIN treatments t ON a.appointment_id = t.appointment_id
GROUP BY p.patient_id, p.first_name, p.last_name
ORDER BY total_cost DESC;