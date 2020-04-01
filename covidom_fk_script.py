import pandas as pd
import numpy as np
import jsonschema
import json
from string import Template
from functools import reduce

spec_filepath = "doc/covidom_struc.csv"
output_filepath = "sql_script/covidom_alter_tbls_fk.sql"

alter_tmplt=Template("""ALTER TABLE $table_dest
  ADD FOREIGN KEY ("$dest_field") REFERENCES $source_table("$source_field");
""")

# json schema
fk_schema = {
  "$id": "https://example.com/person.schema.json",
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "Foreign key",
  "type": "array",
  "items": {
      "type": "object"
  }
  }

#--- LIB ---#

#TODO modularize
def fk_sql_from_tplt_ho(template):
    def list2upplet(inp):
        return ', '.join(map(lambda e: "\"" + e + "\"", inp)) if isinstance(inp, list) else inp
    def foreign_key_sql_from_tplt(jsons):
        return '\n'.join(list(map(
            lambda jso: template.substitute(
                table_dest=jso["tbl_dest_name"],
                dest_field=list2upplet(jso["col_dest_name"]),
                source_field=list2upplet(jso["col_src_name"]),
                source_table=jso["tbl_src_name"]),
            jsons.values())))
    return foreign_key_sql_from_tplt



def transf_json_obj(obj, tbl_dest_name):
    col_dest_name = list(obj.keys())[0]
    col_src_name = list(obj[col_dest_name].keys())[0]
    tbl_src_name = obj[col_dest_name][col_src_name]
    return {'tbl_dest_name': tbl_dest_name, 'col_dest_name': col_dest_name,
            'tbl_src_name': tbl_src_name, 'col_src_name': col_src_name}


def transf_json_objs(arr, tbl_dest_name):
    return list(map(lambda obj: transf_json_obj(obj, tbl_dest_name), arr))

def grp_by_src_name(list_fks_in_tbl):
    return reduce(lambda acc, cur: {**acc, cur['tbl_src_name']: [*acc[cur['tbl_src_name']], cur]
                                                   if cur['tbl_src_name'] in acc.keys() else [cur] },list_fks_in_tbl, {})

def fks_merge_cols(fks_grpby_src_name):
    return {key : reduce(lambda acc, cur: { 'tbl_dest_name': cur['tbl_dest_name'],
                                 'col_dest_name': [cur['col_dest_name'], *acc['col_dest_name']] if 'col_dest_name' in acc else [cur['col_dest_name']],
                                 'tbl_src_name': cur['tbl_src_name'],
                                 'col_src_name': [cur['col_src_name'], *acc['col_src_name']] if 'col_src_name' in acc else [cur['col_src_name']],
                                 }, value, {}) for key, value in fks_grpby_src_name.items()}

list_fks_in_tbl = [{'tbl_dest_name': 'patient_stay',
  'col_dest_name': 'PatientStay_PatientUId',
  'tbl_src_name': 'patient',
  'col_src_name': '#Patient'},
 {'tbl_dest_name': 'patient_stay',
  'col_dest_name': 'PatientStay_ClinicId',
  'tbl_src_name': 'clinic_followup_reason',
  'col_src_name': '#Clinic'},
 {'tbl_dest_name': 'patient_stay',
  'col_dest_name': 'PatientStay_DoctorId',
  'tbl_src_name': 'doctor_list',
  'col_src_name': '#Doctor'},
 {'tbl_dest_name': 'patient_stay',
  'col_dest_name': 'PatientStay_FollowUpReasonId',
  'tbl_src_name': 'clinic_followup_reason',
  'col_src_name': '#Follow up reason'},
 {'tbl_dest_name': 'patient_stay',
  'col_dest_name': 'PatientStay_EndReasonId',
  'tbl_src_name': 'end_reason',
  'col_src_name': 'Id'},
 {'tbl_dest_name': 'patient_stay',
  'col_dest_name': 'PatientStay_MedicalDepartmentId',
  'tbl_src_name': 'medical_department_list',
  'col_src_name': '#Medical dept'}]
fks_grpby_src_name = grp_by_src_name(list_fks_in_tbl)
assert fks_grpby_src_name == {'patient': [{'tbl_dest_name': 'patient_stay',
   'col_dest_name': 'PatientStay_PatientUId',
   'tbl_src_name': 'patient',
   'col_src_name': '#Patient'}],
 'clinic_followup_reason': [{'tbl_dest_name': 'patient_stay',
   'col_dest_name': 'PatientStay_ClinicId',
   'tbl_src_name': 'clinic_followup_reason',
   'col_src_name': '#Clinic'},
  {'tbl_dest_name': 'patient_stay',
   'col_dest_name': 'PatientStay_FollowUpReasonId',
   'tbl_src_name': 'clinic_followup_reason',
   'col_src_name': '#Follow up reason'}],
 'doctor_list': [{'tbl_dest_name': 'patient_stay',
   'col_dest_name': 'PatientStay_DoctorId',
   'tbl_src_name': 'doctor_list',
   'col_src_name': '#Doctor'}],
 'end_reason': [{'tbl_dest_name': 'patient_stay',
   'col_dest_name': 'PatientStay_EndReasonId',
   'tbl_src_name': 'end_reason',
   'col_src_name': 'Id'}],
 'medical_department_list': [{'tbl_dest_name': 'patient_stay',
   'col_dest_name': 'PatientStay_MedicalDepartmentId',
   'tbl_src_name': 'medical_department_list',
   'col_src_name': '#Medical dept'}]}

assert transf_json_obj(json.loads('{"#PatientUId": {"patient": "patient"}}'), "xx") ==\
{"tbl_dest_name": "xx", "col_dest_name": "#PatientUId", "tbl_src_name": "patient", "col_src_name": "patient"}
assert transf_json_obj(json.loads('{"x": {"z": "y"}}'), "00") ==\
{"tbl_dest_name": "00", "col_dest_name": "x", "tbl_src_name": "y", "col_src_name": "z"}

assert transf_json_objs(json.loads('[{"x": {"z": "y"}}]'), "00") ==\
        [{"tbl_dest_name": "00", "col_dest_name": "x", "tbl_src_name": "y", "col_src_name": "z"}]

#--- END LIB ---#

def main():

    covidom_struc = pd.read_csv(spec_filepath, sep=';')
    covidom_struc['json_fk'] = covidom_struc.foreign_keys.apply(json.loads)
    assert all(covidom_struc['json_fk'].apply(lambda fk: jsonschema.validate(fk, fk_schema) is None))

    covidom_struc['json_formatted'] = covidom_struc.apply(lambda row: transf_json_objs(row.json_fk, row.table), axis=1)
    fks_grpby_src_name = covidom_struc['json_formatted'].apply(grp_by_src_name)

    fks_merged_cols = fks_grpby_src_name.apply(fks_merge_cols)

    foreign_key_sql = fk_sql_from_tplt_ho(alter_tmplt)
    sql_scripts = fks_merged_cols.apply(foreign_key_sql)
    with open(output_filepath, "w") as text_file:
        text_file.write(sql_scripts.str.cat(sep='\n'))

if __name__ == "__main__":
    # execute only if run as a script
    main()
