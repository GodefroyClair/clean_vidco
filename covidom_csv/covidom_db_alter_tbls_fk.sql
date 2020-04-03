ALTER TABLE clinic_followup_reason
  ADD FOREIGN KEY ("#Clinic") REFERENCES clinic("Id") ON DELETE CASCADE;
ALTER TABLE patient_note
  ADD FOREIGN KEY ("PatientUId") REFERENCES patient("#Patient") ON DELETE CASCADE;
ALTER TABLE patient_stay
  ADD FOREIGN KEY ("PatientStay_PatientUId") REFERENCES patient("#Patient") ON DELETE CASCADE;

ALTER TABLE patient_stay
  ADD FOREIGN KEY ("PatientStay_FollowUpReasonId", "PatientStay_ClinicId") REFERENCES clinic_followup_reason("#Follow up reason", "#Clinic") ON DELETE CASCADE;

ALTER TABLE patient_stay
  ADD FOREIGN KEY ("PatientStay_DoctorId") REFERENCES doctor_list("#Doctor") ON DELETE CASCADE;

ALTER TABLE patient_stay
  ADD FOREIGN KEY ("PatientStay_EndReasonId") REFERENCES end_reason("Id") ON DELETE CASCADE;

ALTER TABLE patient_stay
  ADD FOREIGN KEY ("PatientStay_MedicalDepartmentId") REFERENCES medical_department_list("#Medical dept") ON DELETE CASCADE;
ALTER TABLE doctor
  ADD FOREIGN KEY ("#Doctor") REFERENCES doctor_list("#Doctor") ON DELETE CASCADE;

ALTER TABLE doctor
  ADD FOREIGN KEY ("#Medical Dept", "#Clinic") REFERENCES medical_department("#Medical dept", "#Clinic") ON DELETE CASCADE;
ALTER TABLE patient_mapping
  ADD FOREIGN KEY ("#Médecin") REFERENCES doctor_list("#Doctor") ON DELETE CASCADE;

ALTER TABLE patient_mapping
  ADD FOREIGN KEY ("#Clinique") REFERENCES clinic("Id") ON DELETE CASCADE;

ALTER TABLE patient_mapping
  ADD FOREIGN KEY ("#Patient") REFERENCES patient("#Patient") ON DELETE CASCADE;

ALTER TABLE patient_mapping
  ADD FOREIGN KEY ("#Séjour") REFERENCES patient_stay("PatientStay_UId") ON DELETE CASCADE;
ALTER TABLE data_demography
  ADD FOREIGN KEY ("#Follow Up Reason", "#Clinic") REFERENCES clinic_followup_reason("#Follow up reason", "#Clinic") ON DELETE CASCADE;

ALTER TABLE data_demography
  ADD FOREIGN KEY ("#MedicalDepartment") REFERENCES medical_department_list("#Medical dept") ON DELETE CASCADE;

ALTER TABLE data_demography
  ADD FOREIGN KEY ("#Doctor") REFERENCES doctor_list("#Doctor") ON DELETE CASCADE;
ALTER TABLE data_user_account
  ADD FOREIGN KEY ("#Follow Up Reason", "#Clinic") REFERENCES clinic_followup_reason("#Follow up reason", "#Clinic") ON DELETE CASCADE;

ALTER TABLE data_user_account
  ADD FOREIGN KEY ("#MedicalDepartment") REFERENCES medical_department_list("#Medical dept") ON DELETE CASCADE;

ALTER TABLE data_user_account
  ADD FOREIGN KEY ("#Doctor") REFERENCES doctor_list("#Doctor") ON DELETE CASCADE;
ALTER TABLE medical_department
  ADD FOREIGN KEY ("#Clinic") REFERENCES clinic("Id") ON DELETE CASCADE;

ALTER TABLE medical_department
  ADD FOREIGN KEY ("#Medical dept") REFERENCES medical_department_list("#Medical dept") ON DELETE CASCADE;
ALTER TABLE data_stay
  ADD FOREIGN KEY ("#Follow Up Reason", "#Clinic") REFERENCES clinic_followup_reason("#Follow up reason", "#Clinic") ON DELETE CASCADE;

ALTER TABLE data_stay
  ADD FOREIGN KEY ("#MedicalDepartment") REFERENCES medical_department_list("#Medical dept") ON DELETE CASCADE;

ALTER TABLE data_stay
  ADD FOREIGN KEY ("#Doctor") REFERENCES doctor_list("#Doctor") ON DELETE CASCADE;
ALTER TABLE survey_answer
  ADD FOREIGN KEY ("#Clinique") REFERENCES clinic("Id") ON DELETE CASCADE;

ALTER TABLE survey_answer
  ADD FOREIGN KEY ("#Médecin") REFERENCES doctor_list("#Doctor") ON DELETE CASCADE;

ALTER TABLE survey_answer
  ADD FOREIGN KEY ("#Patient") REFERENCES patient("#Patient") ON DELETE CASCADE;

ALTER TABLE survey_answer
  ADD FOREIGN KEY ("#Séjour") REFERENCES patient_stay("PatientStay_UId") ON DELETE CASCADE;
ALTER TABLE survey_answer
  ADD FOREIGN KEY ("#Clinique") REFERENCES clinic("Id") ON DELETE CASCADE;

ALTER TABLE survey_answer
  ADD FOREIGN KEY ("#Médecin") REFERENCES doctor_list("#Doctor") ON DELETE CASCADE;

ALTER TABLE survey_answer
  ADD FOREIGN KEY ("#Patient") REFERENCES patient("#Patient") ON DELETE CASCADE;

ALTER TABLE survey_answer
  ADD FOREIGN KEY ("#Séjour") REFERENCES patient_stay("PatientStay_UId") ON DELETE CASCADE;
ALTER TABLE task
  ADD FOREIGN KEY ("#Follow Up Reason", "#Clinic") REFERENCES clinic_followup_reason("#Follow up reason", "#Clinic") ON DELETE CASCADE;
ALTER TABLE alert
  ADD FOREIGN KEY ("ClinicId") REFERENCES clinic("Id") ON DELETE CASCADE;

ALTER TABLE alert
  ADD FOREIGN KEY ("PatientStayUId") REFERENCES patient_stay("PatientStay_UId") ON DELETE CASCADE;
