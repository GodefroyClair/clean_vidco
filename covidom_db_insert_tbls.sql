COPY alert FROM '/covidom_csv/alert.csv' DELIMITER ',' CSV HEADER;

COPY alert_subitem FROM '/covidom_csv/alert_subitem.csv' DELIMITER ',' CSV HEADER;

-- NO DATA in checklist_* tables
/* COPY checklist_answer FROM '/covidom_csv/checklist_answer.csv' DELIMITER ',' CSV HEADER; */
/* COPY checklist_definition FROM '/covidom_csv/checklist_definition.csv' DELIMITER ',' CSV HEADER; */
/* COPY checklist_definition_preop FROM '/covidom_csv/checklist_definition_preop.csv' DELIMITER ',' CSV HEADER; */
/* COPY checklist_item FROM '/covidom_csv/checklist_item.csv' DELIMITER ',' CSV HEADER; */
/* COPY checklist_option FROM '/covidom_csv/checklist_option.csv' DELIMITER ',' CSV HEADER; */

COPY clinic FROM '/covidom_csv/clinic.csv' DELIMITER ',' CSV HEADER;
COPY clinic_doctor_hospit_followup FROM '/covidom_csv/clinic_followup_reason.csv' DELIMITER ',' CSV HEADER;
/* COPY clinic_followup_reason FROM '/covidom_csv/clinic_followup_reason.csv' DELIMITER ',' CSV HEADER; */

/* COPY data_alert_delay FROM '/covidom_csv/data_alert_delay.csv' DELIMITER ',' CSV HEADER; */
/* COPY data_alert_notresponding FROM '/covidom_csv/data_alert_notresponding.csv' DELIMITER ',' CSV HEADER; */
/* COPY data FROM '/covidom_csv/data.csv' DELIMITER ',' CSV HEADER; */
/* COPY data FROM '/covidom_csv/data.csv' DELIMITER ',' CSV HEADER; */
/* COPY data FROM '/covidom_csv/data.csv' DELIMITER ',' CSV HEADER; */
/* COPY data FROM '/covidom_csv/data.csv' DELIMITER ',' CSV HEADER; */
/* COPY data FROM '/covidom_csv/data.csv' DELIMITER ',' CSV HEADER; */
/* COPY data FROM '/covidom_csv/data.csv' DELIMITER ',' CSV HEADER; */
/* COPY data FROM '/covidom_csv/data.csv' DELIMITER ',' CSV HEADER; */

/* COPY doctor FROM '/covidom_csv/doctor.csv' DELIMITER ',' CSV HEADER; */
/* COPY doctor FROM '/covidom_csv/doctor.csv' DELIMITER ',' CSV HEADER; */

/* COPY end_reason FROM '/covidom_csv/end_reason.csv' DELIMITER ',' CSV HEADER; */

/* COPY medical FROM '/covidom_csv/medical.csv' DELIMITER ',' CSV HEADER; */
/* COPY medical FROM '/covidom_csv/medical.csv' DELIMITER ',' CSV HEADER; */

/* COPY patient FROM '/covidom_csv/patient.csv' DELIMITER ',' CSV HEADER; */
/* COPY patient FROM '/covidom_csv/patient.csv' DELIMITER ',' CSV HEADER; */
/* COPY patient FROM '/covidom_csv/patient.csv' DELIMITER ',' CSV HEADER; */
/* COPY patient FROM '/covidom_csv/patient.csv' DELIMITER ',' CSV HEADER; */
/* COPY patient FROM '/covidom_csv/patient.csv' DELIMITER ',' CSV HEADER; */

/* COPY survey FROM '/covidom_csv/survey.csv' DELIMITER ',' CSV HEADER; */
/* COPY survey FROM '/covidom_csv/survey.csv' DELIMITER ',' CSV HEADER; */
/* COPY survey FROM '/covidom_csv/survey.csv' DELIMITER ',' CSV HEADER; */

/* COPY task FROM '/covidom_csv/task.csv' DELIMITER ',' CSV HEADER; */
/* COPY task FROM '/covidom_csv/task.csv' DELIMITER ',' CSV HEADER; */

/* COPY year FROM '/covidom_csv/alert.csv' DELIMITER ',' CSV HEADER; */
