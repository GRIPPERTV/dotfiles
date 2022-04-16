GetPackages() {
    Packages=$(pacman -Q | wc -l)
    echo $Packages
}

GetPackages
while true; do
	sleep 5m
    GetPackages
done
