select username,
       account_status,
       default_tablespace,
       to_char(last_login, 'dd/mm/rrrr hh24:mi:ss') last_login,
       trunc(sysdate - cast(last_login as date)) days_last_login,
       trunc((sysdate - cast(last_login as date)) * 24) hours_last_login,
       trunc((sysdate - cast(last_login as date)) * 1440) minutes_last_login,
       trunc((sysdate - cast(last_login as date)) * 86400) seconds_last_login
  from dba_users
 where last_login is not null;
