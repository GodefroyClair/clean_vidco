


ALTER TABLE clinic_followup_reason
  ADD FOREIGN KEY (clinic_followup_reason) REFERENCES clinic(clinic_followup_reason);

ALTER TABLE patient_note
  ADD FOREIGN KEY (patient_note) REFERENCES patient(patient_note);

ALTER TABLE patient_stay
  ADD FOREIGN KEY (patient_stay) REFERENCES patient(patient_stay);

ALTER TABLE patient_stay
  ADD FOREIGN KEY (patient_stay) REFERENCES clinic(patient_stay);

ALTER TABLE patient_stay
  ADD FOREIGN KEY (patient_stay) REFERENCES doctor_list(patient_stay);

ALTER TABLE patient_stay
  ADD FOREIGN KEY (patient_stay) REFERENCES clinic_followup_reason(patient_stay);

ALTER TABLE patient_stay
  ADD FOREIGN KEY (patient_stay) REFERENCES end_reason(patient_stay);

ALTER TABLE patient_stay
  ADD FOREIGN KEY (patient_stay) REFERENCES medical_department_list(patient_stay);

ALTER TABLE doctor
  ADD FOREIGN KEY (doctor) REFERENCES doctor_list(doctor);

ALTER TABLE doctor
  ADD FOREIGN KEY (doctor) REFERENCES clinic(doctor);

ALTER TABLE doctor
  ADD FOREIGN KEY (doctor) REFERENCES medical_department(doctor);

ALTER TABLE patient_mapping
  ADD FOREIGN KEY (patient_mapping) REFERENCES doctor(patient_mapping);

ALTER TABLE patient_mapping
  ADD FOREIGN KEY (patient_mapping) REFERENCES clinic(patient_mapping);

ALTER TABLE patient_mapping
  ADD FOREIGN KEY (patient_mapping) REFERENCES patient(patient_mapping);

ALTER TABLE patient_mapping
  ADD FOREIGN KEY (patient_mapping) REFERENCES patient_stay(patient_mapping);

ALTER TABLE data_demography
  ADD FOREIGN KEY (data_demography) REFERENCES clinic(data_demography);

ALTER TABLE data_demography
  ADD FOREIGN KEY (data_demography) REFERENCES medical_department_list(data_demography);

ALTER TABLE data_demography
  ADD FOREIGN KEY (data_demography) REFERENCES doctor_list(data_demography);

ALTER TABLE data_demography
  ADD FOREIGN KEY (data_demography) REFERENCES clinic_followup_reason(data_demography);

ALTER TABLE data_user_account
  ADD FOREIGN KEY (data_user_account) REFERENCES clinic(data_user_account);

ALTER TABLE data_user_account
  ADD FOREIGN KEY (data_user_account) REFERENCES medical_department_list(data_user_account);

ALTER TABLE data_user_account
  ADD FOREIGN KEY (data_user_account) REFERENCES doctor_list(data_user_account);

ALTER TABLE data_user_account
  ADD FOREIGN KEY (data_user_account) REFERENCES clinic_followup_reason(data_user_account);

ALTER TABLE medical_department
  ADD FOREIGN KEY (medical_department) REFERENCES clinic(medical_department);

ALTER TABLE medical_department
  ADD FOREIGN KEY (medical_department) REFERENCES medical_department_list(medical_department);


ALTER TABLE data_stay
  ADD FOREIGN KEY (data_stay) REFERENCES clinic(data_stay);

ALTER TABLE data_stay
  ADD FOREIGN KEY (data_stay) REFERENCES medical_department_list(data_stay);

ALTER TABLE data_stay
  ADD FOREIGN KEY (data_stay) REFERENCES doctor_list(data_stay);

ALTER TABLE data_stay
  ADD FOREIGN KEY (data_stay) REFERENCES clinic_followup_reason(data_stay);

ALTER TABLE end_reason
  ADD FOREIGN KEY (end_reason) REFERENCES clinic(end_reason);

ALTER TABLE end_reason
  ADD FOREIGN KEY (end_reason) REFERENCES doctor_list(end_reason);

ALTER TABLE end_reason
  ADD FOREIGN KEY (end_reason) REFERENCES clinic_followup_reason(end_reason);



ALTER TABLE patient_form
  ADD FOREIGN KEY (patient_form) REFERENCES patient(patient_form);

ALTER TABLE patient_form
  ADD FOREIGN KEY (patient_form) REFERENCES form_result(patient_form);

ALTER TABLE patient_form
  ADD FOREIGN KEY (patient_form) REFERENCES patient_stay(patient_form);

ALTER TABLE patient_form
  ADD FOREIGN KEY (patient_form) REFERENCES form_definition(patient_form);

ALTER TABLE patient_form_comments_preadfile
  ADD FOREIGN KEY (patient_form_comments_preadfile) REFERENCES patient_form_comments(patient_form_comments_preadfile);

ALTER TABLE patient_form_comments_preadfile
  ADD FOREIGN KEY (patient_form_comments_preadfile) REFERENCES PreAdFile(patient_form_comments_preadfile);

ALTER TABLE form_result_option
  ADD FOREIGN KEY (form_result_option) REFERENCES FormResult(form_result_option);

ALTER TABLE form_result
  ADD FOREIGN KEY (form_result) REFERENCES FormDefinition(form_result);

ALTER TABLE patient_form_comments
  ADD FOREIGN KEY (patient_form_comments) REFERENCES patient_form(patient_form_comments);






ALTER TABLE survey_answer
  ADD FOREIGN KEY (survey_answer) REFERENCES clinic(survey_answer);

ALTER TABLE survey_answer
  ADD FOREIGN KEY (survey_answer) REFERENCES doctor(survey_answer);

ALTER TABLE survey_answer
  ADD FOREIGN KEY (survey_answer) REFERENCES patient(survey_answer);

ALTER TABLE survey_answer
  ADD FOREIGN KEY (survey_answer) REFERENCES patient_stay(survey_answer);

ALTER TABLE survey_answer
  ADD FOREIGN KEY (survey_answer) REFERENCES alert(survey_answer);



ALTER TABLE survey_answer
  ADD FOREIGN KEY (survey_answer) REFERENCES clinic(survey_answer);

ALTER TABLE survey_answer
  ADD FOREIGN KEY (survey_answer) REFERENCES doctor(survey_answer);

ALTER TABLE survey_answer
  ADD FOREIGN KEY (survey_answer) REFERENCES patient(survey_answer);

ALTER TABLE survey_answer
  ADD FOREIGN KEY (survey_answer) REFERENCES PatientStay(survey_answer);

ALTER TABLE survey_answer
  ADD FOREIGN KEY (survey_answer) REFERENCES AlertType(survey_answer);

ALTER TABLE task
  ADD FOREIGN KEY (task) REFERENCES clinic(task);

ALTER TABLE task
  ADD FOREIGN KEY (task) REFERENCES medical_department_list(task);

ALTER TABLE task
  ADD FOREIGN KEY (task) REFERENCES doctor_list(task);

ALTER TABLE task
  ADD FOREIGN KEY (task) REFERENCES clinic_followup_reason(task);

ALTER TABLE task
  ADD FOREIGN KEY (task) REFERENCES AlertType(task);

ALTER TABLE alert
  ADD FOREIGN KEY (alert) REFERENCES clinic(alert);

ALTER TABLE alert
  ADD FOREIGN KEY (alert) REFERENCES medical_department_list(alert);

ALTER TABLE alert
  ADD FOREIGN KEY (alert) REFERENCES doctor_list(alert);

ALTER TABLE alert
  ADD FOREIGN KEY (alert) REFERENCES clinic_followup_reason(alert);

ALTER TABLE alert
  ADD FOREIGN KEY (alert) REFERENCES AlertType(alert);

ALTER TABLE alert_subitem
  ADD FOREIGN KEY (alert_subitem) REFERENCES CheckListResult(alert_subitem);

ALTER TABLE alert_subitem
  ADD FOREIGN KEY (alert_subitem) REFERENCES AlertType(alert_subitem);

ALTER TABLE alert_subitem
  ADD FOREIGN KEY (alert_subitem) REFERENCES checklist_item(alert_subitem);

ALTER TABLE alert_subitem
  ADD FOREIGN KEY (alert_subitem) REFERENCES AlertTypeId(alert_subitem);
