-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiled with Velocity Script Decompiler
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
        ["Rarity"] = 7777777,
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
    }
}
v_u_1.OrderedVariants = table.clone(v_u_1.Variants)
table.sort(v_u_1.OrderedVariants, function(p3, p4)
    return p3.Rarity < p4.Rarity
end)
v_u_1.Tiers = {
    {
        ["Name"] = "WhatteSigma",
        ["Rarity"] = -69420,
        ["TopText"] = "???"
    },
    {
        ["Name"] = "REDACTED",
        ["Rarity"] = -2,
        ["TopText"] = "[REDACTED]"
    },
    {
        ["Name"] = "Exclusive",
        ["Rarity"] = -1,
        ["TopText"] = "\229\134\160"
    },
    {
        ["Name"] = "Unobtainable",
        ["Rarity"] = 0,
        ["TopText"] = "X"
    },
    {
        ["Name"] = "Common",
        ["Rarity"] = 1,
        ["TopText"] = "\226\152\133"
    },
    {
        ["Name"] = "Uncommon",
        ["Rarity"] = 1000,
        ["TopText"] = "\226\152\133\226\152\133"
    },
    {
        ["Name"] = "Rare",
        ["Rarity"] = 10000,
        ["TopText"] = "\226\152\133\226\152\133\226\152\133"
    },
    {
        ["Name"] = "Super Rare",
        ["Rarity"] = 100000,
        ["TopText"] = "\226\152\133\226\152\133\226\152\133\226\152\133"
    },
    {
        ["Name"] = "Miracle",
        ["Rarity"] = 1000000,
        ["TopText"] = "\226\152\133\226\152\133\226\152\133\226\152\133\226\152\133"
    },
    {
        ["Name"] = "Ascendant",
        ["Rarity"] = 10000000,
        ["TopText"] = "6\226\152\133"
    },
    {
        ["Name"] = "Fabled",
        ["Rarity"] = 100000000,
        ["TopText"] = "7\226\152\133"
    },
    {
        ["Name"] = "Transcendant",
        ["Rarity"] = 1000000000,
        ["TopText"] = "8\226\152\133"
    },
    {
        ["Name"] = "Ultimate",
        ["Rarity"] = 9999999999.99,
        ["TopText"] = "9\226\152\133"
    },
    {
        ["Name"] = "WHY",
        ["Rarity"] = 100000000000,
        ["TopText"] = "10\226\152\133"
    },
    {
        ["Name"] = "skibidi",
        ["Rarity"] = 1000000000000,
        ["TopText"] = "\240\159\154\189"
    },
    {
        ["Name"] = "No",
        ["Rarity"] = 1000000000000000,
        ["TopText"] = "\240\159\145\142"
    },
    {
        ["Name"] = "Stop",
        ["Rarity"] = 1e18,
        ["TopText"] = "\240\159\155\145"
    },
    {
        ["Name"] = "Lol",
        ["Rarity"] = 1e303,
        ["TopText"] = "Centillion"
    }
}
v_u_1.Enchants = require(script.Enchants)
v_u_1.__IterableEnchants = setmetatable({}, {
    ["__iter"] = function()
        -- upvalues: (copy) v_u_1
        local v_u_5 = v_u_1.Enchants
        local v_u_6, v_u_7 = next(v_u_5, nil)
        local v_u_8 = 0
        local v_u_9 = #v_u_7
        local v_u_10 = 0
        local v_u_11
        if v_u_7[1] then
            v_u_11 = v_u_7[1].Rarity + v_u_10 or v_u_10
        else
            v_u_11 = v_u_10
        end
        return function()
            -- upvalues: (ref) v_u_8, (ref) v_u_10, (ref) v_u_9, (ref) v_u_6, (ref) v_u_7, (copy) v_u_5, (ref) v_u_11
            v_u_8 = v_u_8 + 1
            v_u_10 = v_u_10 + 1
            if v_u_9 < v_u_8 then
                v_u_8 = 1
                local v12, v13 = next(v_u_5, v_u_6)
                v_u_6 = v12
                v_u_7 = v13
                v_u_11 = v_u_7 and (v_u_7[1] and v_u_7[1].Rarity + v_u_10) or v_u_10
                if not v_u_6 then
                    return
                end
                v_u_9 = #v_u_7
            end
            if v_u_8 <= v_u_9 then
                return v_u_8, v_u_7[v_u_8], v_u_11, v_u_6
            end
        end
    end
})
v_u_1.SpecialCloverAttributes = {
    ["Precise"] = {
        ["Chance"] = 100,
        ["Description"] = "The next roll(s) will have only have one decimal point\nOr maybe no decimal at all!"
    },
    ["Rounded"] = {
        ["Chance"] = 350,
        ["Description"] = "The next roll(s) will be <font color=\"rgb(80, 165, 225)\">Integer</font>"
    },
    ["Random"] = {
        ["Chance"] = 350,
        ["Description"] = "The next roll(s) <font color=\"rgb(80, 165, 225)\">Variant</font> will be <font color=\"rgb(80, 165, 225)\">Randomized</font>"
    },
    ["Undead"] = {
        ["Chance"] = 75,
        ["Description"] = "This clover has a chance to <font color=\"rgb(80, 165, 225)\">recycles</font>"
    },
    ["Immortal"] = {
        ["Chance"] = 1000000,
        ["Description"] = "This clover (almost) ALWAYS <font color=\"rgb(80, 165, 225)\">recycles</font>."
    },
    ["Degrading"] = {
        ["Chance"] = 10000,
        ["Description"] = "Upon usage, instead of destroying, this clover will degrade to the closest <font color=\"rgb(80, 165, 225)\">Variant</font> (if it have any, lool)"
    },
    ["True"] = {
        ["Chance"] = 50000,
        ["Description"] = "The next roll\'s secret luck will also be boosted by the Clover\'s multiplier."
    },
    ["Grand"] = {
        ["Chance"] = 25000,
        ["Description"] = "Upon usage, this clover will affect <b>everyone in the server</b>."
    },
    ["Finale"] = {
        ["Chance"] = 200000,
        ["Description"] = "<i>The Clover to end ALL Clovers.</i>\n\nUpon usage, this clover will affect <b>EVERYONE in EVERY SERVER</b>."
    }
}
v_u_1.SpecialSecretMethods = {
    ["0"] = {},
    ["1"] = {
        ["RESIGNATION"] = function(p14, _, _, _, p15)
            local v16 = (p15:GetAttribute("RESIGNATION_PITY") or 0) + 1
            local v17 = p14 > 5000000000 and 0 or v16
            local v18
            if 50000 + math.random(-100, 100) < v17 then
                v17 = 0
                v18 = true
            else
                v18 = false
            end
            p15:SetAttribute("RESIGNATION_PITY", v17)
            if v18 then
                return -10000
            end
        end,
        ["Damned"] = function(p19, p20, p21, _)
            if p19 == 1 then
                if not (p20[p21 - 1] and p20[p21 + 1]) then
                    return
                end
                if p20[p21 - 1][1] > 100000 and p20[p21 + 1][1] > 100000 then
                    return -7861
                end
            end
        end,
        ["Skibidinium"] = function(p22, _, _, _)
            if p22 == 9999999999.99 then
                local _ = Random.new():NextInteger(1, 100) == 1
            end
        end,
        ["Completionist"] = function(_, _, _, p23)
            -- upvalues: (copy) v_u_1
            if Random.new():NextInteger(1, 50000) == 1 then
                for _, v24 in v_u_1.Designs["1"] do
                    if v24.Requirement and (v24.Requirement > 0 and not p23.Discovered.Design["1"][v24.Name]) then
                        return nil
                    end
                end
                return -33.33
            end
        end,
        ["Gilded"] = function(_, _, _, p25)
            if p25.Gamepasses.VIP and Random.new():NextInteger(1, 1000) == 1 then
                return -0.22
            end
        end,
        ["Diamond"] = function(_, _, _, p26)
            if p26.Gamepasses.NewMVP and Random.new():NextInteger(1, 1000) == 1 then
                return -11.11
            end
        end,
        ["Emerald"] = function(_, _, _, p27)
            if p27.Gamepasses.MVP and Random.new():NextInteger(1, 1000) == 1 then
                return -33333.33
            end
        end,
        ["SunkenN4Leaf"] = function(_, _, _, p28)
            if p28 then
                local v29 = Random.new():NextInteger(1, 6363636.36)
                local v30 = Random.new():NextInteger(1, 4444444.44)
                if p28.Variant == 13 and v29 == 1 then
                    return -363
                end
                if p28.Variant == 14 and v30 == 1 then
                    return -44.44
                end
                if p28.Inventory then
                    for _, v31 in p28.Inventory.Roll do
                        if v31[2] == 13 and v29 == 1 then
                            return -363
                        end
                        if v31[2] == 14 and v30 == 1 then
                            return -44.44
                        end
                    end
                end
                if v29 == 1 or v30 == 1 then
                    warn("Someone rolled sunken and 4leaf but no variant lmaooo")
                end
            end
        end,
        ["Retro"] = function(_, _, _, p32, p33)
            if p32 then
                if p33:GetAttribute("HasMetMe") and Random.new():NextInteger(1, 1000000) == 1 then
                    return -10000000
                end
            end
        end,
        ["Zeta"] = function(_, _, _, p34, _)
            if p34 then
                if p34.RNG == -10000000 and Random.new():NextInteger(1, 12345678) == 1 then
                    return -12345678
                end
            end
        end,
        ["Perlica"] = function(_, _, _, p35, p36)
            -- upvalues: (copy) v_u_2, (copy) v_u_1
            if p35 then
                if p35.RNG == 2000 then
                    local v37 = p35.Settings.HCE and 13000000 or 400000000
                    local v_u_38 = 0
                    for _, v_u_39 in v_u_2:GetPlayers() do
                        if p36 == v_u_39 or not p35.Settings.HCE then
                            pcall(function()
                                -- upvalues: (copy) v_u_39, (ref) v_u_38, (ref) v_u_1
                                if v_u_39.leaderstats.RNG.Value == 2000 then
                                    v_u_38 = v_u_38 + 1
                                end
                                for _, v40 in v_u_1.Variants do
                                    if v_u_39.leaderstats.RNG.Value == 2000 * v40.Rarity and v40.Rarity > 1 then
                                        local v41 = v_u_38
                                        local v42 = v40.Rarity
                                        v_u_38 = v41 + (math.log10(v42) / 2 + 1)
                                    end
                                end
                            end)
                        end
                    end
                    local v43 = p35.Settings.HCE and 1 or v_u_38
                    local v44 = v37 / math.max(v43, 1)
                    if math.random(1, (math.ceil(v44))) == 1 then
                        return -20000000
                    end
                end
            end
        end,
        ["him"] = function(_, _, _, p45, _)
            if p45 then
                for _, v46 in p45.Enchants do
                    if v46[1] == "Anas\' Blessing" and Random.new():NextInteger(1, 10000000) == 1 then
                        return -1000000
                    end
                end
            end
        end,
        ["UnlimitedNSariel"] = function(_, _, _, p47)
            if p47 then
                for _, v48 in p47.Enchants do
                    if v48[1] == "Reaper" and Random.new():NextInteger(1, 6000000) == 1 then
                        return -666.66
                    end
                    if p47.RNG == -666.66 and Random.new():NextNumber(1, 33000000) == 1 then
                        return -666666.66
                    end
                end
            end
        end,
        ["Cattack"] = function(_, _, _, p49, p50)
            if p49 then
                if p50.Character:FindFirstChild("Shirt Graphic") and (p50.Character:FindFirstChild("Shirt Graphic").Graphic == "http://www.roblox.com/asset/?id=24385215" and Random.new():NextInteger(1, 111999444777) == 1) then
                    return -1947
                end
            end
        end,
        ["Null"] = function(_, _, _, p51)
            if p51 then
                local v52 = Random.new():NextInteger(1, 5000000)
                if p51.RNG == 0 then
                    local v53 = p51.RNGDimension
                    if tostring(v53) == "1" and v52 == 1 then
                        return -0.1
                    end
                end
                if p51.Inventory and v52 then
                    for _, v54 in p51.Inventory.Roll do
                        if v54[1] == 0 then
                            local v55 = v54[4]
                            if tostring(v55) == "1" then
                                if v52 == 1 then
                                    return -0.1
                                end
                                return
                            end
                        end
                    end
                end
            end
        end
    },
    ["2"] = {
        ["FreakyCar"] = function(_, _, _, p56)
            if not p56 then
                return
            end
            local v57 = Random.new():NextInteger(1, 80000000)
            if p56.RNG >= 50000000000 and p56.RNG < 100000000000 then
                local v58 = p56.RNGDimension
                if tostring(v58) == "2" and v57 == 1 then
                    print("Freaky car attempt")
                    return -60000
                end
            end
            if p56.Inventory and v57 then
                for _, v59 in p56.Inventory.Roll do
                    if (v59[1] or 1) >= 50000000000 and (v59[1] or 1) < 100000000000 then
                        local v60 = v59[4]
                        if tostring(v60) == "2" then
                            print("Freaky car attempt")
                            if v57 == 1 then
                                return -60000
                            end
                            break
                        end
                    end
                end
            end
        end,
        ["Collapsal"] = function(_, _, _, p61)
            if p61.InterstellarMappingProgress.UnlockStarGate and Random.new():NextInteger(1, 154000000000000) then
                return -154
            end
        end,
        ["Known"] = function(_, _, _, p62)
            local v63 = Random.new():NextInteger(1, 300000)
            if p62.Inventory and v63 == 1 then
                for _, v64 in p62.Inventory.Roll do
                    if v64[1] >= 1000000000 and v64[1] < 5000000000 then
                        return -1001
                    end
                end
            end
        end,
        ["DoNotSleep"] = function(p65, p66, p67, _)
            if p65 == 1 and (p66[p67 - 1][1] > 100000 and p66[p67 + 1][1] > 100000) then
                return -23.59
            end
        end,
        ["Yeah"] = function(_, _, _, p68, p69)
            if p68 then
                if p69:GetAttribute("HasMetMe") and Random.new():NextInteger(1, 1000000) == 1 then
                    return -10000000
                end
            end
        end
    }
}
v_u_1.SpecialSecretMasking = {
    [-7861] = 1,
    [999999999999.99] = 9999999999.99
}
function v_u_1.GetTierFromString(_, p70)
    -- upvalues: (copy) v_u_1
    for v71, v72 in v_u_1.Tiers do
        if v72.Name == p70 then
            return v72, v71
        end
    end
end
function v_u_1.GetTierFromRNG(_, p73, p74)
    -- upvalues: (copy) v_u_1
    local v75 = "Common"
    local v76 = v_u_1.Tiers[3]
    local v77 = 3
    if p74 then
        p73 = p73 * 250
    end
    for v78, v79 in v_u_1.Tiers do
        if v79.Rarity then
            if v79.Rarity > p73 then
                break
            end
            v75 = v79.Name
            v77 = v78
            v76 = v79
        else
            v75 = v79.Name
            v77 = v78
            v76 = v79
        end
    end
    return v75, v76, v77
end
function v_u_1.getSerial(p80, p81, p82, p83, p84, p85)
    local v86, v87, v88 = p80:GetDesignFromRNG(p82, p84)
    local v89 = v87 or v86
    p80:GetDesignFromString(v89, p84)
    local v90 = p80:GetRankValue(p82, 0, p84)
    if p80.Variants[p83] then
        v88 = v88 * p80.Variants[p83].Rarity
        v89 = p80.Variants[p83].Name .. " " .. v89
    end
    if p85 then
        v89 = "HARDCORE_" .. v89
    end
    return v88 < 100000000 and (v90 > -1 and (p83 ~= 60 and (p83 ~= 25 and (p83 ~= 31 and (p83 ~= 30 and (p83 ~= 18 and (p83 ~= 40 and (p83 ~= 41 and (p83 ~= 46 and (p83 ~= 47 and (p83 ~= 51 and (p83 ~= 52 and (p83 ~= 55 and p83 ~= 56))))))))))))) and -1 or p81.Serialize(v89)
end
require(script.Types)
function v_u_1.GetDesignFromRNG(_, p91, p92)
    -- upvalues: (copy) v_u_1
    if p92 then
        p92 = tostring(p92)
    end
    local v93 = p92 or "1"
    local v94 = "Basic"
    local v95 = nil
    for _, v96 in v_u_1.Designs[v93] do
        if v96.Requirement then
            if v96.Requirement > p91 then
                break
            end
            v94 = v96.Name
        else
            v94 = v96.Name
        end
    end
    if tostring(p91):sub(1, 2) ~= "0." and tostring(p91):sub(1, 3) ~= "-0." then
        local v97 = p91 * 100
        p91 = math.floor(v97) / 100
    end
    for _, v98 in v_u_1.SecretDesigns[v93] do
        if p91 == v98.Requirement then
            v95 = v98.Name
            p91 = v98.actualRNG or v98.ConvertedRNG
            break
        end
    end
    return v94, v95, p91
end
function v_u_1.GetDesignFromString(_, p99, p100)
    -- upvalues: (copy) v_u_1
    if p100 then
        p100 = tostring(p100)
    end
    local v101 = p100 or "1"
    for _, v102 in v_u_1.SecretDesigns[v101] do
        if p99 == v102.Name then
            return v102
        end
    end
    for _, v103 in v_u_1.Designs[v101] do
        if p99 == v103.Name then
            return v103
        end
    end
end
local v_u_104 = Random.new()
function v_u_1.generateVariant(_, p105)
    -- upvalues: (copy) v_u_1, (copy) v_u_104
    local v106 = p105 or 0
    local v107 = 0
    for v108, v109 in v_u_1.Variants do
        local v110 = v109.RNG or v109.Rarity
        if v110 >= 1 and v110 > 1 then
            local v111 = v_u_104
            local v112 = v110 / v106
            if v111:NextInteger(1, (math.round(v112))) == 1 then
                v107 = v108
            end
        end
    end
    return v107
end
function v_u_1.getCloverSpecialAttribute(_, p113)
    -- upvalues: (copy) v_u_1, (copy) v_u_104
    for v114, v115 in v_u_1.SpecialCloverAttributes do
        if v_u_104:NextInteger(1, v115.Chance / (p113 or 1)) == 1 then
            return v114
        end
    end
    return nil
end
local v_u_116 = game.ReplicatedStorage:WaitForChild("ItemThumbnails")
local v_u_117 = {}
task.spawn(function()
    -- upvalues: (copy) v_u_116, (copy) v_u_117
    repeat
        task.wait()
    until game:IsLoaded() or not game["Run Service"]:IsRunning()
    for _, v118 in v_u_116:GetChildren() do
        if v118:IsA("ModuleScript") then
            v_u_117[v118.Name] = require(v118)
        end
    end
end)
function v_u_1.GetItemValue(_, p119)
    -- upvalues: (copy) v_u_1, (copy) v_u_117, (copy) v_u_116
    if p119.__ClientCalculatedValue then
        return p119.__ClientCalculatedValue
    end
    local v120 = 0
    local v121 = p119.Name or p119.__ClientIndex
    local v122 = v_u_1.Items[v121]
    if v122 then
        local v123 = nil
        if v_u_117[v121] then
            local v124, v125, v126
            v124, v125, v126, v123 = v_u_117[v121](p119.Attributes)
            _ = v125
            _ = v126
        else
            v_u_116:FindFirstChild(v121)
        end
        if v122.Stackable and p119.Count then
            v120 = v120 - #v_u_1.Tiers
        end
        local _, v127 = v_u_1:GetTierFromString(v122.Tier or "Common")
        local v128 = v120 - v127
        p119.__ClientCalculatedValue = v128
        p119.__Name = v123 or v121
        return v128
    end
end
function v_u_1.getVariantDesignFromString(_, p129)
    -- upvalues: (copy) v_u_1
    for v130, v131 in v_u_1.Variants do
        if v131.Name == p129 then
            return v131, v130
        end
    end
end
function v_u_1.GetCloverType(_, p132, p133, p134, p135)
    local v136 = p135 or Random.new()
    local v137 = p134 or 0
    local v138 = p133 or 1
    for v139, v140 in p132 do
        if v136:NextInteger(1, v140) ~= 1 and v139 > v137 then
            break
        end
        if v137 < v139 then
            v137 = v139 or v137
        end
        v138 = v138 * 20
    end
    return v137, v138
end
function v_u_1.GetVariantChanceFromID(_, p141)
    -- upvalues: (copy) v_u_1
    local v142 = v_u_1.Variants[p141]
    local v143 = v142.StoreChance or v142.Rarity
    return math.max(1, v143)
end
function v_u_1.GetVariant(_, p144, p145, p146)
    -- upvalues: (copy) v_u_1
    local v147 = p146 or Random.new()
    local v148 = p144 or 1
    local v149 = 0
    local v150 = 0
    for v151, v152 in v_u_1.Variants do
        if not v152.ExcludedFromGeneration then
            local v153 = v152.Rarity / v148
            if p145 then
                v153 = v152.StoreChance or v153
            end
            if v153 > 1 and v147:NextInteger(1, (math.round(v153))) == 1 then
                v150 = v152.StoreChance or v152.Rarity
                v149 = v151
            end
        end
    end
    return v149, v150
end
function v_u_1.GetRankValue(_, p154, p155, p156, p157)
    -- upvalues: (copy) v_u_1
    local _, v158 = v_u_1:GetDesignFromRNG(p154, p156)
    if v158 then
        local v159 = v_u_1:GetDesignFromString(v158, p156)
        p154 = v159.actualRNG or v159.ConvertedRNG
    end
    if v_u_1.Variants[p155] then
        p154 = p154 * v_u_1.Variants[p155].Rarity
    end
    if p157 then
        p154 = p154 * 250
    end
    return v158 == "Zenith" and 100000000000 or p154, v158 and true or false
end
return v_u_1