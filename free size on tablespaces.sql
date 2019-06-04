select df.tablespace_name,
       df.bytes bytes_free,
       trunc(df.bytes / 1024, 2) kbytes_free,
       trunc(df.bytes / 1024 / 1024, 2) mbytes_free,
       trunc(df.bytes / 1024 / 1024 / 1024, 2) gbytes_free
  from (select tablespace_name, sum(bytes) bytes
          from dba_data_files
         group by tablespace_name) df,
       (select tablespace_name, sum(bytes) bytes
          from dba_free_space
         group by tablespace_name) fs
 where df.tablespace_name = fs.tablespace_name(+)
 order by bytes_free;
