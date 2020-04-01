


ALTER TABLE clinic_followup_reason
  ADD FOREIGN KEY (""#Clinic"") REFERENCES clinic(""Id"");

ALTER TABLE patient_note
  ADD FOREIGN KEY (""PatientUId"") REFERENCES patient(""#Patient"");

ALTER TABLE patient_stay
  ADD FOREIGN KEY (""PatientStay_PatientUId"") REFERENCES patient(""#Patient"");

ALTER TABLE patient_stay
  ADD FOREIGN KEY (""PatientStay_FollowUpReasonId", "PatientStay_ClinicId"") REFERENCES clinic_followup_reason(""#Follow up reason", "#Clinic"");

ALTER TABLE patient_stay
  ADD FOREIGN KEY (""PatientStay_DoctorId"") REFERENCES doctor_list(""#Doctor"");

ALTER TABLE patient_stay
  ADD FOREIGN KEY (""PatientStay_EndReasonId"") REFERENCES end_reason(""Id"");

ALTER TABLE patient_stay
  ADD FOREIGN KEY (""PatientStay_MedicalDepartmentId"") REFERENCES medical_department_list(""#Medical dept"");

ALTER TABLE doctor
  ADD FOREIGN KEY (""#Doctor"") REFERENCES doctor_list(""#Doctor"");

ALTER TABLE doctor
  ADD FOREIGN KEY (""#Clinic"") REFERENCES clinic(""Id"");

ALTER TABLE doctor
  ADD FOREIGN KEY (""#Medical Dept"") REFERENCES medical_department(""#Medical Dept"");

ALTER TABLE patient_mapping
  ADD FOREIGN KEY (""#Médecin"") REFERENCES doctor(""#Doctor"");

ALTER TABLE patient_mapping
  ADD FOREIGN KEY (""#Clinique"") REFERENCES clinic(""Id"");

ALTER TABLE patient_mapping
  ADD FOREIGN KEY (""#Patient"") REFERENCES patient(""#Patient"");

ALTER TABLE patient_mapping
  ADD FOREIGN KEY (""#Séjour"") REFERENCES patient_stay(""#Patient_Stay_UId"");

ALTER TABLE data_demography
  ADD FOREIGN KEY (""#Clinic"") REFERENCES clinic(""Id"");

ALTER TABLE data_demography
  ADD FOREIGN KEY (""#MedicalDepartment"") REFERENCES medical_department_list(""#Medical dept"");

ALTER TABLE data_demography
  ADD FOREIGN KEY (""#Doctor"") REFERENCES doctor_list(""#Doctor"");

ALTER TABLE data_demography
  ADD FOREIGN KEY (""#Follow Up Reason"") REFERENCES clinic_followup_reason(""#Follow up reason"");

ALTER TABLE data_user_account
  ADD FOREIGN KEY (""#Clinic"") REFERENCES clinic(""Id"");

ALTER TABLE data_user_account
  ADD FOREIGN KEY (""#MedicalDepartment"") REFERENCES medical_department_list(""#Medical dept"");

ALTER TABLE data_user_account
  ADD FOREIGN KEY (""#Doctor"") REFERENCES doctor_list(""#Doctor"");

ALTER TABLE data_user_account
  ADD FOREIGN KEY (""#Follow up reason"") REFERENCES clinic_followup_reason(""#Follow up reason"");

ALTER TABLE medical_department
  ADD FOREIGN KEY (""#Clinic"") REFERENCES clinic(""Id"");

ALTER TABLE medical_department
  ADD FOREIGN KEY (""#MedicalDepartment"") REFERENCES medical_department_list(""#Medical dept"");


ALTER TABLE data_stay
  ADD FOREIGN KEY (""#Clinic"") REFERENCES clinic(""Id"");

ALTER TABLE data_stay
  ADD FOREIGN KEY (""#Medical dept"") REFERENCES medical_department_list(""#Medical dept"");

ALTER TABLE data_stay
  ADD FOREIGN KEY (""#Doctor"") REFERENCES doctor_list(""#Doctor"");

ALTER TABLE data_stay
  ADD FOREIGN KEY (""#Follow up reason"") REFERENCES clinic_followup_reason(""#Follow up reason"");

ALTER TABLE end_reason
  ADD FOREIGN KEY (""#Clinic"") REFERENCES clinic(""Id"");

ALTER TABLE end_reason
  ADD FOREIGN KEY (""#Doctor"") REFERENCES doctor_list(""#Doctor"");

ALTER TABLE end_reason
  ADD FOREIGN KEY (""#Follow up reason"") REFERENCES clinic_followup_reason(""#Follow up reason"");



ALTER TABLE patient_form
  ADD FOREIGN KEY (""PatientUId"") REFERENCES patient(""#Patient"");

ALTER TABLE patient_form
  ADD FOREIGN KEY (""FormResultUId"") REFERENCES form_result(""UId"");

ALTER TABLE patient_form
  ADD FOREIGN KEY (""PatientStayUId"") REFERENCES patient_stay(""UId"");

ALTER TABLE patient_form
  ADD FOREIGN KEY (""FormCode"") REFERENCES form_definition(""Code"");

ALTER TABLE patient_form_comments_preadfile
  ADD FOREIGN KEY (""PatientFormCommentsUId"") REFERENCES patient_form_comments(""UId"");

ALTER TABLE patient_form_comments_preadfile
  ADD FOREIGN KEY (""PreAdFileId"") REFERENCES PreAdFile(""Id"");

ALTER TABLE form_result_option
  ADD FOREIGN KEY (""FormResultUId"") REFERENCES FormResult(""UId"");

ALTER TABLE form_result
  ADD FOREIGN KEY (""FormCode"") REFERENCES FormDefinition(""Code"");

ALTER TABLE patient_form_comments
  ADD FOREIGN KEY (""PatientFormUId"") REFERENCES patient_form(""UId"");






ALTER TABLE survey_answer
  ADD FOREIGN KEY (""#Clinique"") REFERENCES clinic(""Id"");

ALTER TABLE survey_answer
  ADD FOREIGN KEY (""#Médecin"") REFERENCES doctor(""#Doctor"");

ALTER TABLE survey_answer
  ADD FOREIGN KEY (""#Patient"") REFERENCES patient(""#Patient"");

ALTER TABLE survey_answer
  ADD FOREIGN KEY (""#Séjour"") REFERENCES patient_stay(""UId"");

ALTER TABLE survey_answer
  ADD FOREIGN KEY (""#Alert Type"") REFERENCES alert(""Id"");



ALTER TABLE survey_answer
  ADD FOREIGN KEY (""#Clinique"") REFERENCES clinic(""Id"");

ALTER TABLE survey_answer
  ADD FOREIGN KEY (""#Médecin"") REFERENCES doctor(""#Doctor"");

ALTER TABLE survey_answer
  ADD FOREIGN KEY (""#Patient"") REFERENCES patient(""#Patient"");

ALTER TABLE survey_answer
  ADD FOREIGN KEY (""#Séjour"") REFERENCES PatientStay(""UId"");

ALTER TABLE survey_answer
  ADD FOREIGN KEY (""#Alert Type"") REFERENCES AlertType(""Id"");

ALTER TABLE task
  ADD FOREIGN KEY (""#Clinic"") REFERENCES clinic(""Id"");

ALTER TABLE task
  ADD FOREIGN KEY (""#Medical Department"") REFERENCES medical_department_list(""#Medical Dept"");

ALTER TABLE task
  ADD FOREIGN KEY (""#Doctor"") REFERENCES doctor_list(""#Doctor"");

ALTER TABLE task
  ADD FOREIGN KEY (""#Follow Up Reason"") REFERENCES clinic_followup_reason(""#Follow up reason"");

ALTER TABLE task
  ADD FOREIGN KEY (""#Alert Type"") REFERENCES AlertType(""Id"");

ALTER TABLE alert
  ADD FOREIGN KEY (""#Clinic"") REFERENCES clinic(""Id"");

ALTER TABLE alert
  ADD FOREIGN KEY (""#Medical Department"") REFERENCES medical_department_list(""#Medical Dept"");

ALTER TABLE alert
  ADD FOREIGN KEY (""#Doctor"") REFERENCES doctor_list(""#Doctor"");

ALTER TABLE alert
  ADD FOREIGN KEY (""#Follow Up Reason"") REFERENCES clinic_followup_reason(""#Follow up reason"");

ALTER TABLE alert
  ADD FOREIGN KEY (""#Alert Type"") REFERENCES AlertType(""Id"");

ALTER TABLE alert_subitem
  ADD FOREIGN KEY (""CorrelationUId"") REFERENCES CheckListResult(""UId"");

ALTER TABLE alert_subitem
  ADD FOREIGN KEY (""AlertTypeId"") REFERENCES AlertType(""Id"");

ALTER TABLE alert_subitem
  ADD FOREIGN KEY (""ItemNo"") REFERENCES checklist_item(""ItemNo"");

ALTER TABLE alert_subitem
  ADD FOREIGN KEY (""AlertTypeId"") REFERENCES AlertTypeId(""Id"");
