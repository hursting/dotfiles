

#-------------------------------------------------------------
# Other Operations:
#-------------------------------------------------------------

function up()
{
    for i in `seq 1 $1`;
    do
        cd ../
    done;
}


#-------------------------------------------------------------
# Misc utilities:
#-------------------------------------------------------------

function my_ip() # Get IP adress on ethernet.
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}

function canbeupgraded(){
    choco upgrade all
}