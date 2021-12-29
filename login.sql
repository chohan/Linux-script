set sqlformat ansiconsole

alias usr=select username, account_status, default_tablespace, created, profile from dba_users where oracle_maintained='N' order by username;
alias sess=select count(*), username, machine from v$session group by username, machine order by username, machine;
alias dblinks=select * from dba_db_links order by db_link;
alias registry=select comp_name, version, status from dba_registry;
alias invalid=select count(*), owner, object_type from dba_objects where status = 'INVALID' group by owner, object_type order by owner, object_type;
alias whoami=sys_context('userenv', 'session_user') from dual;
alias ft=select table_name from user_tables where regexp_like(table_name, '.*' || :tab_name || '.*', 'i');
alias ftc=Select substr(table_name,1,25) Tab, substr(column_name,1,25) Col from all_tab_columns where regexp_like(column_name, '.*' || :col || '.*', 'i');
alias tc=Select count(*) from track_message;
alias tracks=Select * from track_message where timestamp >= to_timestamp(:t1, 'YYYYMMDD HH24:MI') AND timestamp < to_timestamp(:t2, 'YYYYMMDD HH24:MI');
