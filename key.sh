#!/usr/bin/expect -f

set arg1 [lindex $argv 0]

set timeout -1
spawn bash
expect "*#"
send -- "./update\r"
expect "*I can not find your license key*"
send -- $arg1\r
expect "*Done!*"