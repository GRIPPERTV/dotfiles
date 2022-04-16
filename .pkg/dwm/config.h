// G
static const unsigned int borderpx	= 2;
static const unsigned int snap      = 0;
static const int showbar			= 1;
static const int topbar				= 1;

// Fonts
static const char *fonts[] = {
	"JetBrains Mono ExtraBold:size=9"
};

// Colors
static const char Border[]		= "#1A1E31";
static const char Foreground1[]	= "#C5C8C6";
static const char Foreground2[]	= "#0049a8";
static const char Background[]	= "#12172E";
static const char *colors[][3]	= {
	[SchemeNorm] = {Foreground1, Background, Border},
	[SchemeSel]  = {Foreground2, Background, Border},
};

// Tags and Rules
static const char *tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};
static const Rule rules[] = {0};

// Layouts
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	{ "[=]",	tile	},
	{ "[/]",	NULL	}, 
	{ "[M]",	monocle	},
};

// Windows (Super) Key
#define MODKEY Mod4Mask

#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

// Shell
#define SHCMD(cmd) {.v = (const char*[]){"/bin/sh", "-c", cmd, NULL}}

// Applications
static const char *terminal[]	= {"st",	NULL};

static Key keys[] = {
//	Modifier			Key					Function		Argument
	{MODKEY,			XK_d,				spawn,			SHCMD("rlaunch --color0 '#12172e' --color1 '#0049a8' --color2 '#C5C8C6' --color3 '#C5C8C6' --font 'JetBrains Mono ExtraBold:size=9' --height 19 --terminal st")																	},
	{MODKEY,			XK_Print,			spawn,			SHCMD("scrot -f -s -q 100 $HOME/'Pictures/%Y-%m-%d_%H%M%S.png' -e 'xclip -selection clipboard -t image/png -i $f'")	},
	{MODKEY|ShiftMask,	XK_q,				quit,			{0}					},
	{MODKEY,			XK_Return,			spawn,			{.v = terminal}		},
	{MODKEY,			XK_w,				killclient,		{0}					},
	{MODKEY,			XK_b,				togglebar,		{0}					},
	{MODKEY,			XK_0,				view,			{.ui = ~0}			},
	{MODKEY|ShiftMask,	XK_0,				tag,			{.ui = ~0}			},
	{MODKEY,			XK_t,				setlayout,		{.v = &layouts[0]}	},
	{MODKEY,			XK_f,				togglefloating,	{0}					},
	{MODKEY,			XK_m,				setlayout,		{.v = &layouts[2]}	},
	TAGKEYS(			XK_1,				0)
	TAGKEYS(			XK_2,				1)
	TAGKEYS(			XK_3,				2)
	TAGKEYS(			XK_4,				3)
	TAGKEYS(			XK_5,				4)
	TAGKEYS(			XK_6,				5)
	TAGKEYS(			XK_7,				6)
	TAGKEYS(			XK_8,				7)
	TAGKEYS(			XK_9,				8)
	//{MODKEY,			XK_j,				focusstack,		{.i = +1}			},
	//{MODKEY,			XK_k,				focusstack,		{.i = -1 }			},
	//{MODKEY,			XK_i,				incnmaster,		{.i = +1 }			},
	//{MODKEY,			XK_d,				incnmaster,		{.i = -1 }			},
	//{MODKEY,			XK_h,				setmfact,		{.f = -0.05}		},
	//{MODKEY,			XK_l,				setmfact,		{.f = +0.05}		},
	//{MODKEY,			XK_Return,			zoom,			{0}					},
	//{MODKEY,			XK_Tab,				view,			{0}					},
	//{MODKEY,			XK_space,			setlayout,		{0}					},
	//{MODKEY,			XK_comma,			focusmon,		{.i = -1 }			},
	//{MODKEY,			XK_period,			focusmon,		{.i = +1 }			},
	//{MODKEY|ShiftMask,	XK_comma,			tagmon,			{.i = -1 }			},
	//{MODKEY|ShiftMask,	XK_period,			tagmon,         {.i = +1 }			},
};

// Buttons
// ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin or ClkRootWin
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = terminal } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
