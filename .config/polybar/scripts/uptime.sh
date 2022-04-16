GetUptime() {
    Uptime=$(uptime -p)
    echo "${Uptime:3}"
}

GetUptime
while true; do
	sleep 1m
    GetUptime
done
