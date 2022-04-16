static const Block blocks[] = {
	{"",
		"echo \"$(uptime -p) (Uptime)\" | cut -c 4-",
		60, 0
	},

	{"",
		"echo \"$(pacman -Q | wc -l) Packages\"",
		300, 0
	},

	{"Down ",
		"ifstat2 -i eth0 1s 1 | awk 'NR==3 {if (int($1/1000) > 0) print int($1/1000) \"Mb/s\"; else print int($1) \"Kb/s\"}'",
		1, 0
	},

	{"Up ",
		"ifstat2 -i eth0 1s 1 | awk 'NR==3 {if (int($2/1000) > 0) print int($2/1000) \"Mb/s\"; else print int($2) \"Kb/s\"}'",
		1, 0
	},

	{"RAM ",
		"free -h | awk '/^Mem/ {print $3\"/\"$2}' | sed s/i//g",
		1, 0
	},

	{"HDD ",
		"free -h | awk '/^Swap/ {print $3\"/\"$2}' | sed s/i//g",
		1, 0
	},

	{"CPU ",
		"top -n 1 -b | awk '/^%Cpu/{print int($2) \"%\"}'",
		1, 0
	},
	
	{"",
		"date +'%H:%M'",
		60, 0
	},
	
	{"",
		"echo",
		0, 0
	},
};

static char delim[] = " | ";
static unsigned int delimLen = 5;
