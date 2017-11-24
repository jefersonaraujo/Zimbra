#!/bin/bash

cat /var/log/mail.log| grep "sasl_method=PLAIN" | cut -d: -f5 | sort | uniq -c | sort -n
