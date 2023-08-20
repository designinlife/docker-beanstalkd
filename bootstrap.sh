#!/bin/sh

set -e

wal_enabled=${WAL_ENABLED:-0}
job_max_size=${JOB_MAX_SIZE:-1048576}

if [ "$wal_enabled" == "1" ]; then
    exec /usr/bin/beanstalkd -l 0.0.0.0 -p 11300 -z $job_max_size -b /var/lib/beanstalkd -F
else
    exec /usr/bin/beanstalkd -l 0.0.0.0 -p 11300 -z $job_max_size
fi
