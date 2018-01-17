-- with a as (
--          SELECT
--          cols.column_name,cols.table_name,
--  (
--          SELECT
--          pg_catalog.col_description(c.oid, cols.ordinal_position::int)
--          FROM
--          pg_catalog.pg_class c
--          WHERE
--          c.oid = (SELECT ('"' || cols.table_name || '"')::regclass::oid)
--          AND c.relname = cols.table_name
--  ) AS column_comment,
--  CASE
--     WHEN data_type ='integer' then 'INT'
--     WHEN data_type IN ( 'text', 'varchar') then 'STRING'
--     WHEN data_type = 'date' then 'DATE'
--     WHEN data_type = 'numeric' then 'DECIMAL'
--     WHEN data_type = 'timestamp without time zone' then 'TIMESTAMP'
--     ELSE data_type
--          END as data_type
--  FROM
--  information_schema.columns cols
--  WHERE
--  cols.table_catalog    = 'edsr'
--  AND cols.table_schema = 'omop')
--  SELECT 'ALTER TABLE '|| table_name||' CHANGE '|| column_name||' '|| column_name||' '||data_type||' COMMENT '''|| regexp_replace(column_comment, '’','') ||''';'
--  from a;

use mimicomop;
-- ALTER TABLE vocabulary CHANGE vocabulary_id vocabulary_id STRING COMMENT 'A unique identifier for each Vocabulary, such as ICD9CM, SNOMED, Visit.';
-- ALTER TABLE vocabulary CHANGE vocabulary_name vocabulary_name STRING COMMENT 'The name describing the vocabulary, for example "International Classification of Diseases, Ninth Revision, Clinical Modification, Volume 1 and 2 (NCHS)" etc.';
-- ALTER TABLE vocabulary CHANGE vocabulary_reference vocabulary_reference STRING COMMENT 'External reference to documentation or available download of the about the vocabulary.';
-- ALTER TABLE vocabulary CHANGE vocabulary_version vocabulary_version STRING COMMENT 'Version of the Vocabulary as indicated in the source.';
-- ALTER TABLE vocabulary CHANGE vocabulary_concept_id vocabulary_concept_id INT COMMENT 'A foreign key that refers to a standard concept identifier in the CONCEPT table for the Vocabulary the VOCABULARY record belongs to.';
-- ALTER TABLE concept_synonym CHANGE concept_id concept_id INT COMMENT 'A foreign key to the Concept in the CONCEPT table.';
-- ALTER TABLE concept_synonym CHANGE concept_synonym_name concept_synonym_name STRING COMMENT 'The alternative name for the Concept.';
-- ALTER TABLE concept_synonym CHANGE language_concept_id language_concept_id INT COMMENT 'A foreign key to a Concept representing the language.';
-- ALTER TABLE concept_ancestor CHANGE ancestor_concept_id ancestor_concept_id INT COMMENT 'A foreign key to the concept in the concept table for the higher-level concept that forms the ancestor in the relationship.';
-- ALTER TABLE concept_ancestor CHANGE descendant_concept_id descendant_concept_id INT COMMENT 'A foreign key to the concept in the concept table for the lower-level concept that forms the descendant in the relationship.';
-- ALTER TABLE concept_ancestor CHANGE min_levels_of_separation min_levels_of_separation INT COMMENT 'The minimum separation in number of levels of hierarchy between ancestor and descendant concepts. This is an attribute that is used to simplify hierarchic analysis.';
-- ALTER TABLE concept_ancestor CHANGE max_levels_of_separation max_levels_of_separation INT COMMENT 'The maximum separation in number of levels of hierarchy between ancestor and descendant concepts. This is an attribute that is used to simplify hierarchic analysis.';
 ALTER TABLE cohort_definition CHANGE cohort_definition_id cohort_definition_id INT COMMENT 'A unique identifier for each Cohort.';
 ALTER TABLE cohort_definition CHANGE cohort_definition_name cohort_definition_name STRING COMMENT 'A short description of the Cohort.';
 ALTER TABLE cohort_definition CHANGE cohort_definition_description cohort_definition_description STRING COMMENT 'A complete description of the Cohort definition';
 ALTER TABLE cohort_definition CHANGE definition_type_concept_id definition_type_concept_id INT COMMENT 'Type defining what kind of Cohort Definition the record represents and how the syntax may be executed';
 ALTER TABLE cohort_definition CHANGE cohort_definition_syntax cohort_definition_syntax STRING COMMENT 'Syntax or code to operationalize the Cohort definition';
 ALTER TABLE cohort_definition CHANGE subject_concept_id subject_concept_id INT COMMENT 'A foreign key to the Concept to which defines the domain of subjects that are members of the cohort (e.g., Person, Provider, Visit).';
 ALTER TABLE cohort_definition CHANGE cohort_initiation_date cohort_initiation_date DATE COMMENT 'A date to indicate when the Cohort was initiated in the COHORT table';
 ALTER TABLE attribute_definition CHANGE attribute_definition_id attribute_definition_id INT COMMENT 'A unique identifier for each Attribute.';
 ALTER TABLE attribute_definition CHANGE attribute_name attribute_name STRING COMMENT 'A short description of the Attribute.';
 ALTER TABLE attribute_definition CHANGE attribute_description attribute_description STRING COMMENT 'A complete description of the Attribute definition';
 ALTER TABLE attribute_definition CHANGE attribute_type_concept_id attribute_type_concept_id INT COMMENT 'Type defining what kind of Attribute Definition the record represents and how the syntax may be executed';
 ALTER TABLE attribute_definition CHANGE attribute_syntax attribute_syntax STRING COMMENT 'Syntax or code to operationalize the Attribute definition';
-- ALTER TABLE cdm_source CHANGE cdm_source_name cdm_source_name STRING COMMENT 'The full name of the source';
-- ALTER TABLE cdm_source CHANGE cdm_source_abbreviation cdm_source_abbreviation STRING COMMENT 'An abbreviation of the name';
-- ALTER TABLE cdm_source CHANGE cdm_holder cdm_holder STRING COMMENT 'The name of the organization responsible for the development of the CDM instance';
-- ALTER TABLE cdm_source CHANGE source_description source_description STRING COMMENT 'A description of the source data origin and purpose for collection. The description may contain a summary of the period of time that is expected to be covered by this dataset.';
-- ALTER TABLE cdm_source CHANGE source_documentation_reference source_documentation_reference STRING COMMENT 'URL or other external reference to location of source documentation';
-- ALTER TABLE cdm_source CHANGE cdm_etl_reference cdm_etl_reference STRING COMMENT 'URL or other external reference to location of ETL specification documentation and ETL source code';
-- ALTER TABLE cdm_source CHANGE source_release_date source_release_date DATE COMMENT 'The date for which the source data are most current, such as the last day of data capture';
-- ALTER TABLE cdm_source CHANGE cdm_release_date cdm_release_date DATE COMMENT 'The date when the CDM was instantiated';
-- ALTER TABLE cdm_source CHANGE cdm_version cdm_version STRING COMMENT 'The version of CDM used';
-- ALTER TABLE cdm_source CHANGE vocabulary_version vocabulary_version STRING COMMENT 'The version of the vocabulary used';
-- ALTER TABLE drug_strength CHANGE drug_concept_id drug_concept_id INT COMMENT 'A foreign key to the Concept in the CONCEPT table representing the identifier for Branded Drug or Clinical Drug Concept.';
-- ALTER TABLE drug_strength CHANGE ingredient_concept_id ingredient_concept_id INT COMMENT 'A foreign key to the Concept in the CONCEPT table, representing the identifier for drug Ingredient Concept contained within the drug product.';
-- ALTER TABLE drug_strength CHANGE amount_value amount_value DECIMAL COMMENT 'The numeric value associated with the amount of active ingredient contained within the product.';
-- ALTER TABLE drug_strength CHANGE amount_unit_concept_id amount_unit_concept_id INT COMMENT 'A foreign key to the Concept in the CONCEPT table representing the identifier for the Unit for the absolute amount of active ingredient.';
-- ALTER TABLE drug_strength CHANGE numerator_value numerator_value DECIMAL COMMENT 'The numeric value associated with the concentration of the active ingredient contained in the product';
-- ALTER TABLE drug_strength CHANGE numerator_unit_concept_id numerator_unit_concept_id INT COMMENT 'A foreign key to the Concept in the CONCEPT table representing the identifier for the numerator Unit for the concentration of active ingredient.';
-- ALTER TABLE drug_strength CHANGE denominator_value denominator_value DECIMAL COMMENT 'The amount of total liquid (or other divisible product, such as ointment, gel, spray, etc.).';
-- ALTER TABLE drug_strength CHANGE denominator_unit_concept_id denominator_unit_concept_id INT COMMENT 'A foreign key to the Concept in the CONCEPT table representing the identifier for the denominator Unit for the concentration of active ingredient.';
-- ALTER TABLE drug_strength CHANGE box_size box_size INT COMMENT 'The number of units of Clinical of Branded Drug, or Quantified Clinical or Branded Drug contained in a box as dispensed to the patient';
-- ALTER TABLE drug_strength CHANGE valid_start_date valid_start_date DATE COMMENT 'The date when the Concept was first recorded. The default value is 1-Jan-1970.';
-- ALTER TABLE drug_strength CHANGE valid_end_date valid_end_date DATE COMMENT 'The date when the concept became invalid because it was deleted or superseded (updated) by a new Concept. The default value is 31-Dec-2099.';
-- ALTER TABLE drug_strength CHANGE invalid_reason invalid_reason STRING COMMENT 'Reason the concept was invalidated. Possible values are 'D'(deleted), 'U'(replaced with an update) or NULL when valid_end_date has the default value.';
-- ALTER TABLE observation_period CHANGE observation_period_id observation_period_id INT COMMENT 'A unique identifier for each observation period.';
-- ALTER TABLE observation_period CHANGE person_id person_id INT COMMENT 'A foreign key identifier to the person for whom the observation period is defined. The demographic details of that person are stored in the person table.';
-- ALTER TABLE observation_period CHANGE observation_period_start_date observation_period_start_date DATE COMMENT 'The start date of the observation period for which data are available from the data source.';
-- 
-- ALTER TABLE observation_period CHANGE observation_period_end_date observation_period_end_date DATE COMMENT 'The end date of the observation period for which data are available from the data source.';
-- 
-- ALTER TABLE observation_period CHANGE period_type_concept_id period_type_concept_id INT COMMENT 'A foreign key identifier to the predefined concept in the Standardized Vocabularies reflecting the source of the observation period information';
-- ALTER TABLE specimen CHANGE specimen_id specimen_id INT COMMENT 'A unique identifier for each specimen.';
-- ALTER TABLE specimen CHANGE person_id person_id INT COMMENT 'A foreign key identifier to the Person for whom the Specimen is recorded.';
-- ALTER TABLE specimen CHANGE specimen_concept_id specimen_concept_id INT COMMENT 'A foreign key referring to a Standard Concept identifier in the Standardized Vocabularies for the Specimen.';
-- ALTER TABLE specimen CHANGE specimen_type_concept_id specimen_type_concept_id INT COMMENT 'A foreign key referring to the Concept identifier in the Standardized Vocabularies reflecting the system of record from which the Specimen was represented in the source data.';
-- ALTER TABLE specimen CHANGE specimen_date specimen_date DATE COMMENT 'The date the specimen was obtained from the Person.';
-- ALTER TABLE specimen CHANGE specimen_datetime specimen_datetime TIMESTAMP COMMENT 'The date and time on the date when the Specimen was obtained from the person.';
-- ALTER TABLE specimen CHANGE quantity quantity DECIMAL COMMENT 'The amount of specimen collection from the person during the sampling procedure.';
-- ALTER TABLE specimen CHANGE unit_concept_id unit_concept_id INT COMMENT 'A foreign key to a Standard Concept identifier for the Unit associated with the numeric quantity of the Specimen collection.';
-- ALTER TABLE specimen CHANGE anatomic_site_concept_id anatomic_site_concept_id INT COMMENT 'A foreign key to a Standard Concept identifier for the anatomic location of specimen collection.';
-- ALTER TABLE specimen CHANGE disease_status_concept_id disease_status_concept_id INT COMMENT 'A foreign key to a Standard Concept identifier for the Disease Status of specimen collection.';
-- ALTER TABLE specimen CHANGE specimen_source_id specimen_source_id STRING COMMENT 'The Specimen identifier as it appears in the source data.';
-- ALTER TABLE specimen CHANGE specimen_source_value specimen_source_value STRING COMMENT 'The Specimen value as it appears in the source data. This value is mapped to a Standard Concept in the Standardized Vocabularies and the original code is, stored here for reference.';
-- ALTER TABLE specimen CHANGE unit_source_value unit_source_value STRING COMMENT 'The information about the Unit as detailed in the source.';
-- ALTER TABLE specimen CHANGE anatomic_site_source_value anatomic_site_source_value STRING COMMENT 'The information about the anatomic site as detailed in the source.';
-- ALTER TABLE specimen CHANGE disease_status_source_value disease_status_source_value STRING COMMENT 'The information about the disease status as detailed in the source.';
 ALTER TABLE drug_exposure CHANGE drug_exposure_id drug_exposure_id INT COMMENT 'A system-generated unique identifier for each Drug utilization event.';
 ALTER TABLE drug_exposure CHANGE person_id person_id INT COMMENT 'A foreign key identifier to the person who is subjected to the Drug. The demographic details of that person are stored in the person table.';
 ALTER TABLE drug_exposure CHANGE drug_concept_id drug_concept_id INT COMMENT 'A foreign key that refers to a Standard Concept identifier in the Standardized Vocabularies for the Drug concept.';
 ALTER TABLE drug_exposure CHANGE drug_exposure_start_date drug_exposure_start_date DATE COMMENT 'The start date for the current instance of Drug utilization. Valid entries include a start date of a prescription, the date a prescription was filled, or the date on which a Drug administration procedure was recorded.';
 ALTER TABLE drug_exposure CHANGE drug_exposure_start_datetime drug_exposure_start_datetime TIMESTAMP COMMENT 'The start date and time for the current instance of Drug utilization. Valid entries include a start date of a prescription, the date a prescription was filled, or the date on which a Drug administration procedure was recorded.';
 ALTER TABLE drug_exposure CHANGE drug_exposure_end_date drug_exposure_end_date DATE COMMENT 'The end date for the current instance of Drug utilization. It is not available from all sources.';
 ALTER TABLE drug_exposure CHANGE drug_exposure_end_datetime drug_exposure_end_datetime TIMESTAMP COMMENT 'The end date and time for the current instance of Drug utilization. It is not available from all sources.';
 ALTER TABLE drug_exposure CHANGE verbatim_end_date verbatim_end_date DATE COMMENT 'The known end date of a drug_exposure as provided by the source';
 --ALTER TABLE drug_exposure CHANGE drug_type_concept_id drug_type_concept_id INT COMMENT 'A foreign key to the predefined Concept identifier in the Standardized Vocabularies reflecting the type of Drug Exposure recorded. It indicates how the Drug Exposure was represented in the source data.';
 ALTER TABLE drug_exposure CHANGE stop_reason stop_reason STRING COMMENT 'The reason the Drug was stopped. Reasons include regimen completed, changed, removed, etc.';
 ALTER TABLE drug_exposure CHANGE refills refills INT COMMENT 'The number of refills after the initial prescription. The initial prescription is not counted, values start with 0.';
 ALTER TABLE drug_exposure CHANGE quantity quantity DECIMAL COMMENT 'The quantity of drug as recorded in the original prescription or dispensing record.';
 ALTER TABLE drug_exposure CHANGE days_supply days_supply INT COMMENT 'The number of days of supply of the medication as recorded in the original prescription or dispensing record.';
 ALTER TABLE drug_exposure CHANGE sig sig STRING COMMENT 'The directions ("signetur") on the Drug prescription as recorded in the original prescription (and printed on the container) or dispensing record.';
 ALTER TABLE drug_exposure CHANGE route_concept_id route_concept_id INT COMMENT 'A foreign key to a predefined concept in the Standardized Vocabularies reflecting the route of administration.';
 ALTER TABLE drug_exposure CHANGE lot_number lot_number STRING COMMENT 'An identifier assigned to a particular quantity or lot of Drug product from the manufacturer.';
 ALTER TABLE drug_exposure CHANGE provider_id provider_id INT COMMENT 'A foreign key to the provider in the provider table who initiated (prescribed or administered) the Drug Exposure.';
 ALTER TABLE drug_exposure CHANGE visit_occurrence_id visit_occurrence_id INT COMMENT 'A foreign key to the visit in the visit table during which the Drug Exposure was initiated.';
 ALTER TABLE drug_exposure CHANGE visit_detail_id visit_detail_id INT COMMENT 'A foreign key to the visit in the VISIT_DETAIL table during which the Drug Exposure was initiated.';
 ALTER TABLE drug_exposure CHANGE drug_source_value drug_source_value STRING COMMENT 'The source code for the Drug as it appears in the source data. This code is mapped to a Standard Drug concept in the Standardized Vocabularies and the original code is, stored here for reference.';
 ALTER TABLE drug_exposure CHANGE drug_source_concept_id drug_source_concept_id INT COMMENT 'A foreign key to a Drug Concept that refers to the code used in the source.';
 ALTER TABLE drug_exposure CHANGE route_source_value route_source_value STRING COMMENT 'The information about the route of administration as detailed in the source.';
 ALTER TABLE drug_exposure CHANGE dose_unit_source_value dose_unit_source_value STRING COMMENT 'The information about the dose unit as detailed in the source.';
 ALTER TABLE measurement CHANGE measurement_id measurement_id INT COMMENT 'A unique identifier for each Measurement.';
 ALTER TABLE measurement CHANGE person_id person_id INT COMMENT 'A foreign key identifier to the Person about whom the measurement was recorded. The demographic details of that Person are stored in the PERSON table.';
 ALTER TABLE measurement CHANGE measurement_concept_id measurement_concept_id INT COMMENT 'A foreign key to the standard measurement concept identifier in the Standardized Vocabularies.';
 ALTER TABLE measurement CHANGE measurement_date measurement_date DATE COMMENT 'The date of the Measurement.';
 ALTER TABLE measurement CHANGE measurement_datetime measurement_datetime TIMESTAMP COMMENT 'The date and time of the Measurement. Some database systems don''t have a datatype of time. To accomodate all temporal analyses, datatype datetime can be used (combining measurement_date and measurement_time [forum discussion](http://forums.ohdsi.org/t/date-time-and-datetime-problem-and-the-world-of-hours-and-1day/314))';
 --ALTER TABLE measurement CHANGE measurement_type_concept_id measurement_type_concept_id INT COMMENT 'A foreign key to the predefined Concept in the Standardized Vocabularies reflecting the provenance from where the Measurement record was recorded.';
 ALTER TABLE measurement CHANGE operator_concept_id operator_concept_id INT COMMENT 'A foreign key identifier to the predefined Concept in the Standardized Vocabularies reflecting the mathematical operator that is applied to the value_as_number. Operators are <, <=, =, >=, >.';
 ALTER TABLE measurement CHANGE value_as_number value_as_number DECIMAL COMMENT 'A Measurement result where the result is expressed as a numeric value.';
 ALTER TABLE measurement CHANGE value_as_concept_id value_as_concept_id INT COMMENT 'A foreign key to a Measurement result represented as a Concept from the Standardized Vocabularies (e.g., positive/negative, present/absent, low/high, etc.).';
 ALTER TABLE measurement CHANGE unit_concept_id unit_concept_id INT COMMENT 'A foreign key to a Standard Concept ID of Measurement Units in the Standardized Vocabularies.';
 ALTER TABLE measurement CHANGE range_low range_low DECIMAL COMMENT 'The lower limit of the normal range of the Measurement result. The lower range is assumed to be of the same unit of measure as the Measurement value.';
 ALTER TABLE measurement CHANGE range_high range_high DECIMAL COMMENT 'The upper limit of the normal range of the Measurement. The upper range is assumed to be of the same unit of measure as the Measurement value.';
 ALTER TABLE measurement CHANGE provider_id provider_id INT COMMENT 'A foreign key to the provider in the PROVIDER table who was responsible for initiating or obtaining the measurement.';
 ALTER TABLE measurement CHANGE visit_occurrence_id visit_occurrence_id INT COMMENT 'A foreign key to the Visit in the VISIT_OCCURRENCE table during which the Measurement was recorded.';
 ALTER TABLE measurement CHANGE visit_detail_id visit_detail_id INT COMMENT 'A foreign key to the Visit in the VISIT_DETAIL table during which the Measurement was recorded.';
 ALTER TABLE measurement CHANGE measurement_source_value measurement_source_value STRING COMMENT 'The Measurement name as it appears in the source data. This code is mapped to a Standard Concept in the Standardized Vocabularies and the original code is stored here for reference.';
 ALTER TABLE measurement CHANGE measurement_source_concept_id measurement_source_concept_id INT COMMENT 'A foreign key to a Concept in the Standard Vocabularies that refers to the code used in the source.';
 ALTER TABLE measurement CHANGE unit_source_value unit_source_value STRING COMMENT 'The source code for the unit as it appears in the source data. This code is mapped to a standard unit concept in the Standardized Vocabularies and the original code is stored here for reference.';
 ALTER TABLE measurement CHANGE value_source_value value_source_value STRING COMMENT 'The source value associated with the content of the value_as_number or value_as_concept_id as stored in the source data.';
 ALTER TABLE observation CHANGE observation_id observation_id INT COMMENT 'A unique identifier for each observation.';
 ALTER TABLE observation CHANGE person_id person_id INT COMMENT 'A foreign key identifier to the Person about whom the observation was recorded. The demographic details of that Person are stored in the PERSON table.';
 ALTER TABLE observation CHANGE observation_concept_id observation_concept_id INT COMMENT 'A foreign key to the standard observation concept identifier in the Standardized Vocabularies.';
 ALTER TABLE observation CHANGE observation_date observation_date DATE COMMENT 'The date of the observation.';
 ALTER TABLE observation CHANGE observation_datetime observation_datetime TIMESTAMP COMMENT 'The date and time of the observation.';
 --ALTER TABLE observation CHANGE observation_type_concept_id observation_type_concept_id INT COMMENT 'A foreign key to the predefined concept identifier in the Standardized Vocabularies reflecting the type of the observation.';
 ALTER TABLE observation CHANGE value_as_number value_as_number DECIMAL COMMENT 'The observation result stored as a number. This is applicable to observations where the result is expressed as a numeric value.';
 ALTER TABLE observation CHANGE value_as_string value_as_string STRING COMMENT 'The observation result stored as a string. This is applicable to observations where the result is expressed as verbatim text.';
 ALTER TABLE observation CHANGE value_as_concept_id value_as_concept_id INT COMMENT 'A foreign key to an observation result stored as a Concept ID. This is applicable to observations where the result can be expressed as a Standard Concept from the Standardized Vocabularies (e.g., positive/negative, present/absent, low/high, etc.).';
 ALTER TABLE observation CHANGE qualifier_concept_id qualifier_concept_id INT COMMENT 'A foreign key to a Standard Concept ID for a qualifier (e.g., severity of drug-drug interaction alert)';
 ALTER TABLE observation CHANGE unit_concept_id unit_concept_id INT COMMENT 'A foreign key to a Standard Concept ID of measurement units in the Standardized Vocabularies.';
 ALTER TABLE observation CHANGE provider_id provider_id INT COMMENT 'A foreign key to the provider in the PROVIDER table who was responsible for making the observation.';
 ALTER TABLE observation CHANGE visit_occurrence_id visit_occurrence_id INT COMMENT 'A foreign key to the visit in the VISIT_OCCURRENCE table during which the observation was recorded.';
 ALTER TABLE observation CHANGE visit_detail_id visit_detail_id INT COMMENT 'A foreign key to the visit in the VISIT_DETAIL table during which the observation was recorded.';
 ALTER TABLE observation CHANGE observation_source_value observation_source_value STRING COMMENT 'The observation code as it appears in the source data. This code is mapped to a Standard Concept in the Standardized Vocabularies and the original code is, stored here for reference.';
 ALTER TABLE observation CHANGE observation_source_concept_id observation_source_concept_id INT COMMENT 'A foreign key to a Concept that refers to the code used in the source.';
 ALTER TABLE observation CHANGE unit_source_value unit_source_value STRING COMMENT 'The source code for the unit as it appears in the source data. This code is mapped to a standard unit concept in the Standardized Vocabularies and the original code is, stored here for reference.';
 ALTER TABLE observation CHANGE qualifier_source_value qualifier_source_value STRING COMMENT 'The source value associated with a qualifier to characterize the observation';
 ALTER TABLE fact_relationship CHANGE domain_concept_id_1 domain_concept_id_1 INT COMMENT 'The concept representing the domain of fact one, from which the corresponding table can be inferred.';
 ALTER TABLE fact_relationship CHANGE fact_id_1 fact_id_1 INT COMMENT 'The unique identifier in the table corresponding to the domain of fact one.';
 ALTER TABLE fact_relationship CHANGE domain_concept_id_2 domain_concept_id_2 INT COMMENT 'The concept representing the domain of fact two, from which the corresponding table can be inferred.';
 ALTER TABLE fact_relationship CHANGE fact_id_2 fact_id_2 INT COMMENT 'The unique identifier in the table corresponding to the domain of fact two.';
 -- ALTER TABLE fact_relationship CHANGE relationship_concept_id relationship_concept_id INT COMMENT 'A foreign key to a Standard Concept ID of relationship in the Standardized Vocabularies.';
 ALTER TABLE note CHANGE note_id note_id INT COMMENT 'A unique identifier for each note.';
 ALTER TABLE note CHANGE person_id person_id INT COMMENT 'A foreign key identifier to the Person about whom the Note was recorded. The demographic details of that Person are stored in the PERSON table.';
 ALTER TABLE note CHANGE note_date note_date DATE COMMENT 'The date the note was recorded.';
 ALTER TABLE note CHANGE note_datetime note_datetime TIMESTAMP COMMENT 'The date and time the note was recorded.';
 ALTER TABLE note CHANGE note_type_concept_id note_type_concept_id INT COMMENT 'A foreign key to the predefined Concept in the Standardized Vocabularies reflecting the type, origin or provenance of the Note.';
 ALTER TABLE note CHANGE note_class_concept_id note_class_concept_id INT COMMENT 'A foreign key to the predefined Concept in the Standardized Vocabularies reflecting the HL7 LOINC Document Type Vocabulary classification of the note.';
 ALTER TABLE note CHANGE note_title note_title STRING COMMENT 'The title of the Note as it appears in the source.';
 ALTER TABLE note CHANGE note_text note_text STRING COMMENT 'The content of the Note.';
 ALTER TABLE note CHANGE encoding_concept_id encoding_concept_id INT COMMENT 'A foreign key to the predefined Concept in the Standardized Vocabularies reflecting the note character encoding type';
 ALTER TABLE note CHANGE language_concept_id language_concept_id INT COMMENT 'A foreign key to the predefined Concept in the Standardized Vocabularies reflecting the language of the note';
 ALTER TABLE note CHANGE provider_id provider_id INT COMMENT 'A foreign key to the Provider in the PROVIDER table who took the Note.';
 ALTER TABLE note CHANGE visit_occurrence_id visit_occurrence_id INT COMMENT 'Foreign key to the Visit in the VISIT_OCCURRENCE table when the Note was taken.';
 ALTER TABLE note CHANGE note_source_value note_source_value STRING COMMENT 'The source value associated with the origin of the note';

-- ALTER TABLE cohort CHANGE cohort_definition_id cohort_definition_id INT COMMENT 'A foreign key to a record in the COHORT_DEFINITION table containing relevant Cohort Definition information.';
-- ALTER TABLE cohort CHANGE subject_id subject_id INT COMMENT 'A foreign key to the subject in the cohort. These could be referring to records in the PERSON, PROVIDER, VISIT_OCCURRENCE table.';
-- ALTER TABLE cohort CHANGE cohort_start_date cohort_start_date DATE COMMENT 'The date when the Cohort Definition criteria for the Person, Provider or Visit first match.';
-- ALTER TABLE cohort CHANGE cohort_end_date cohort_end_date DATE COMMENT 'The date when the Cohort Definition criteria for the Person, Provider or Visit no longer match or the Cohort membership was terminated.';
-- ALTER TABLE cohort_attribute CHANGE cohort_definition_id cohort_definition_id INT COMMENT 'A foreign key to a record in the [COHORT_DEFINITION](https://github.com/OHDSI/CommonDataModel/wiki/COHORT_DEFINITION) table containing relevant Cohort Definition information.';
-- ALTER TABLE cohort_attribute CHANGE cohort_start_date cohort_start_date DATE COMMENT 'The date when the Cohort Definition criteria for the Person, Provider or Visit first match.';
-- ALTER TABLE cohort_attribute CHANGE cohort_end_date cohort_end_date DATE COMMENT 'The date when the Cohort Definition criteria for the Person, Provider or Visit no longer match or the Cohort membership was terminated.';
-- ALTER TABLE cohort_attribute CHANGE subject_id subject_id INT COMMENT 'A foreign key to the subject in the Cohort. These could be referring to records in the PERSON, PROVIDER, VISIT_OCCURRENCE table.';
-- ALTER TABLE cohort_attribute CHANGE attribute_definition_id attribute_definition_id INT COMMENT 'A foreign key to a record in the [ATTRIBUTE_DEFINITION](https://github.com/OHDSI/CommonDataModel/wiki/ATTRIBUTE_DEFINITION) table containing relevant Attribute Definition information.';
-- ALTER TABLE cohort_attribute CHANGE value_as_number value_as_number DECIMAL COMMENT 'The attribute result stored as a number. This is applicable to attributes where the result is expressed as a numeric value.';
-- ALTER TABLE cohort_attribute CHANGE value_as_concept_id value_as_concept_id INT COMMENT 'The attribute result stored as a Concept ID. This is applicable to attributes where the result is expressed as a categorical value.';

