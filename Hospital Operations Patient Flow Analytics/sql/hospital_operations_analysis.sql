USE hospital_analytics;
DESCRIBE er_visits;
SELECT
    COUNT(*) AS total_visits,
    ROUND(AVG(`Total Wait Time (min)`), 2) AS avg_total_wait_min,
    ROUND(AVG(`Time to Registration (min)`), 2) AS avg_registration_min,
    ROUND(AVG(`Time to Triage (min)`), 2) AS avg_triage_min,
    ROUND(AVG(`Time to Medical Professional (min)`), 2) AS avg_medical_professional_min,
    ROUND(AVG(`Patient Satisfaction`), 2) AS avg_patient_satisfaction
FROM er_visits;

SELECT
    `Hospital Name` AS hospital_name,
    COUNT(*) AS total_visits,
    ROUND(AVG(`Total Wait Time (min)`), 2) AS avg_wait_min,
    ROUND(AVG(`Patient Satisfaction`), 2) AS avg_satisfaction
FROM er_visits
GROUP BY `Hospital Name`
ORDER BY avg_wait_min DESC;

SELECT
    `Region` AS region,
    COUNT(*) AS total_visits,
    ROUND(AVG(`Total Wait Time (min)`), 2) AS avg_wait_min,
    ROUND(AVG(`Patient Satisfaction`), 2) AS avg_satisfaction
FROM er_visits
GROUP BY `Region`
ORDER BY avg_wait_min DESC;

SELECT
    `Urgency Level` AS urgency_level,
    COUNT(*) AS total_visits,
    ROUND(AVG(`Total Wait Time (min)`), 2) AS avg_wait_min,
    ROUND(AVG(`Patient Satisfaction`), 2) AS avg_satisfaction
FROM er_visits
GROUP BY `Urgency Level`
ORDER BY avg_wait_min DESC;

SELECT
    `Time of Day` AS time_of_day,
    COUNT(*) AS total_visits,
    ROUND(AVG(`Total Wait Time (min)`), 2) AS avg_wait_min,
    ROUND(AVG(`Patient Satisfaction`), 2) AS avg_satisfaction
FROM er_visits
GROUP BY `Time of Day`
ORDER BY total_visits DESC;

SELECT
    `Day of Week` AS day_of_week,
    COUNT(*) AS total_visits,
    ROUND(AVG(`Total Wait Time (min)`), 2) AS avg_wait_min,
    ROUND(AVG(`Patient Satisfaction`), 2) AS avg_satisfaction
FROM er_visits
GROUP BY `Day of Week`
ORDER BY total_visits DESC;

SELECT
    ROUND(AVG(`Time to Registration (min)`), 2) AS avg_registration_min,
    ROUND(AVG(`Time to Triage (min)`), 2) AS avg_triage_min,
    ROUND(AVG(`Time to Medical Professional (min)`), 2) AS avg_medical_professional_min,
    ROUND(AVG(`Total Wait Time (min)`), 2) AS avg_total_wait_min
FROM er_visits;

SELECT
    `Specialist Availability` AS specialist_availability,
    COUNT(*) AS total_visits,
    ROUND(AVG(`Total Wait Time (min)`), 2) AS avg_wait_min,
    ROUND(AVG(`Patient Satisfaction`), 2) AS avg_satisfaction
FROM er_visits
GROUP BY `Specialist Availability`
ORDER BY avg_wait_min DESC;

SELECT
    `Nurse-to-Patient Ratio` AS nurse_to_patient_ratio,
    COUNT(*) AS total_visits,
    ROUND(AVG(`Total Wait Time (min)`), 2) AS avg_wait_min,
    ROUND(AVG(`Patient Satisfaction`), 2) AS avg_satisfaction
FROM er_visits
GROUP BY `Nurse-to-Patient Ratio`
ORDER BY nurse_to_patient_ratio;