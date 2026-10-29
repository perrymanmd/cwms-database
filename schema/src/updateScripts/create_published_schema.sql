define cwms_schema = CWMS_20
define cwms_dba_schema = CWMS_DBA
@../cwms/tables/cwms_published_id
@../cwms/tables/at_a2w_attributes
create or replace TRIGGER ST_A2W_ATTRIBUTES BEFORE DELETE OR INSERT OR UPDATE
              ON AT_A2W_ATTRIBUTES REFERENCING NEW AS NEW OLD AS OLD

             DECLARE

             l_priv   VARCHAR2 (16);
             BEGIN
             l_priv := NVL(SYS_CONTEXT ('CWMS_ENV', 'CWMS_PRIVILEGE'),''); 
             IF (l_priv <> 'CAN_WRITE' AND user NOT IN ('SYS', 'CWMS_20', upper('builduser')))
             THEN

               CWMS_20.CWMS_ERR.RAISE('NO_WRITE_PRIVILEGE');

             END IF;
           END;
/
@../cwms/tables/at_published_ts
create or replace TRIGGER ST_PUBLISHED_TS BEFORE DELETE OR INSERT OR UPDATE
              ON AT_PUBLISHED_TS REFERENCING NEW AS NEW OLD AS OLD

             DECLARE

             l_priv   VARCHAR2 (16);
             BEGIN
             l_priv := NVL(SYS_CONTEXT ('CWMS_ENV', 'CWMS_PRIVILEGE'),''); 
             IF (l_priv <> 'CAN_WRITE' AND user NOT IN ('SYS', 'CWMS_20', upper('builduser')))
             THEN

               CWMS_20.CWMS_ERR.RAISE('NO_WRITE_PRIVILEGE');

             END IF;
           END;
/
@../cwms/tables/at_published_rating
create or replace TRIGGER ST_PUBLISHED_RATING BEFORE DELETE OR INSERT OR UPDATE
              ON AT_PUBLISHED_RATING REFERENCING NEW AS NEW OLD AS OLD

             DECLARE

             l_priv   VARCHAR2 (16);
             BEGIN
             l_priv := NVL(SYS_CONTEXT ('CWMS_ENV', 'CWMS_PRIVILEGE'),''); 
             IF (l_priv <> 'CAN_WRITE' AND user NOT IN ('SYS', 'CWMS_20', upper('builduser')))
             THEN

               CWMS_20.CWMS_ERR.RAISE('NO_WRITE_PRIVILEGE');

             END IF;
           END;
/
@../cwms/tables/at_published_level
create or replace TRIGGER ST_PUBLISHED_LEVEL BEFORE DELETE OR INSERT OR UPDATE
              ON AT_PUBLISHED_LEVEL REFERENCING NEW AS NEW OLD AS OLD

             DECLARE

             l_priv   VARCHAR2 (16);
             BEGIN
             l_priv := NVL(SYS_CONTEXT ('CWMS_ENV', 'CWMS_PRIVILEGE'),''); 
             IF (l_priv <> 'CAN_WRITE' AND user NOT IN ('SYS', 'CWMS_20', upper('builduser')))
             THEN

               CWMS_20.CWMS_ERR.RAISE('NO_WRITE_PRIVILEGE');

             END IF;
           END;
/
@../cwms/views/av_a2w_attributes
@../cwms/views/av_published_ts
@../cwms/cwms_a2w_pkg
@../cwms/cwms_a2w_pkg_body
@../cwms/cwms_loc_pkg_body
@../cwms/cwms_rating_pkg_body
@../cwms/cwms_ts_pkg_body
create or replace public synonym cwms_v_a2w_attributes for av_a2w_attributes;
create or replace public synonym cwms_v_published_ts for av_published_ts;
@./util/compile_objects
exit