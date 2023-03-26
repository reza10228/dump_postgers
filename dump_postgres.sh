#!/bin/bash
Date=`date +%Y-%m-%d`
Service=MY_DB
Directory=/backup/BackupSql/$Service/$Date

Today=`date +%H-%M`
three_day=`date -d "3days ago" +'%F'`
Pass="xxxxxxxxxxxxxxxx"
Expire=8

if [ ! -d $Directory ];
then
                mkdir -p /backup/BackupSql/$Service/$Date
fi

docker exec psql_test pg_dump postgresql://srcaccess:$Pass@192.168.1.15:5432/MY_DB > $Directory/$Service-$Today.sql
