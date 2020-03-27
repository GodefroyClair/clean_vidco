ALTER TABLE alert
    ADD CONSTRAINT UC_alert
        UNIQUE ("UId");

ALTER TABLE alert_subitem
    ADD CONSTRAINT PK_alert_subitem
        PRIMARY KEY ("UId");

ALTER TABLE clinic
    ADD CONSTRAINT PK_clinic
        PRIMARY KEY ("Id");

/* pb with data */
/* TODO: check what to do */
/* ALTER TABLE clinic_doctor_hospit_followup */
/*     ADD CONSTRAINT PK_clinic_doctor_hospit_followup */
/*         PRIMARY KEY ("#Clinic", "#Doctor", "#Hospitalization reason"); */

ALTER TABLE clinic_followup_reason
    ADD CONSTRAINT PK_clinic_followup_reason
        PRIMARY KEY ("#Clinic", "#Follow up reason");

/* ALTER TABLE doctor */
/*     ADD CONSTRAINT PK_doctor */
/*         PRIMARY KEY ("#Clinic", "#Medical Dept", "#Doctor"); */

ALTER TABLE doctor_list
    ADD CONSTRAINT PK_doctor_list
        PRIMARY KEY ("#Doctor");

ALTER TABLE medical_department_list
    ADD CONSTRAINT PK_medical_department_list
        PRIMARY KEY ("#Medical dept");

ALTER TABLE patient
    ADD CONSTRAINT PK_patient
        PRIMARY KEY ("#Patient");

ALTER TABLE patient_note
    ADD CONSTRAINT PK_patient_note
        PRIMARY KEY ("UId");

/* ALTER TABLE patient_note */
/*     ADD CONSTRAINT UC_patient_note */
/*         UNIQUE ("PatientUId", "AuthorUId"); */

ALTER TABLE patient_stay
    ADD CONSTRAINT PK_patient_stay
        PRIMARY KEY ("PatientStay_UId");

/* ALTER TABLE patient_stay */
/*     ADD CONSTRAINT UC_patient_stay */
/*         UNIQUE ("PatientStay_UserProfileUId", "PatientStay_PatientUId"); */

/* ALTER TABLE survey_answer */
/*     ADD CONSTRAINT PK_survey_answer */
/*         PRIMARY KEY ("#Clinique"); */
