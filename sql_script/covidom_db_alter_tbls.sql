ALTER TABLE alert
    ADD CONSTRAINT UC_alert
        UNIQUE ("UId");

ALTER TABLE alert_subitem
    ADD CONSTRAINT PK_alert_subitem
        PRIMARY KEY ("UId");

ALTER TABLE clinic
    ADD CONSTRAINT PK_clinic
        PRIMARY KEY ("Id");

ALTER TABLE clinic_doctor_hospit_followup
    ADD CONSTRAINT PK_clinic_doctor_hospit_followup
        PRIMARY KEY ("#Clinic", "#Doctor", "#Hospitalization reason", "#Follow up reason");

ALTER TABLE clinic_followup_reason
    ADD CONSTRAINT PK_clinic_followup_reason
        PRIMARY KEY ("#Clinic", "#Follow up reason");
