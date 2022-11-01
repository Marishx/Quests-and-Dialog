Config = {}
Config.Presstext = "Press"
Config.Talktext = "Talk with"
Config.NPCTitle = "Local guy"
Config.Debug = false -- true/false Debug Mode
Config.Info = "The position was marked on your map"
Config.Info2 = "Bring back the item to get your reward"
Config.Info3 = "Go to the local guy to get your reward"
Config.Info4 = "Bring back the skin of animal to get your reward"
Config.ShowBlips = true -- Show NPC blips
Config.ItemShow = 1 -- 1: Show Area, 2: Show exact position, 3: None
Config.ItemBlipNameOnMap = "Quest Item"
Config.ItemBlipSprite = 1366733613
Config.ShowBackBlip = 1 -- 1: Show Area, 2: None
Config.DeliveryInfo = "Thanks for your help! Here, is your reward!"
Config.FailureInfo = "Oh no! You've lost my valuable item! I won't pay you!"
Config.ShowCircle = true -- Shows circle on item
Config.MarkAnimal = true -- Marks animal on the map
Config.CircleColor = {0,176,0,150} -- Circle Colors(r,g,b,a)
Config.Cooldown = 20000 -- Cooldown beetwen the missions
Config.StartCount = 20 -- Starting Dialog ID

Config.Quests = {
	[1] = {
		["Type"] = 1,
		["Reward"] = 2,
		["Xp"] = 5,
		["Talk"] = {
				["Desc"] = "I lost my shovel can you find it?",
				["1"] = "Yes of course!",
				["2"] = "Maybe i will think about it",
				["3"] = "No. fuck off"
		},
		["Goal"] = {
				["Name"] = "shovel",
				["Pos"] = vector3(287.8307,55.29713,103.0),
		}
	},
	[2] = {
		["Type"] = 2,
		["Reward"] = 5,
		["Xp"] = 15,
		["Talk"] = {
				["Desc"] = "Please help me! There is a bear nearby!",
				["1"] = "I will kill it!",
				["2"] = "I don't have time right now",
				["3"] = "I don't care"
		},
		["Goal"] = {
				["Name"] = "A_C_Bear_01",
				["Pos"] = vector3(2170.406,127.1389,69.36024),
		}
	},
	[3] = {
		["Type"] = 3,
		["Reward"] = 5,
		["Xp"] = 5,
		["Talk"] = {
				["Desc"] = "I need bear skin, can you bring me it?",
				["1"] = "Yep!",
				["2"] = "Naaah",
				["3"] = "No. fuck off"
		},
		["Goal"] = {
				["Name"] = "A_C_Bear_01",
				["Skin"] = -1124266369,
				["Pos"] = vector3(2170.406,127.1389,69.36024),
		}
	},
	[4] = {
		["Type"] = 1,
		["Reward"] = 4,
		["Xp"] = 5,
		["Talk"] = {
				["Desc"] = "I need ebony boards to build a new house, will you help me?",
				["1"] = "Sure!",
				["2"] = "I don't have time!",
				["3"] = "Bring it yourself!"
		},
		["Goal"] = {
				["Name"] = "planks",
				["Pos"] = vector3(834.1,1098.84,126.0),
		}
	},
	[5] = {
		["Type"] = 1,
		["Reward"] = 6,
		["Xp"] = 5,
		["Talk"] = {
				["Desc"] = "I need corn for my workers to eat, you will help me?",
				["1"] = "Sure, no problem!",
				["2"] = "I have no time",
				["3"] = "Go out on your own!"
		},
		["Goal"] = {
				["Name"] = "corn",
				["Pos"] = vector3(1052.81,-1122.57,67.70),
		}
	},
	[6] = {
		["Type"] = 1,
		["Reward"] = 7,
		["Xp"] = 5,
		["Talk"] = {
				["Desc"] = "I need water for my employees to drink, you will help me?",
				["1"] = "Sure, no problem!",
				["2"] = "I don't have time!",
				["3"] = "No way!"
		},
		["Goal"] = {
				["Name"] = "water",
				["Pos"] = vector3(625.34,2145.95,222.0),
		}
	},
	[7] = {
		["Type"] = 2,
		["Reward"] = 6,
		["Xp"] = 10,
		["Talk"] = {
				["Desc"] = "A wolf is roaming near the city that is threatening the city! You'll kill him for me?",
				["1"] = "Sure, no problem!",
				["2"] = "I have no time",
				["3"] = "No way!"
		},
		["Goal"] = {
				["Name"] = "A_C_Wolf",
				["Pos"] = vector3(-881.09,-725.32,61.45),
		}
	},
	[8] = {
		["Type"] = 3,
		["Reward"] = 8,
		["Xp"] = 10,
		["Talk"] = {
				["Desc"] = "A bull is hanging out near town, I need its skin! You bring her to me?",
				["1"] = "Sure, no problem!",
				["2"] = "I don't have time for this",
				["3"] = "No!"
		},
		["Goal"] = {
				["Name"] = "A_C_Bull_01",
				["Pos"] = vector3(2118.8,380.59,80.71),
		}
	},
	[9] = {
		["Type"] = 2,
		["Reward"] = 6,
		["Xp"] = 8,
		["Talk"] = {
				["Desc"] = "Near the city there is a puma that threatens the city! You'll kill her for me?",
				["1"] = "Yes, of course!",
				["2"] = "I will think about it",
				["3"] = "Never!"
		},
		["Goal"] = {
				["Name"] = "A_C_Cougar_01",
				["Pos"] = vector3(1658.68,1313.82,146.86),
		}
	}
}

Config.Npc = {
	[1] = {
		["Name"] = "Bobby",
		["Model"] = "A_M_M_BTCObeseMen_01",
		["Pos"] = vector3(1274.909,-1281.05,-974.5),
		["Heading"] = 0.0,
		["Blip"] = -1816664083,
		["Missions"] = {1, 2}
	},
	[2] = {
		["Name"] = "Jack",
		["Model"] = "A_M_M_BtcHillbilly_01",
		["Pos"] = vector3(1278.115,-1269.57,-974.2),
		["Heading"] = 180.0,
		["Blip"] = -1816664083,
		["Missions"] = {3}
	},
	[3] = {
		["Name"] = "Billy",
		["Model"] = "A_M_M_BtcHillbilly_01",
		["Pos"] = vector3(-363.77,721.56,115.4),
		["Heading"] = 0.0,
		["Blip"] = 133359852,
		["Missions"] = {4, 6, 8}
	},
	[4] = {
		["Name"] = "Mark",
		["Model"] = "A_M_M_BTCObeseMen_01",
		["Pos"] = vector3(-238.68,694.43,112.4),
		["Heading"] = 332.82,
		["Blip"] = -1633216922,
		["Missions"] = {5, 7, 9}
	},
}
