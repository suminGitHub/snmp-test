**snmp test**
===================

Just a simple script who looping on hosts with a snmpwalk

----------

How to use it
-------------

You need to have a file named **hosts.txt** which contains an ip addess list.  It must be in the same folder where the script is executed. Don't forget to make it executable on Unix (*chmod +x snmp_text*).

    ./snmp_test

We recommend to test an oid by passing it as an argument when you running the script.

    ./snmp_test 1.3.3.6.0.1.1.1

The script generate a file named **result.txt** that contains the results of all tests for all the hots.
Example of result file :

    Host : 192.168.1.1 - [public v1] : Ok | [public v2c] : No response | [prive v1] : No response | [prive v2c] : Ok |

How to modify it
-------------
You can choose the communities you want to test :

    #  Table of cummunities
    #  Examples : tab_communitie=( "communitie1" "communitie2" "communitie3");
    tab_communitie=( "public" "prive" );

----------

You can choose the versions of snmp you want : V1 or V2C or both :

    # Table of versions
    tab_snmp=( "v1" "v2c" );

