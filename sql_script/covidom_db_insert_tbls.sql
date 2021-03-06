-- Prep: delete all rows in db

DELETE FROM alert;

DELETE FROM alert_subitem;

DELETE FROM checklist_answer;

DELETE FROM checklist_definition;

DELETE FROM checklist_definition_preop;

DELETE FROM checklist_item;

DELETE FROM checklist_option;

DELETE FROM clinic;

DELETE FROM clinic_doctor_hospit_followup;

DELETE FROM clinic_followup_reason;

DELETE FROM data_alert_delay;

DELETE FROM data_alert_notresponding;

DELETE FROM data_demography;

DELETE FROM data_patient_stay_evolution;

DELETE FROM data_preadmission;

DELETE FROM data_stay;

DELETE FROM data_user_account;

DELETE FROM doctor;

DELETE FROM doctor_list;

DELETE FROM end_reason;

DELETE FROM medical_department;

DELETE FROM medical_department_list;

DELETE FROM medical_department_list;

DELETE FROM patient;

DELETE FROM patient_mapping;

DELETE FROM patient_note;

DELETE FROM patient_stay;

DELETE FROM patient_stay_evolution;

DELETE FROM survey_answer;

DELETE FROM survey_definition;

DELETE FROM survey_item;

DELETE FROM task;

DELETE FROM task_detail;

DELETE FROM year;

-- insert new rows in db

COPY medical_department_list FROM '/covidom_csv/medical_department_list.csv' DELIMITER ',' CSV HEADER;

COPY medical_department_list FROM '/covidom_csv/medical_department_list_comp.csv' DELIMITER ',' CSV HEADER;

COPY patient FROM '/covidom_csv/patient.csv' DELIMITER ',' CSV HEADER;

COPY patient_stay FROM '/covidom_csv/patient_stay.csv' DELIMITER ',' CSV HEADER;

COPY medical_department FROM '/covidom_csv/medical_department.csv' DELIMITER ',' CSV HEADER;

COPY doctor_list FROM '/covidom_csv/doctor_list.csv' DELIMITER ',' CSV HEADER;

COPY alert FROM '/covidom_csv/alert.csv' DELIMITER ',' CSV HEADER;

COPY alert_subitem FROM '/covidom_csv/alert_subitem.csv' DELIMITER ',' CSV HEADER;

COPY checklist_answer FROM '/covidom_csv/checklist_answer.csv' DELIMITER ',' CSV HEADER;

COPY checklist_definition FROM '/covidom_csv/checklist_definition.csv' DELIMITER ',' CSV HEADER;

COPY checklist_definition_preop FROM '/covidom_csv/checklist_definition_preop.csv' DELIMITER ',' CSV HEADER;

COPY checklist_item FROM '/covidom_csv/checklist_item.csv' DELIMITER ',' CSV HEADER;

COPY checklist_option FROM '/covidom_csv/checklist_option.csv' DELIMITER ',' CSV HEADER;

COPY clinic FROM '/covidom_csv/clinic.csv' DELIMITER ',' CSV HEADER;

COPY clinic_doctor_hospit_followup FROM '/covidom_csv/clinic_doctor_hospit_followup.csv' DELIMITER ',' CSV HEADER;

COPY clinic_followup_reason FROM '/covidom_csv/clinic_followup_reason.csv' DELIMITER ',' CSV HEADER;

COPY data_alert_delay FROM '/covidom_csv/data_alert_delay.csv' DELIMITER ',' CSV HEADER;

COPY data_alert_notresponding FROM '/covidom_csv/data_alert_notresponding.csv' DELIMITER ',' CSV HEADER;

COPY data_demography FROM '/covidom_csv/data_demography.csv' DELIMITER ',' CSV HEADER;

COPY data_patient_stay_evolution FROM '/covidom_csv/data_patient_stay_evolution.csv' DELIMITER ',' CSV HEADER;

COPY data_preadmission FROM '/covidom_csv/data_preadmission.csv' DELIMITER ',' CSV HEADER;

COPY data_stay FROM '/covidom_csv/data_stay.csv' DELIMITER ',' CSV HEADER;

COPY data_user_account FROM '/covidom_csv/data_user_account.csv' DELIMITER ',' CSV HEADER;

COPY doctor FROM '/covidom_csv/doctor.csv' DELIMITER ',' CSV HEADER;

COPY end_reason FROM '/covidom_csv/end_reason.csv' DELIMITER ',' CSV HEADER;

COPY patient_mapping FROM '/covidom_csv/patient_mapping.csv' DELIMITER ',' CSV HEADER;

COPY patient_note FROM '/covidom_csv/patient_note.csv' DELIMITER ',' CSV HEADER;

COPY patient_stay_evolution FROM '/covidom_csv/patient_stay_evolution.csv' DELIMITER ',' CSV HEADER;

COPY survey_answer FROM '/covidom_csv/survey_answer.csv' DELIMITER ',' CSV HEADER;

COPY survey_definition FROM '/covidom_csv/survey_definition.csv' DELIMITER ',' CSV HEADER;

COPY survey_item FROM '/covidom_csv/survey_item.csv' DELIMITER ',' CSV HEADER;

COPY task FROM '/covidom_csv/task.csv' DELIMITER ',' CSV HEADER;

COPY task_detail FROM '/covidom_csv/task_detail.csv' DELIMITER ',' CSV HEADER;

COPY year FROM '/covidom_csv/year.csv' DELIMITER ',' CSV HEADER;

