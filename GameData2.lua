local v_u_1 = {}
local v_u_2 = game:GetService("Players")
v_u_1.GlobalMessageThreshold = 1000000
v_u_1.UIDStringNameCache = {}
v_u_1.GlobalNameCache = {
	["720402061"] = {
		["Name"] = "AnasThePineapple",
		["Color"] = ColorSequence.new(Color3.new(1, 1, 1), Color3.new(1, 1, 0))
	},
	["3723216466"] = {
		["Name"] = "Chroma_Zeta",
		["Color"] = ColorSequence.new(Color3.new(1, 1, 1), Color3.new(1, 1, 0))
	},
	["823339447"] = {
		["Name"] = "idkhowtomakeusername",
		["Color"] = ColorSequence.new(Color3.new(1, 1, 1), Color3.new(1, 1, 0))
	}
}
v_u_1.StaffRank = {
	{
		["Name"] = "???",
		["Rank"] = 255,
		["Color"] = Color3.new(0.333333, 0, 0)
	},
	{
		["Name"] = "Owner",
		["Rank"] = 254,
		["Color"] = Color3.new(1, 0, 0.498039)
	},
	{
		["Name"] = "Lead Developer",
		["Rank"] = 170,
		["Color"] = Color3.new(0.666667, 0, 1)
	},
	{
		["Name"] = "Developer+",
		["Rank"] = 150,
		["Color"] = Color3.new(0, 0.333333, 1)
	},
	{
		["Name"] = "Developer",
		["Rank"] = 149,
		["Color"] = Color3.new(0, 0.333333, 1)
	},
	{
		["Name"] = "Management",
		["Rank"] = 140,
		["Color"] = Color3.new(1, 0, 0)
	},
	{
		["Name"] = "Administrator",
		["Rank"] = 120,
		["Color"] = Color3.new(0, 1, 1)
	},
	{
		["Name"] = "Moderator",
		["Rank"] = 110,
		["Color"] = Color3.new(0, 0.666667, 1)
	},
	{
		["Name"] = "Trial Moderator",
		["Rank"] = 100,
		["Color"] = Color3.new(1, 0.333333, 0)
	},
	{
		["Name"] = "Content Creator",
		["Rank"] = 61,
		["Color"] = Color3.new(1, 0, 0)
	},
	{
		["Name"] = "Tester",
		["Rank"] = 60,
		["Color"] = Color3.new(0.333333, 0.666667, 1)
	},
	{
		["Name"] = "Official Aura Creator",
		["Rank"] = 20,
		["Color"] = Color3.new(0.666667, 0.666667, 1)
	},
	{
		["Name"] = "Curator",
		["Rank"] = 17,
		["Color"] = Color3.new(1, 0.333333, 1)
	},
	{
		["Name"] = "Contributor",
		["Rank"] = 15,
		["Color"] = Color3.new(1, 0, 0.498039)
	}
}
v_u_1.Items = require(script.Items)
v_u_1.SecretDesigns = require(script.Secrets)
v_u_1.Designs = require(script.Rarities)
v_u_1.IS_STUDIO = game:GetService("RunService"):IsStudio()
v_u_1.IS_PRODUCTION = game.PlaceId == 15296932900
v_u_1.IS_RUNTIME = game:GetService("RunService"):IsRunning()
v_u_1.Variants = {
	{
		["Name"] = "Shiny",
		["Rarity"] = 100,
		["Lore"] = "\"the filler variant\"",
		["Description"] = "The first variant added to the game.",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Midas",
		["Rarity"] = 500,
		["Lore"] = "\"Cast in gold...\"",
		["Description"] = "I verified the golden",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Chromatic",
		["Rarity"] = 1000,
		["Lore"] = "\"EVERY COLOR\"",
		["Description"] = "FEEL THE RAINBOOOOW!!!",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Spectral",
		["Rarity"] = 2500,
		["Lore"] = "\"This aura but evil\"",
		["Description"] = "what if the aura was evil and inverted instead",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Abyssal",
		["Rarity"] = 3333,
		["Lore"] = "\"This aura but eviler\"",
		["Description"] = "what if the aura was evil and pitch dark instead",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Dark",
		["Rarity"] = 5000,
		["Lore"] = "\"This aura but not so evil\"",
		["Description"] = "what if the aura was evil and purple instead",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Bygone",
		["Rarity"] = 10000,
		["Lore"] = "\"unattainable\"",
		["Description"] = "this was originally an unattainable reference youre welcome",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Super",
		["Rarity"] = 100000,
		["Lore"] = "\"I HAVE TO GO SUPEEERRRR\"",
		["Description"] = "what if the aura was twice as large",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Omega",
		["Rarity"] = 1000000,
		["Lore"] = "\"I HAVE TO GO OMEGGAAAAA\"",
		["Description"] = "what if the aura was four times as large",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Plot Armor",
		["Rarity"] = 1000000000,
		["Lore"] = "\"chromatic but better\"",
		["Description"] = "what does this have anything to do with the trope plot armor",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Impossible",
		["Rarity"] = 1000000000000,
		["Lore"] = "\"literally impossible\"",
		["Description"] = "bro what how did you roll this",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Overseer",
		["Rarity"] = 33333,
		["Lore"] = "\"bygone but green\"",
		["Description"] = "what if bygone was yk Green instead of Red i think it kinda fits some avatars yk yk",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Tidal",
		["Rarity"] = 50000,
		["Lore"] = "\"bygone but blue\"",
		["Description"] = "what if bygone was yk Blue instead of Red i think it kinda fits some avatars yk yk",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Endless",
		["Rarity"] = 77777,
		["Lore"] = "\"endless particles\"",
		["Description"] = "What if the particles lasted longer\n\nthe answer: 10 fps",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Eternal",
		["Rarity"] = 7777777,
		["Lore"] = "\"eternal particles\"",
		["Description"] = "What if the particles lasted even longer\n\nthe answer: 2 fps",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Invisible",
		["Rarity"] = 8888,
		["Lore"] = "\"Not Very (In)Visible\"",
		["Description"] = "is it really invisible or is it just not very visible if you think about it",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Infinite",
		["Rarity"] = 50000000,
		["Lore"] = "\"I HAVE TO GO INFINIIITTTEEE\"",
		["Description"] = "what if the aura was eight times as large",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Corrupted",
		["Rarity"] = -404,
		["RNG"] = -2,
		["Lore"] = "\"qwertuiop\"",
		["Description"] = "abcdefghijklmnopqrstuvwxyz",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@amonoless</b></font>"
	},
	{
		["Name"] = "Verified",
		["Rarity"] = 66,
		["RNG"] = -2,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"Thanks for following!\"",
		["Description"] = "maybe one day ill be verified too...",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Favored",
		["Rarity"] = 75,
		["RNG"] = -2,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"Thanks for favouriting!\"",
		["Description"] = "your favourites are appreciated.",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Colossal",
		["Rarity"] = 777777777,
		["Lore"] = "\"I HAVE TO GO COLOSSAAAALLLLLL\"",
		["Description"] = "what if the aura was sixteen times as large",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Astronomic",
		["Rarity"] = 5000000000,
		["Lore"] = "\"I HAVE TO GO ASTRONOMICCCCCCC\"",
		["Description"] = "what if the aura was thirty-two times as large",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Unorthodox",
		["Rarity"] = 23456,
		["Lore"] = "\'UNORTHODOX\'",
		["Description"] = "Never let them know your next move.",
		["Credits"] = "Idea from <font color=\"rgb(80, 165, 225)\"><i>[Chroma_Zeta]</i></font>"
	},
	{
		["Name"] = "Supporter",
		["Rarity"] = 99,
		["RNG"] = -2,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"Thanks for liking!\"",
		["Description"] = "Liking the game really helps us out, thanks!",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Glitched",
		["Rarity"] = -1,
		["Lore"] = "\"01100111 01101100 01101001 01110100 01100011 01101000 01100101 01100100\"",
		["Description"] = "01110100 01101000 01101001 01110011 00100000 01101001 01110011 00100000 01110100 01111001 01110000 01101001 01100011 01100001 01101100 01101100 01111001 00100000 01100100 01110010 01101111 01110000 01110000 01100101 01100100 00100000 01101001 01101110 00100000 01100011 01101100 01101111 01110110 01100101 01110010 00100000 01100110 01101111 01110010 01101101 00100000 01100110 01110010 01101111 01101101 00100000 01100100 01100101 01110110 01100101 01101100 01101111 01110000 01100101 01110010 01110011 00101100 00100000 01111001 01101111 01110101 00100111 01101100 01101100 00100000 01101000 01100001 01110110 01100101 00100000 01110100 01101111 00100000 01100110 01101001 01101110 01100100 00100000 01101111 01101110 01100101 00100000 01101111 01100110 00100000 01110101 01110011 00100000 01110100 01101111 00100000 01100111 01100101 01110100 00100000 01110100 01101000 01101001 01110011 00100000 00101000 01100001 01100111 01100001 01101001 01101110 00101001 ",
		["Credits"] = "Idea from <font color=\"rgb(80, 165, 225)\"><i>@Chroma_Zeta</i></font>"
	},
	{
		["Name"] = "Bum",
		["Rarity"] = 0,
		["RNG"] = -1,
		["Lore"] = "\"dude when is pvp getting added to fortunes end bro\"",
		["Description"] = "Dedicated to the bums that ask for free stuff",
		["Credits"] = "Idea from <font color=\"rgb(80, 165, 225)\"><i>@Chroma_Zeta</i></font>"
	},
	{
		["Name"] = "Tiny",
		["Rarity"] = 11111,
		["Lore"] = "\"I HAVE TO GO tiny...\"",
		["Description"] = "what if the aura was twice as SMALL",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Microscopic",
		["Rarity"] = 555555,
		["Lore"] = "\"I HAVE TO GO microscopic...\"",
		["Description"] = "what if the aura was fourice as SMALL",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Quantum",
		["Rarity"] = 11111111,
		["Lore"] = "\"I HAVE TO GO quantum...\"",
		["Description"] = "what if the aura was eightice as SMALL",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@Chroma_Zeta</b></font>"
	},
	{
		["Name"] = "Pineapple",
		["Rarity"] = -2.33,
		["RNG"] = -1,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"pineapple\"",
		["Description"] = "anas threw this away after he saw it on his pizza",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Retro",
		["Rarity"] = -2.55,
		["RNG"] = -1,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"bro\"",
		["Description"] = "just pretend this is a good description",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Candy",
		["Rarity"] = 85000,
		["Lore"] = "\"Qira dropped this\"",
		["Description"] = "Yummy",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Divine",
		["Rarity"] = 750000000,
		["Lore"] = "\"dipped into holy water\"",
		["Description"] = "dropped from heaven itself",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "EVIL",
		["Rarity"] = 666666666,
		["Lore"] = "\"muhahahaha\"",
		["Description"] = "very evil",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Icy",
		["Rarity"] = 8000,
		["Lore"] = "\"cold\"",
		["Description"] = "its freezing bro why did u pick this up",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "\240\159\166\131",
		["Rarity"] = 0,
		["Lore"] = "\"gobble gobble gobble\"",
		["Description"] = "gobble gobble gobble gobble gobble gobble",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Mythic",
		["Rarity"] = 30000000,
		["Lore"] = "\"MYTHIC???\"",
		["Description"] = "it is radiating too much aura",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Flame",
		["Rarity"] = 20000,
		["Lore"] = "\"its really hot\"",
		["Description"] = "dont go near water or it might disappear",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Nautical",
		["Rarity"] = 150000,
		["Lore"] = "\"da sea\"",
		["Description"] = "whoooosh",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "burger",
		["Rarity"] = -36.7,
		["RNG"] = -1,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"burger\"",
		["Description"] = "burgerification",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "geen",
		["Rarity"] = -4.2,
		["RNG"] = -1,
		["Lore"] = "\"i stole this from some villagers\"",
		["Description"] = "this is so green",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Candycane",
		["Rarity"] = -2500000,
		["RNG"] = -1,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"candy but christmas\"",
		["Description"] = "sweet",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Snowflake",
		["Rarity"] = -55000000,
		["RNG"] = -1,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"omg its snowing\"",
		["Description"] = "snow snow snow",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Gingerbread",
		["Rarity"] = -1250000,
		["RNG"] = -1,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"yummy\"",
		["Description"] = "gingerbread man will be mad if you eat this",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "WINNNNNER",
		["Rarity"] = -40,
		["RNG"] = -1,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"given out as a reward after events\"",
		["Description"] = "umm U WON AN EVENT!!",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "noob",
		["Rarity"] = -41,
		["RNG"] = -1,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"qira\"",
		["Description"] = "this is for qira",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "bob",
		["Rarity"] = -606,
		["RNG"] = -1,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"the builder\"",
		["Description"] = "i am bob",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "2026",
		["Rarity"] = -2026,
		["RNG"] = -1,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"OMG NEW YEARS 2026\"",
		["Description"] = "2026 WOOOOOOOO",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Obsidian",
		["Rarity"] = 250000,
		["Lore"] = "\"nether portal\"",
		["Description"] = "this is actually very brittle",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Astral",
		["Rarity"] = 75000000,
		["Lore"] = "\"from the stars\"",
		["Description"] = "a star dropped this",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "67",
		["Rarity"] = -67,
		["Lore"] = "\"67\"",
		["Description"] = "67",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@azullazarus</i></font>, blame anas cuz he wasn\'t on this week 2 do variants"
	},
	{
		["Name"] = "Tung Tung Tung Sahur",
		["Rarity"] = -8000,
		["Lore"] = "\"my goat triple t\"",
		["Description"] = "",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@azullazarus</i></font>, blame anas cuz he wasn\'t on this week 2 do variants"
	},
	{
		["Name"] = "Diamond",
		["Rarity"] = 75000,
		["Lore"] = "\"OMG DIAMONMD\"",
		["Description"] = "UR RICH",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Gold",
		["Rarity"] = 25000,
		["Lore"] = "\"ooo shiny\"",
		["Description"] = "careful this is expensive",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "genuinely",
		["Rarity"] = -12345,
		["RNG"] = -1,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"genuinely\"",
		["Description"] = "genuinely this variant is genuinelly genuinely",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "vibes",
		["Rarity"] = -40000,
		["RNG"] = -1,
		["ExcludedFromGeneration"] = true,
		["Lore"] = "\"i need this pls\"",
		["Description"] = "kicked for ruining the vibes",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "Vaporwave",
		["Rarity"] = 99999,
		["Lore"] = "\"wave of vapor\"",
		["Description"] = "wait this lowk is peak",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@cryreri</b></font>"
	},
	{
		["Name"] = "Lovely \226\157\164\239\184\143",
		["Rarity"] = -600000,
		["RNG"] = -1,
		["Lore"] = "\"valentines wooo\"",
		["Description"] = "spread love",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@anasthepineapple</b></font>"
	},
	{
		["Name"] = "Fortunate",
		["Rarity"] = -7777777,
		["RNG"] = -1,
		["Lore"] = "\"fortune but its a clover\"",
		["Description"] = "u are lucky",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><i>@anasthepineapple</i></font>"
	},
	{
		["Name"] = "\240\159\146\128",
		["Rarity"] = -148,
		["RNG"] = -1,
		["Lore"] = "\"a sl labian tradition\"",
		["Description"] = "insert skull react",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@anasthepineapple</b></font>"
	},
	{
		["Name"] = "beans",
		["Rarity"] = -251,
		["RNG"] = -1,
		["Lore"] = "\"a can of beans\"",
		["Description"] = "good food for survival situations",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@anasthepineapple</b></font>"
	},
	{
		["Name"] = "dond",
		["Rarity"] = -4004,
		["RNG"] = -1,
		["Lore"] = "\"dond\"",
		["Description"] = "dond",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@anasthepineapple</b></font>"
	},
	{
		["Name"] = "Flicker",
		["Rarity"] = 5450000000,
		["Lore"] = "\"dond\"",
		["Description"] = "dond",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@anasthepineapple</b></font>"
	},
	{
		["Name"] = "Frostbite",
		["Rarity"] = 1750000000,
		["Lore"] = "\"dond\"",
		["Description"] = "dond",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@anasthepineapple</b></font>"
	},
	{
		["Name"] = "HOT",
		["Rarity"] = -6721,
		["RNG"] = -1,
		["Lore"] = "\"MAYONNAISE!\"",
		["Description"] = "Limited-Time Variant for the Hot RNG Collab",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@anasthepineapple</b></font>"
	},
	{
		["Name"] = "wipe",
		["Rarity"] = 1111111111,
		["Lore"] = "\"WIPE WIPE WIPE!\"",
		["Description"] = "it wipes ur aura. kinda.",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@anasthepineapple</b></font>"
	},
	{
		["Name"] = "1 millipon luck",
		["Rarity"] = 1000100,
		["Lore"] = "\"wow\"",
		["Description"] = "guys i think this is real",
		["Credits"] = "Idea by <font color=\"rgb(80, 165, 225)\"><b>@anasthepineapple</b><
