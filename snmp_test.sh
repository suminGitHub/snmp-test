#!/bin/bash
#-----------------------------------------------
#
#     Nom : snmp_test.sg
#  Auteur : Barreyre Mylène & Allard Chris
#    Date : 08/04/2016
# Version : 1.0
#  Github : https://github.com/Allard-Chris/snmp-test.git
#
# Script who looping on hosts with a snmpwalk
#
#-----------------------------------------------

#  Table of cummunities
tab_communitie=( "public" "prive" );

# Table of versions
tab_snmp=( "v1" "v2c" );

# Output variable
result="";

# Loop on the hosts in the file hosts.txt
for host in $(cat hosts.txt):
do
        echo "$host in progress";
        result="Host : $host - ";
        # Loop on communitie
        for communitie in ${tab_communitie[*]};
        do
                # Loop on snmp's versions
                for version in ${tab_snmp[*]};
                do
                        result+="[${communitie} ${version}] ";

                        if [ -n "$1" ]
                                then commande=$(snmpwalk -$version -c $communitie $host $1 2> /dev/null);
                                else commande=$(snmpwalk -$version -c $communitie $host 2> /dev/null);
                        fi;

                        if [ -z "$commande" ]
                                then result+=": No response | ";
                                else result+=": Ok | ";
                        fi;
                done;
        done;
        echo "$host done";
        echo $result >> result.txt;
done;
