CREATE TABLE alert (
	"UId" VARCHAR NOT NULL, 
	"ClinicId" BOOLEAN NOT NULL, 
	"PatientStayUId" VARCHAR NOT NULL, 
	"PatientPhaseUId" VARCHAR NOT NULL, 
	"AlertTypeId" DECIMAL NOT NULL, 
	"AlertLevel" DECIMAL NOT NULL, 
	"AlertStatusId" DECIMAL NOT NULL, 
	"IsActive" BOOLEAN NOT NULL, 
	"NumberOfOpening" DECIMAL NOT NULL, 
	"CreatedOn" TIMESTAMP WITHOUT TIME ZONE, 
	"FirstOpenedAt" TIMESTAMP WITHOUT TIME ZONE, 
	"LastOpenedAt" TIMESTAMP WITHOUT TIME ZONE, 
	"SuspendedAt" TIMESTAMP WITHOUT TIME ZONE, 
	"ClosedAt" TIMESTAMP WITHOUT TIME ZONE, 
	"LastOpenedByUId" VARCHAR, 
	"SuspendedByUId" VARCHAR, 
	"ClosedByUId" VARCHAR, 
	"SuspendComments" VARCHAR, 
	"CorrelationEntity" VARCHAR, 
	"CorrelationUId" VARCHAR, 
	"LastChangeDate" TIMESTAMP WITHOUT TIME ZONE, 
	"AlertMessage" VARCHAR NOT NULL, 
	"Comments" VARCHAR
);
CREATE TABLE alert_subitem (
	"UId" VARCHAR NOT NULL, 
	"EntityType" VARCHAR NOT NULL, 
	"CorrelationUId" VARCHAR NOT NULL, 
	"ItemNo" DECIMAL NOT NULL, 
	"AlertTypeId" DECIMAL NOT NULL, 
	"AlertMessage" VARCHAR NOT NULL, 
	"ThresholdOnly" BOOLEAN NOT NULL
);
CREATE TABLE clinic (
	"Id" BOOLEAN NOT NULL, 
	"Clinic name" VARCHAR NOT NULL, 
	"Has medical department" BOOLEAN NOT NULL
);
CREATE TABLE clinic_doctor_hospit_followup (
	"#Clinic" BOOLEAN NOT NULL, 
	"Clinic" VARCHAR NOT NULL, 
	"#Doctor" DECIMAL NOT NULL, 
	"Doctor" VARCHAR NOT NULL, 
	"#Hospitalization reason" DECIMAL NOT NULL, 
	"Hospitalization reason" VARCHAR NOT NULL, 
	"#Follow up reason" DECIMAL NOT NULL, 
	"Follow up reason" VARCHAR NOT NULL
);
CREATE TABLE clinic_followup_reason (
	"#Clinic" BOOLEAN NOT NULL, 
	"Clinic" VARCHAR NOT NULL, 
	"#Follow up reason" DECIMAL NOT NULL, 
	"Follow up reason code" VARCHAR NOT NULL, 
	"Follow up reason" VARCHAR NOT NULL
);
CREATE TABLE data_alert_delay (
	"#Alert" VARCHAR NOT NULL, 
	"Year" DECIMAL NOT NULL, 
	"Month" DECIMAL NOT NULL, 
	"Week" DECIMAL NOT NULL, 
	"Fortnight" DECIMAL NOT NULL, 
	"#Clinic" BOOLEAN NOT NULL, 
	"#Medical Dept" DECIMAL, 
	"#Alert Type" DECIMAL NOT NULL, 
	"#Doctor" DECIMAL NOT NULL, 
	"#Hospitalization Reason" DECIMAL NOT NULL, 
	"#Follow Up Reason" DECIMAL NOT NULL, 
	"Alert Raised At" TIMESTAMP WITHOUT TIME ZONE, 
	"Alert First Openning At" TIMESTAMP WITHOUT TIME ZONE, 
	"Alert Last Openning At" TIMESTAMP WITHOUT TIME ZONE, 
	"Alert Closed At" TIMESTAMP WITHOUT TIME ZONE, 
	"Number Of Openning" DECIMAL NOT NULL, 
	"Take In Charge Time (second)" DECIMAL NOT NULL, 
	"Treatment Time (second)" DECIMAL, 
	"Total Treatment Time (second)" DECIMAL NOT NULL, 
	"Total Active Time (second)" DECIMAL NOT NULL
);
CREATE TABLE data_alert_notresponding (
	"#Alert" VARCHAR NOT NULL, 
	"#Clinic" BOOLEAN NOT NULL, 
	"Clinique" VARCHAR NOT NULL, 
	"#Medical Dept" DECIMAL NOT NULL, 
	"Service" VARCHAR, 
	"#Doctor" DECIMAL NOT NULL, 
	"Médecin" VARCHAR NOT NULL, 
	"#Patient" VARCHAR NOT NULL, 
	"#Séjour" VARCHAR NOT NULL, 
	"Séjour no" BOOLEAN, 
	"Date d'intervention" TIMESTAMP WITHOUT TIME ZONE, 
	"#HospitalizationReason" DECIMAL NOT NULL, 
	"Motif d'hospitalisation" VARCHAR NOT NULL, 
	"#FollowUpReason" DECIMAL NOT NULL, 
	"Motif de suivi" VARCHAR NOT NULL, 
	"Phase" VARCHAR NOT NULL, 
	"Evènement à I+X" VARCHAR NOT NULL, 
	"Evènement à S+X" VARCHAR NOT NULL, 
	"Alerte déclenchée le" TIMESTAMP WITHOUT TIME ZONE, 
	"Première prise en charge" TIMESTAMP WITHOUT TIME ZONE, 
	"Alerte close le" TIMESTAMP WITHOUT TIME ZONE, 
	"Commentiaire de clôture" VARCHAR NOT NULL
);
CREATE TABLE data_demography (
	"Year" DECIMAL NOT NULL, 
	"Month" DECIMAL NOT NULL, 
	"WeekNumber" DECIMAL NOT NULL, 
	"Fortnight" DECIMAL NOT NULL, 
	"#Clinic" BOOLEAN NOT NULL, 
	"#MedicalDepartment" DECIMAL NOT NULL, 
	"#Doctor" DECIMAL NOT NULL, 
	"#Hospitalization Reason" DECIMAL NOT NULL, 
	"#Follow Up Reason" DECIMAL NOT NULL, 
	"#Gender" DECIMAL NOT NULL, 
	"Age Gone" DECIMAL NOT NULL, 
	"Age Distribution" VARCHAR NOT NULL, 
	"Number" DECIMAL NOT NULL
);
CREATE TABLE data_preadmission (
	"Year" BOOLEAN, 
	"Month" BOOLEAN, 
	"WeekNumber" BOOLEAN, 
	"Fortnight" BOOLEAN, 
	"#Clinic" BOOLEAN, 
	"#MedicalDepartment" BOOLEAN, 
	"#Doctor" BOOLEAN, 
	"#Hospitalization Reason" BOOLEAN, 
	"#Follow Up Reason" BOOLEAN, 
	"FormCode" BOOLEAN, 
	"FormStatusId" BOOLEAN, 
	"ForcedValidation" BOOLEAN, 
	"NumberOfPread" BOOLEAN NOT NULL
);
CREATE TABLE data_stay (
	"Year" DECIMAL NOT NULL, 
	"Month" DECIMAL NOT NULL, 
	"WeekNumber" DECIMAL NOT NULL, 
	"Fortnight" DECIMAL NOT NULL, 
	"#Clinic" BOOLEAN NOT NULL, 
	"#MedicalDepartment" DECIMAL NOT NULL, 
	"#Doctor" DECIMAL NOT NULL, 
	"#Hospitalization Reason" DECIMAL NOT NULL, 
	"#Follow Up Reason" DECIMAL NOT NULL, 
	"NumberOfStay" DECIMAL NOT NULL
);
CREATE TABLE data_user_account (
	"Year" DECIMAL NOT NULL, 
	"Month" DECIMAL NOT NULL, 
	"WeekNumber" DECIMAL NOT NULL, 
	"Fortnight" DECIMAL NOT NULL, 
	"#Clinic" BOOLEAN NOT NULL, 
	"#MedicalDepartment" DECIMAL NOT NULL, 
	"#Doctor" DECIMAL NOT NULL, 
	"#Hospitalization Reason" DECIMAL NOT NULL, 
	"#Follow Up Reason" DECIMAL NOT NULL, 
	"Created by user himself" BOOLEAN NOT NULL, 
	"First Login" BOOLEAN NOT NULL, 
	"NumberOfAccount" DECIMAL NOT NULL
);
CREATE TABLE doctor (
	"#Clinic" BOOLEAN NOT NULL, 
	"Clinic" VARCHAR NOT NULL, 
	"#Medical Dept" DECIMAL, 
	"Medical Dept" VARCHAR, 
	"#Doctor" DECIMAL NOT NULL, 
	"Doctor Full Name" VARCHAR NOT NULL
);
CREATE TABLE doctor_list (
	"#Doctor" DECIMAL NOT NULL, 
	"Doctor Full Name" VARCHAR NOT NULL, 
	"DoctorTitle" VARCHAR, 
	"DoctorLastname" VARCHAR, 
	"DoctorFirstname" VARCHAR
);
CREATE TABLE end_reason (
	"﻿Id" DECIMAL NOT NULL, 
	"Reason" VARCHAR NOT NULL, 
	"ForceComments" BOOLEAN NOT NULL, 
	"UserChoice" BOOLEAN NOT NULL, 
	"LimitedToPhaseDefinitionId" BOOLEAN NOT NULL, 
	"UseNotification" BOOLEAN NOT NULL, 
	"ForceClosing" BOOLEAN NOT NULL
);
CREATE TABLE medical_department (
	"#Clinic" BOOLEAN NOT NULL, 
	"Clinic" VARCHAR NOT NULL, 
	"#Medical dept" DECIMAL NOT NULL, 
	"Medical dept" VARCHAR NOT NULL, 
	"Medical dept code" VARCHAR NOT NULL
);
CREATE TABLE medical_department_list (
	"#Medical dept" DECIMAL NOT NULL, 
	"Medical dept" VARCHAR NOT NULL, 
	"Medical dept code" VARCHAR NOT NULL
);
CREATE TABLE patient (
	"#Patient" VARCHAR NOT NULL, 
	"#PatientType" BOOLEAN NOT NULL, 
	"Patient type" VARCHAR NOT NULL, 
	"#Internal Client" DECIMAL, 
	"Patient no" BOOLEAN, 
	"#Gender" DECIMAL NOT NULL, 
	"Gender" VARCHAR, 
	"Birth lastname" VARCHAR NOT NULL, 
	"Birth firstname" VARCHAR NOT NULL, 
	"Lastname" VARCHAR NOT NULL, 
	"Firstname" VARCHAR NOT NULL, 
	"Birthdate" DATE NOT NULL, 
	"Age gone" DECIMAL NOT NULL, 
	"Age distribution" VARCHAR NOT NULL, 
	"Medical Information" VARCHAR
);
CREATE TABLE patient_mapping (
	"#Clinique" BOOLEAN NOT NULL, 
	"Clinique" VARCHAR NOT NULL, 
	"#Médecin" DECIMAL NOT NULL, 
	"Médecin" VARCHAR NOT NULL, 
	"#Patient" VARCHAR NOT NULL, 
	"#Séjour" VARCHAR NOT NULL, 
	"No séjour" BOOLEAN, 
	"Séjour créé le" TIMESTAMP WITHOUT TIME ZONE, 
	"Date d'intervention" TIMESTAMP WITHOUT TIME ZONE, 
	"Informations médicales" VARCHAR, 
	"Séjour clos le" TIMESTAMP WITHOUT TIME ZONE, 
	"Type de clôture" VARCHAR, 
	"Motif de clôture" VARCHAR, 
	"Commentaire de clôture" VARCHAR, 
	"Nom" VARCHAR NOT NULL, 
	"Nom de naissance" VARCHAR NOT NULL, 
	"Prénom" VARCHAR NOT NULL, 
	"Prénom de naissance" VARCHAR NOT NULL, 
	"Date de naissance" DATE NOT NULL, 
	"Age révolu" DECIMAL NOT NULL, 
	"#Genre" DECIMAL NOT NULL, 
	"Genre" VARCHAR
);
CREATE TABLE patient_note (
	"UId" VARCHAR NOT NULL, 
	"PatientUId" VARCHAR NOT NULL, 
	"AuthorUId" VARCHAR NOT NULL, 
	"Comments" VARCHAR, 
	"CreatedOn" TIMESTAMP WITHOUT TIME ZONE, 
	"Author" VARCHAR NOT NULL
);
CREATE TABLE patient_stay (
	"PatientStay_UId" VARCHAR NOT NULL, 
	"PatientStay_UserProfileUId" VARCHAR NOT NULL, 
	"PatientStay_PatientUId" VARCHAR NOT NULL, 
	"PatientStay_PatientStayNo" BOOLEAN, 
	"PatientStay_ClinicId" BOOLEAN NOT NULL, 
	"PatientStay_SurgeryDate" TIMESTAMP WITHOUT TIME ZONE, 
	"PatientStay_OutingDate" TIMESTAMP WITHOUT TIME ZONE, 
	"PatientStay_DoctorId" DECIMAL NOT NULL, 
	"PatientStay_FollowUpReasonId" DECIMAL NOT NULL, 
	"PatientStay_HospitalizationReasonId" DECIMAL NOT NULL, 
	"PatientStay_CreatedOn" TIMESTAMP WITHOUT TIME ZONE, 
	"PatientStay_EndedOn" TIMESTAMP WITHOUT TIME ZONE, 
	"PatientStay_IsActive" BOOLEAN NOT NULL, 
	"PatientStay_DefaultSurveyCode" BOOLEAN, 
	"PatientStay_EmergencySurveyCode" BOOLEAN, 
	"PatientStay_EndReasonId" DECIMAL, 
	"PatientStay_Comments" VARCHAR, 
	"PatientStay_ProcessTypeId" BOOLEAN NOT NULL, 
	"PatientStay_MatchedHospitalizationRequestUId" BOOLEAN, 
	"PatientStay_HasMatchingErrors" BOOLEAN NOT NULL, 
	"PatientStay_Tags" BOOLEAN, 
	"PatientStay_IterationPeriod" BOOLEAN NOT NULL, 
	"PatientStay_CurrentAppointmentUId" BOOLEAN, 
	"PatientStay_NextAppointmentStartDate" BOOLEAN, 
	"PatientStay_NextAppointmentDate" BOOLEAN, 
	"PatientStay_AppointmentSpacing" BOOLEAN NOT NULL, 
	"PatientStay_MedicationProtocolId" DECIMAL, 
	"PatientStay_EntryDate" BOOLEAN, 
	"PatientStay_Duration" BOOLEAN NOT NULL, 
	"PatientStay_HandlingMode" DECIMAL NOT NULL, 
	"PatientStay_Confirmed" BOOLEAN NOT NULL, 
	"PatientStay_SSR" BOOLEAN NOT NULL, 
	"PatientStay_SurgicalStay" BOOLEAN NOT NULL, 
	"PatientStay_PassiveMode" BOOLEAN NOT NULL, 
	"PatientStay_SurgeryConfirmationRequired" BOOLEAN NOT NULL, 
	"PatientStay_PatientStatus" BOOLEAN NOT NULL, 
	"PatientStay_CompanionStatus" BOOLEAN NOT NULL, 
	"PatientStay_CompanionInformation" BOOLEAN NOT NULL, 
	"PatientStay_CompanionCode" DECIMAL NOT NULL, 
	"PatientStay_FormStatus" BOOLEAN NOT NULL, 
	"PatientStay_ForceCloseMessaging" BOOLEAN NOT NULL, 
	"PatientStay_MedicalDepartmentId" DECIMAL NOT NULL, 
	"PatientStay_InteropMedicalDepartmentCode" BOOLEAN, 
	"PatientStay_Year" DECIMAL NOT NULL, 
	"PatientStay_Month" DECIMAL NOT NULL, 
	"PatientStay_Week" DECIMAL NOT NULL, 
	"PatientStay_Fortnight" DECIMAL NOT NULL, 
	"PatientStay_HospitalizationNumber" BOOLEAN, 
	"PatientStay_FollowUpReasonName" VARCHAR NOT NULL, 
	"PatientStay_HospitalizationReasonName" VARCHAR NOT NULL, 
	"PatientStay_MedicalDepartmentName" VARCHAR NOT NULL
);
CREATE TABLE patient_stay_evolution (
	"Date de début des symptômes" DATE NOT NULL, 
	"Année de début des symptômes" DECIMAL NOT NULL, 
	"Mois de début des symptômes" DECIMAL NOT NULL, 
	"No Semaine de début des symptômes" DECIMAL NOT NULL, 
	"Quinzaine de début des symptômes" DECIMAL NOT NULL, 
	"Jour du mois de début des symptômes" DECIMAL NOT NULL, 
	"Jour de l'année de début des symptômes" DECIMAL NOT NULL, 
	"Id. Région" BOOLEAN NOT NULL, 
	"Région" VARCHAR NOT NULL, 
	"Id. Etablissement" DECIMAL NOT NULL, 
	"Etablissement" VARCHAR NOT NULL, 
	"Id. Médecin" DECIMAL NOT NULL, 
	"Id. Type de patient" DECIMAL NOT NULL, 
	"Type de patient" VARCHAR NOT NULL, 
	"Id. Type de suivi" DECIMAL NOT NULL, 
	"Type de suivi" VARCHAR NOT NULL, 
	"Nombre de suivi" DECIMAL NOT NULL
);
CREATE TABLE survey_answer (
	"#Clinique" BOOLEAN NOT NULL, 
	"Clinique" VARCHAR NOT NULL, 
	"#Médecin" DECIMAL NOT NULL, 
	"Médecin" VARCHAR NOT NULL, 
	"#Patient" VARCHAR NOT NULL, 
	"#Séjour" VARCHAR NOT NULL, 
	"Date création séjour" TIMESTAMP WITHOUT TIME ZONE, 
	"Date d'intervention" TIMESTAMP WITHOUT TIME ZONE, 
	"No séjour" BOOLEAN, 
	"#Résultat" VARCHAR NOT NULL, 
	"Phase" VARCHAR NOT NULL, 
	"Date de réponse" TIMESTAMP WITHOUT TIME ZONE, 
	"Répondu par le patient" VARCHAR NOT NULL, 
	"Code du questionnaire" VARCHAR NOT NULL, 
	"Titre du questionnaire" VARCHAR NOT NULL, 
	"Version du questionnaire" BOOLEAN NOT NULL, 
	"Identifiant de la question" DECIMAL NOT NULL, 
	"Identifiant de la réponse" DECIMAL NOT NULL, 
	"Réponse à la question" VARCHAR NOT NULL, 
	"Questionnaire d'urgence" VARCHAR NOT NULL, 
	"Questionnaire à S+X" VARCHAR NOT NULL, 
	"Questionnaire à I+X" VARCHAR NOT NULL, 
	"Motif d'hospitalisation" VARCHAR NOT NULL, 
	"Motif de suivi" VARCHAR NOT NULL, 
	"#Alert Type" DECIMAL, 
	"Alerte déclenchée le" TIMESTAMP WITHOUT TIME ZONE, 
	"Première prise en charge" TIMESTAMP WITHOUT TIME ZONE, 
	"Dernière prise en charge" TIMESTAMP WITHOUT TIME ZONE, 
	"Nombre de prise en charge" DECIMAL, 
	"Alerte clos le" TIMESTAMP WITHOUT TIME ZONE, 
	"Commentaire de clôture" VARCHAR, 
	"Message d'alerte" VARCHAR, 
	"#Service" DECIMAL NOT NULL, 
	"Service" VARCHAR NOT NULL
);
CREATE TABLE survey_definition (
	"SurveyCode" VARCHAR NOT NULL, 
	"SurveyVersion" BOOLEAN NOT NULL, 
	"Title" VARCHAR NOT NULL, 
	"PublishedOn" TIMESTAMP WITHOUT TIME ZONE, 
	"NumberOfResult" DECIMAL NOT NULL
);
CREATE TABLE survey_item (
	"SurveyCode" VARCHAR NOT NULL, 
	"SurveyVersion" BOOLEAN NOT NULL, 
	"ItemNo" DECIMAL NOT NULL, 
	"QuestionText" VARCHAR NOT NULL, 
	"QuestionDescription" BOOLEAN, 
	"IsMandatory" BOOLEAN NOT NULL, 
	"IsConditional" BOOLEAN, 
	"AnswerType" BOOLEAN, 
	"MinValue" BOOLEAN, 
	"MaxValue" BOOLEAN, 
	"Step" BOOLEAN, 
	"DefaultValue" BOOLEAN, 
	"Reference" BOOLEAN
);
CREATE TABLE task (
	"Year" DECIMAL NOT NULL, 
	"Month" DECIMAL NOT NULL, 
	"Week" DECIMAL NOT NULL, 
	"Fortnight" DECIMAL NOT NULL, 
	"#Clinic" BOOLEAN NOT NULL, 
	"#Medical Department" DECIMAL NOT NULL, 
	"#Doctor" DECIMAL NOT NULL, 
	"#Hospitalization Reason" DECIMAL NOT NULL, 
	"#Follow Up Reason" DECIMAL NOT NULL, 
	"#Task Type Id" BOOLEAN NOT NULL, 
	"Task code" VARCHAR NOT NULL, 
	"Task title" BOOLEAN, 
	"Task is active" BOOLEAN NOT NULL, 
	"Task is for patient" BOOLEAN NOT NULL, 
	"Task is mandatory" BOOLEAN NOT NULL, 
	"Task is manual" BOOLEAN NOT NULL, 
	"Task completed by patient" BOOLEAN, 
	"Is Satisfaction Survey" BOOLEAN NOT NULL, 
	"CorrelationEntity" VARCHAR, 
	"#Alert Type" DECIMAL, 
	"Number of tasks" DECIMAL NOT NULL, 
	"Number of response" DECIMAL NOT NULL, 
	"Number of alert" DECIMAL NOT NULL
);
CREATE TABLE task_detail (
	"Year" DECIMAL NOT NULL, 
	"Month" DECIMAL NOT NULL, 
	"Week" DECIMAL NOT NULL, 
	"Fortnight" DECIMAL NOT NULL, 
	"#Task" VARCHAR NOT NULL, 
	"#Clinic" BOOLEAN NOT NULL, 
	"#Medical Department" DECIMAL NOT NULL, 
	"#Doctor" DECIMAL NOT NULL, 
	"#Hospitalization Reason" DECIMAL NOT NULL, 
	"#Follow Up Reason" DECIMAL NOT NULL, 
	"#Task Type Id" BOOLEAN NOT NULL, 
	"Task code" VARCHAR NOT NULL, 
	"Task title" BOOLEAN, 
	"Task is active" BOOLEAN NOT NULL, 
	"Task is for patient" BOOLEAN NOT NULL, 
	"Task is mandatory" BOOLEAN NOT NULL, 
	"Task is manual" BOOLEAN NOT NULL, 
	"Task completed by patient" BOOLEAN, 
	"Is Satisfaction Survey" BOOLEAN NOT NULL, 
	"CorrelationEntity" VARCHAR, 
	"CorrelationUId" VARCHAR, 
	"#Alert Type" DECIMAL, 
	"TaskCompletedByUId" VARCHAR, 
	"TaskCompletedUserProfileTypeId" BOOLEAN
);
CREATE TABLE year (
	"Year" DECIMAL NOT NULL
);
