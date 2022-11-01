Config = {}
Config.webhook = 'https://discord.com/api/webhooks/891898649804685342/PYXMdKbhxBBsAOqP15bitSydxvRgJH1ue5uMu6_KjMlc2fonqR9B84YBZGV2a9bzstjv'
Config.Presstext = "Press"
Config.Talktext = "Talk with"
Config.NPCTitle = "I have a Job"
Config.Debug = false -- true/false Debug Mode
Config.Info = "I have marked a position on your map."
Config.Info2 = "Bring back the item(s) to claim your reward."
Config.Info3 = "Return to get your reward."
Config.Info4 = "Bring back the animals skin as proof to get your reward"
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
Config.Cooldown = 5000 -- Cooldown beetwen the missions
Config.StartCount = 20 -- Starting Dialog ID

--[[
	Quest types
	1 - Item (retrieve item from location)
	2 - Kill (kill thing that was spawned, you can keep items/skin)
	3 - Skill (kill thing that was spawned and retrieve and return skin)
	4 - transport tie in
	5 - Raid t1
	6 - Raid t2
	7 - Raid t3
	8 - post
]]

Config.Quests = {
	[1] = {
		["Type"] = 1,
		["Reward"] = math.random(7,12),
		["Xp"] = math.random(7,12),
		["Talk"] = {
			["Desc"] = "I lost my shovel can you find it?",
			["1"] = "Yes of course!",
			["2"] = "Maybe i will think about it",
			["3"] = "No. fuck off"
		},
		["Goal"] = {
			["Name"] = "kit_shovel",
			["Pos"] = vector3(1122.97,-194.33,95.68), --betweeen house and dewberry creek above E in word LEYMONE
		}
	},
	[2] = {
		["Type"] = 2,
		["Reward"] = math.random(10,15),
		["Xp"] = math.random(10,15),
		["Talk"] = {
			["Desc"] = "Please help me! There is a bear nearby!",
			["1"] = "I will kill it!",
			["2"] = "I don't have time right now",
			["3"] = "I don't care"
		},
		["Goal"] = {
			["Name"] = "A_C_Bear_01",
			["Pos"] = vector3(2170.406,127.1389,69.36024), --along Kamassa Water
		}
	},
	[3] = {
		["Type"] = 3,
		["Reward"] = math.random(12,15),
		["Xp"] = math.random(12,15),
		["Talk"] = {
			["Desc"] = "I need bear skin, can you bring me it?",
			["1"] = "Yep!",
			["2"] = "Naaah",
			["3"] = "No. fuck off"
		},
		["Goal"] = {
			["Name"] = "A_C_Bear_01",
			["Skin"] = -1124266369,
			["Pos"] = vector3(2170.406,127.1389,69.36024), --along Kamassa Water
		}
	},
	[4] = {
		["Type"] = 1,
		["Reward"] = math.random(7,10),
		["Xp"] = math.random(7,10),
		["Talk"] = {
			["Desc"] = "I need some wooden logs to build a new house, will you help me?",
			["1"] = "Sure!",
			["2"] = "I don't have time!",
			["3"] = "Bring it yourself!"
		},
		["Goal"] = {
			["Name"] = "provision_wood",
			["Pos"] = vector3(-1395.23,-226.63,99.59), -- Logging camp near strawberry
		}
	},
	[5] = {
		["Type"] = 1,
		["Reward"] = math.random(6,8),
		["Xp"] = math.random(6,8),
		["Talk"] = {
			["Desc"] = "I need corn for my chickens to eat, but I cant leave the farm. Will you will help me?",
			["1"] = "Sure, no problem!",
			["2"] = "I have no time",
			["3"] = "Go out on your own!"
		},
		["Goal"] = {
			["Name"] = "consumable_corn",
			["Pos"] = vector3(1052.24,-1123.7,67.70), --barn near southfield flats just north of rhodes
		}
	},
	[6] = {
		["Type"] = 1,
		["Reward"] = math.random(7,10),
		["Xp"] = math.random(7,10),
		["Talk"] = {
			["Desc"] = "I need water for my employees to drink, you will help me?",
			["1"] = "Sure, no problem!",
			["2"] = "I don't have time!",
			["3"] = "No way!"
		},
		["Goal"] = {
			["Name"] = "consumable_water",
			["Pos"] = vector3(625.34,2145.95,222.0), --between Calumet Ravine and Donner Falls above Bacchus Station
		}
	},
	[62] = {
		["Type"] = 1,
		["Reward"] = math.random(3,5),
		["Xp"] = math.random(3,5),
		["Talk"] = {
			["Desc"] = "I need water for my employees to drink, you will help me?",
			["1"] = "Sure, no problem!",
			["2"] = "I don't have time!",
			["3"] = "No way!"
		},
		["Goal"] = {
			["Name"] = "consumable_water",
			["Pos"] = vector3(625.34,2145.95,222.0), --between Calumet Ravine and Donner Falls above Bacchus Station
		}
	},
	[7] = {
		["Type"] = 2,
		["Reward"] = math.random(7,10),
		["Xp"] = math.random(7,10),
		["Talk"] = {
			["Desc"] = "A wolf is roaming near the city that is threatening people! You'll kill him for me?",
			["1"] = "Sure, no problem!",
			["2"] = "I have no time",
			["3"] = "No way!"
		},
		["Goal"] = {
			["Name"] = "A_C_Wolf",
			["Pos"] = vector3(-881.09,-725.32,61.45), --little abandoned house near bards crossing (train bridge)
		}
	},
	[8] = {
		["Type"] = 3,
		["Reward"] = math.random(12,15),
		["Xp"] = math.random(12,15),
		["Talk"] = {
			["Desc"] = "A bull is hanging out near town, I need its skin! You bring her to me?",
			["1"] = "Sure, no problem!",
			["2"] = "I don't have time for this",
			["3"] = "No!"
		},
		["Goal"] = {
			["Name"] = "A_C_Bull_01",
			["Skin"] = 85379810,
			["Pos"] = vector3(2118.8,380.59,80.71), --near Kamassa River just east of emerald ranch
		}
	},
	[9] = {
		["Type"] = 2,
		["Reward"] = math.random(7,10),
		["Xp"] = math.random(7,10),
		["Talk"] = {
				["Desc"] = "Near the city there is a puma that threatens the city! You'll kill her for me?",
				["1"] = "Yes, of course!",
				["2"] = "I will think about it",
				["3"] = "Never!"
		},
		["Goal"] = {
			["Name"] = "A_C_Cougar_01",
			["Pos"] = vector3(1658.68,1313.82,146.86), --Lake O'Creagh's Run
		}
	},
	[101] = {
		["Type"] = 1,
		["Reward"] = math.random(2,5),
		["Xp"] = math.random(2,5),
		["Talk"] = {
			["Desc"] = "Psst. Hey you there.. Wanna help me? I have something I burried but I need you to get it.",
			["1"] = "Sure, why the hell not.",
			["2"] = "Let me think about it..",
			["3"] = "No thanks, not interested!"
		},
		["Goal"] = {
			["Name"] = "provision_trinket_futuristic",
			["Pos"] = vector3(2310.6,-977.58,40.72),
		}
	},
	-- Quests for on Prison island but outside of the prison
		[200] = {
			["Type"] = 1,
			["Reward"] = math.random(1,4),
			["Xp"] = math.random(1,4),
			["Talk"] = {
				["Desc"] = "I'm thirsty, can you get me some water?",
				["1"] = "Yes sir!.",
				["2"] = "Let me think about it..",
				["3"] = "Get it yourself!"
			},
			["Goal"] = {
				["Name"] = "consumable_water",
				["Pos"] = vector3(3181.51,-464.81,40.58),
			}
		},
		[201] = {
			["Type"] = 1,
			["Reward"] = math.random(1,4),
			["Xp"] = math.random(1,4),
			["Talk"] = {
				["Desc"] = "I was given filthy water, go get me some clean water from the docks!",
				["1"] = "Yes sir!.",
				["2"] = "Let me think about it..",
				["3"] = "Get it yourself!"
			},
			["Goal"] = {
				["Name"] = "consumable_water",
				["Pos"] = vector3(3279.58,-709.37,42.4),
			}
		},
		[202] = {
			["Type"] = 2,
			["Reward"] = math.random(1,4),
			["Xp"] = math.random(1,4),
			["Talk"] = {
				["Desc"] = "A prisoner is trying to escape! Go knock them out for the Guard!",
				["1"] = "Yes sir!.",
				["2"] = "As if! No Way!",
				["3"] = "No, let them be free!"
			},
			["Goal"] = {
				["Name"] = "A_M_M_SkpPrisoner_01",
				["Pos"] = vector3(3181.36,-373.61,42.09),
			}
		},
	-- Quests for Gov Moogle
		[300] = {
			["Type"] = 1,
			["Reward"] = math.random(2,5),
			["Xp"] = math.random(2,5),
			["Talk"] = {
				["Desc"] = "I forgot my present for my mistress at ''Rhodes Parlour House''. Can you please retrieve it?",
				["1"] = "Not a problem!",
				["2"] = "Get it yourself.",
				["3"] = "Sorry, I'm too busy."
			},
			["Goal"] = {
				["Name"] = "provision_necklace_mooglequest",
				["Pos"] = vector3(1331.62,-1376.54,79.51),
			}
		},
		[301] = {
			["Type"] = 3,
			["Reward"] = math.random(8,13),
			["Xp"] = math.random(8,13),
			["Talk"] = {
				["Desc"] = "My family was attacked when we went on a recent trip. Please track down and kill the wild beast and bring back it's hide.",
				["1"] = "I'm on it!",
				["2"] = "Surely you have guards for this?",
				["3"] = "I don't have the weapons for this."
			},
			["Goal"] = {
				["Name"] = "A_C_BearBlack_01",
				["Pos"] = vector3(1127.43,699.61,89.24),
			}
		},
		[302] = {
			["Type"] = 1,
			["Reward"] = math.random(2,5),
			["Xp"] = math.random(2,5),
			["Talk"] = {
				["Desc"] = "I'm waiting for a delivery, but I haven't eaten today, I really like Garlic Bread, can you fetch some for me please?",
				["1"] = "Sure, won't take me long.",
				["2"] = "It won't take you that long.",
				["3"] = "I'm too busy."
			},
			["Goal"] = {
				["Name"] = "consumable_garlic_bread",
				["Pos"] = vector3(1342.52,-1375.03,80.48),
			}
		},
	-- Quests for Tobias/Maniac
		[400] = {
			["Type"] = 1,
			["Reward"] = math.random(2,5),
			["Xp"] = math.random(2,5),
			["Talk"] = {
				["Desc"] = "I'm starving! I heard there's a wedding at the fancy mansion, can you steal an apple for me?",
				["1"] = "Sounds risky, but gotta help a kid out.",
				["2"] = "Steal it yourself",
				["3"] = "I'm too busy."
			},
			["Goal"] = {
				["Name"] = "consumable_apple",
				["Pos"] = vector3(2375.38,-1075.27,45.45),
			}
		},	
		[401] = {
			["Type"] = 1,
			["Reward"] = math.random(2,5),
			["Xp"] = math.random(2,5),
			["Talk"] = {
				["Desc"] = "I need a drink too, there is a little cafe out of the way with little security, can you get me a drink please?",
				["1"] = "Eerr, yea, okay.",
				["2"] = "Just drink water from the lake.",
				["3"] = "I'm too busy."
			},
			["Goal"] = {
				["Name"] = "consumable_water",
				["Pos"] = vector3(2584.51,-1007.83,43.23),
			}
		},
	-- Quests for Sarah
		[500] = {
			["Type"] = 1,
			["Reward"] = math.random(8,11),
			["Xp"] = math.random(8,11),
			["Talk"] = {
				["Desc"] = "I need some items for a ritual, but I can't leave otherwise the ghosts will destroy what I have prepared so far. Can you please get me a doll from a friend.",
				["1"] = "Weird, but okay.",
				["2"] = "Sounds crazy, no way.",
				["3"] = "I'm too busy."
			},
			["Goal"] = {
				["Name"] = "provision_toy_doll",
				["Pos"] = vector3(3023.19, 565.36, 43.76),
			}
		},	
		[501] = {
			["Type"] = 3,
			["Reward"] = math.random(9,13),
			["Xp"] = math.random(9,13),
			["Talk"] = {
				["Desc"] = "I need some items for a ritual, but I can't leave otherwise the ghosts will destroy what I have prepared so far. Can you please get me some hide",
				["1"] = "Sure!",
				["2"] = "I don't have weapons or tools to get hides.",
				["3"] = "I'm too busy."
			},
			["Goal"] = {
				["Name"] = "A_C_Panther_01",
				["Pos"] = vector3(2022.21, 619.15, 156.45),
			}
		},
		[502] = {
			["Type"] = 1,
			["Reward"] = math.random(8,12),
			["Xp"] = math.random(8,12),
			["Talk"] = {
				["Desc"] = "I need some items for a ritual, but I can't leave otherwise the ghosts will destroy what I have prepared so far. Can you please get me some human remains, sshhh don't tell anyone",
				["1"] = "Suss, but I'll do it!",
				["2"] = "Sounds crazy, no way.",
				["3"] = "I'm too busy."
			},
			["Goal"] = {
				["Name"] = "provision_human_skull",
				["Pos"] = vector3(-609.99, 525.54, 93.67),
			}
		},
	-- Quests for near Tumbleweed and Armadillo
		[1000] = {
			["Type"] = 1,
			["Reward"] = math.random(4,6),
			["Xp"] = math.random(4,6),
			["Talk"] = {
				["Desc"] = "I need some fresh water for me and my crew, please fetch some.",
				["1"] = "No worries, will do!",
				["2"] = "No, it's too far.",
				["3"] = "Get it yourself."
			},
			["Goal"] = {
				["Name"] = "consumable_water",
				["Pos"] = vector3(-3262.41,-3152.97,-10.21),
			}
		},
		[1001] = {
			["Type"] = 2,
			["Reward"] = math.random(7,10),
			["Xp"] = math.random(7,10),
			["Talk"] = {
				["Desc"] = "There is a cougar threatening Tumbleweed, go and kill it.",
				["1"] = "Yes sir!",
				["2"] = "As if! No Way!",
				["3"] = "Let them deal with it, I'm too busy."
			},
			["Goal"] = {
				["Name"] = "A_C_Cougar_03",
				["Pos"] = vector3(-5430.46,-2522.66,-2.09),
			}
		},
		[1002] = {
			["Type"] = 1,
			["Reward"] = math.random(7,10),
			["Xp"] = math.random(7,10),
			["Talk"] = {
				["Desc"] = "We cleaned out a bandit camp, but I left my Tobacco Pipe behind, fetch for me will you?",
				["1"] = "No worries!",
				["2"] = "Get it yourself!",
				["3"] = "I'm too busy."
			},
			["Goal"] = {
				["Name"] = "kit_tobacco_pipe",
				["Pos"] = vector3(-2727.01,-2377.28,45.11),
			}
		},
	-- Transport job
	[1003] = {
		["Type"] = 4,
		["Reward"] = math.random(7,10),
		["Xp"] = math.random(7,10),
		["Talk"] = {
			["Desc"] = "I got this here shipment, and some folks in desperate need. Can i count on you to deliver?",
			["1"] = "I got this!",
			["2"] = "Fuck that, fuck you and fuck those guys!",
			["3"] = "I'v.. gotta shampoo my hair? Maybe later."
		},
		["Goal"] = {
			["Name"] = "consumable_garlic_bread",
			["Pos"] = vector3(2787.96,-1320.42,45.34),
		}
	},
	-- Raids in the future
	[1004] = {
		["Type"] = 5,
		["Reward"] = 1,
		["Xp"] = math.random(7,10),
		["Talk"] = {
			["Desc"] = "Feds got themselves a tanker full of moonshine, feeling up to it? Small contingent of badges, nothing serious.",
			["1"] = "Good as done, this wont take long.",
			["2"] = "If it werent serious, youd have it already, Piss off",
			["3"] = "Messing with the marshall's aint my idea of a good time. Pass"
		},
		["Goal"] = {
			["Name"] = "consumable_garlic_bread",
			["Pos"] = vector3(2787.96,-1320.42,45.34),
		}
	},
	[1005] = {
		["Type"] = 6,
		["Reward"] = 2,
		["Xp"] = math.random(7,10),
		["Talk"] = {
			["Desc"] = "Feds got themselves a tanker full of moonshine and are prepping to move it. decent number of them and some heavy protection, feeling game?",
			["1"] = "They aint got shit on us, lets do this.",
			["2"] = "Heavy protection is code for early grave, you trying to get me killed? Get lost.",
			["3"] = "Messing with the marshall's aint my idea of a good time. Pass"
		},
		["Goal"] = {
			["Name"] = "consumable_garlic_bread",
			["Pos"] = vector3(2787.96,-1320.42,45.34),
		}
	},
	[1006] = {
		["Type"] = 7,
		["Reward"] = 3,
		["Xp"] = math.random(7,10),
		["Talk"] = {
			["Desc"] = "Feds got themselves a tanker full of moonshine and aint fuckn about. This might be a little too risky even for your blood.",
			["1"] = "Risk means reward, where are they, ima put the fear of god into them.",
			["2"] = "Get stuffed. Too risky for my blood? You WANT me to go for it. Nice try, but no.",
			["3"] = "Messing with the marshall's aint my idea of a good time. Pass"
		},
		["Goal"] = {
			["Name"] = "consumable_garlic_bread",
			["Pos"] = vector3(2787.96,-1320.42,45.34),
		}
	},
	--Postal jobs
	[1007] = {
		["Type"] = 8,
		["Reward"] = 3,
		["Xp"] = math.random(7,10),
		["Talk"] = {
			["Desc"] = "Well hello there! Want to earn some coin? i'v got these here letters that need to go out.",
			["1"] = "Sure, sounds easy.",
			["2"] = "Do i look like a mailman to you?",
			["3"] = "Nah, sorry."
		},
		["Goal"] = {
			["Name"] = "consumable_garlic_bread",
			["Pos"] = vector3(2787.96,-1320.42,45.34),
		}
	},
	--Auctioneer
	[1008] = {
		["Type"] = 9,
		["Reward"] = 3,
		["Xp"] = math.random(7,10),
		["Talk"] = {
			["Desc"] = "Hello there! Step up and buy something! Or better yet, Sell something!",
			["1"] = "I'd like to sell something.",
			["2"] = "I'm here to buy!",
			["3"] = "Nah, but has anything sold?"
		},
		["Goal"] = {
			["Name"] = "consumable_garlic_bread",
			["Pos"] = vector3(2787.96,-1320.42,45.34),
		}
	},
	[1009] = {
		["Type"] = 10,
		["Reward"] = 3,
		["Xp"] = math.random(7,10),
		["Talk"] = {
			["Desc"] = "Happy Holidays! Are you here to hand in your candycanes?",
			["1"] = "Sure am! Here ya go",
			["2"] = "Oh.. No, i was just seeing what you wanted",
			["3"] = "Nah, i ate em"
		},
		["Goal"] = {
			["Name"] = "consumable_garlic_bread",
			["Pos"] = vector3(2787.96,-1320.42,45.34),
		}
	},
}

Config.Npc = {
	[2] = {
		["Name"] = "Lt. Mudcrab",
		["Model"] = "S_M_M_CornwallGuard_01",
		["Pos"] = vector3(3338.87,-637.3,43.06), -- Just outside jail on island near st denis
		["Heading"] = 4.443,
		["Blip"] = -1906191545,
		["Missions"] = {200, 201, 202}
	},
	[3] = {
		["Name"] = "Gov. Moogle",
		["Model"] = "A_M_M_GaMHighSociety_01",
		["Pos"] = vector3(2530.51,-1202.28,52.68), -- St Denis
		["Heading"] = 266.65,
		["Blip"] = -1906191545,
		["Missions"] = {300, 301, 302}
	},
	[4] = {
		["Name"] = "Tobias",
		["Model"] = "CS_SDStreetKidThief",
		["Pos"] = vector3(2777.65,-1237.34,47.43), -- St Denis
		["Heading"] = 141.211,
		["Blip"] = -1906191545,
		["Missions"] = {400, 401}
	},
	[5] = {
		["Name"] = "Sarah",
		["Model"] = "U_F_Y_CzPHomesteadDaughter_01",
		["Pos"] = vector3(2739.01,-1084.92,46.15), -- St Denis, Graveyard
		["Heading"] = 97.69,
		["Blip"] = -1906191545,
		["Missions"] = {500, 501, 502}
	},
	[6] = {
		["Name"] = "Billy",
		["Model"] = "A_M_M_BTCObeseMen_01",
		["Pos"] = vector3(-363.77,721.56,115.4), -- Valentine
		["Heading"] = 0.0,
		["Blip"] = -1906191545,
		["Missions"] = {1, 3, 4, 6, 7}
	},
	[7] = {
		["Name"] = "Nathan",
		["Model"] = "A_M_M_BtcHillbilly_01",
		["Pos"] = vector3(-238.68,694.43,112.4), -- Valentine
		["Heading"] = 332.82,
		["Blip"] = -1906191545,
		["Missions"] = {1, 2, 4, 5, 6, 9}
	},
	[8] = {
		["Name"] = "Gen. Sanderson",
		["Model"] = "U_M_O_CMRCIVILWARCOMMANDO_01",
		["Pos"] = vector3(336.44,1506.15,180.87), -- Fort Wallace
		["Heading"] = 209.31,
		["Blip"] = 1181380553,
		["Missions"] = {3, 5, 62, 8, 9}
	},
	[9] = {
		["Name"] = "Capt. Snacks",
		["Model"] = "CS_dutch",
		["Pos"] = vector3(-1163.47,-1940.7,41.35), -- Quaker's Cove south of Blackwater
		["Heading"] = 130.64,
		["Blip"] = -1906191545,
		["Missions"] = {4, 7}
	},
	[10] = {
		["Name"] = "Gen. Deveraux",
		["Model"] = "G_M_O_UniExConfeds_01",
		["Pos"] = vector3(-4185.72,-3464.48,36.28), -- Fort Mercer between Tumbleweed and Armadillo
		["Heading"] = 52.5,
		["Blip"] = 1181380553,
		["Missions"] = {1000, 1001, 1002}
	},
	[11] = {
		["Name"] = "Hurley Durley",
		["Model"] = "A_M_M_BTCObeseMen_01",
		["Pos"] = vector3(-344.27,796.71,115.25), -- Should be at valentine, transport pickup location
		["Heading"] = 102.57,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[12] = {
		["Name"] = "Chester Mcrawfish",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(-1747.37,-408.59,154.5), -- Should be at valentine, transport pickup location
		["Heading"] = 337.7,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[13] = {
		["Name"] = "Logistics Officer",
		["Model"] = "S_M_Y_Army_01",
		["Pos"] = vector3(352.3,1466.25,178.5), -- Should be at valentine, transport pickup location
		["Heading"] = 337.7,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[14] = {
		["Name"] = "Woody McArthur",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(2945.8,1371.86,42.8), -- Should be at valentine, transport pickup location
		["Heading"] = 153.5,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[15] = {
		["Name"] = "Charles Staunch",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(2977.66,579.74,43.7), -- Should be at valentine, transport pickup location
		["Heading"] = 339.7,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[16] = {
		["Name"] = "Richard Knuck",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(467.79,703.19,115.25), -- Should be at valentine, transport pickup location
		["Heading"] = 101.5,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[17] = {
		["Name"] = "Howard Ekart",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(2338.67,-1456.59,45), -- Should be at valentine, transport pickup location
		["Heading"] = 288.57,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[18] = {
		["Name"] = "Leonard Morris",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(1403.41,-1303.08,76.75), -- Should be at valentine, transport pickup location
		["Heading"] = 124.3,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[19] = {
		["Name"] = "Prichard Mekkis",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(1405.8,264.45,88.65), -- Should be at valentine, transport pickup location
		["Heading"] = 205.5,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[20] = {
		["Name"] = "Foreman",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(-857.16,-1273.94,42.54), -- Should be at valentine, transport pickup location
		["Heading"] = 0.7,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[21] = {
		["Name"] = "Crunch",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(-1422.6,-2326.57,42), -- Should be at valentine, transport pickup location
		["Heading"] = 20.20,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[22] = {
		["Name"] = "Art McFarlane",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(-2396.43,-2387.67,60.14), -- Should be at valentine, transport pickup location
		["Heading"] = 162.1,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[23] = {
		["Name"] = "Marvin Amarth",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(-3693.08,-2564.46,-14.69), -- Should be at valentine, transport pickup location
		["Heading"] = 169.2,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[24] = {
		["Name"] = "Foreman Officer",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(-4202.7,-3441.41,35.96), -- Should be at valentine, transport pickup location
		["Heading"] = 317.8,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[25] = {
		["Name"] = "Hector Martinez",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(-5538.75,-2954.91,-1.92), -- Should be at valentine, transport pickup location
		["Heading"] = 97.8,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[26] = {
		["Name"] = "Alenzo Estavez",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(-5966.6,-3255.28,-22.32), -- Should be at valentine, transport pickup location
		["Heading"] = 133.4,
		["Blip"] = 1612913921,
		["Missions"] = {1003}
	},
	[27] = {
		["Name"] = "Clan affiliate",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(2939.38,568.56,43.26), -- Van Horn raid start
		["Heading"] = 39.5,
		["Blip"] = -774688241,
		["Missions"] = {1006}
	},
	[28] = {
		["Name"] = "Clan affiliate",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(-1403.06,-2317.41,42.11),-- Thieves landing
		["Heading"] = 88.01,
		["Blip"] = -774688241,
		["Missions"] = {1004}
	},
	[29] = {
		["Name"] = "Clan affiliate",
		["Model"] = "A_M_M_BiVWorker_01",
		["Pos"] = vector3(1438.52,272.54,88.8), --Emerald
		["Heading"] = 61.07,
		["Blip"] = -774688241,
		["Missions"] = {1005}
	},
	[29] = {
		["Name"] = "Post Master Ramsey",
		["Model"] = "S_M_M_TrainStationWorker_01",
		["Pos"] = vector3(-175.23,631.92,113.08), --Emerald
		["Heading"] = 327.69,
		["Blip"] = 1475382911,
		["Missions"] = {1007}
	},
	[30] = {
		["Name"] = "Post Master Viktor",
		["Model"] = "S_M_M_TrainStationWorker_01",
		["Pos"] = vector3(-874.91,-1327.07,42.96), --Emerald
		["Heading"] = 176.48,
		["Blip"] = 1475382911,
		["Missions"] = {1007}
	},
	[31] = {
		["Name"] = "Post Master Wilson",
		["Model"] = "S_M_M_TrainStationWorker_01",
		["Pos"] = vector3(-3729.22,-2601.31,-13.94), --Emerald
		["Heading"] = 186.48,
		["Blip"] = 1475382911,
		["Missions"] = {1007}
	},
	[32] = {
		["Name"] = "Post Master Burchson",
		["Model"] = "S_M_M_TrainStationWorker_01",
		["Pos"] = vector3(2748.72,-1398.23,45.18), --Emerald
		["Heading"] = 207.01,
		["Blip"] = 1475382911,
		["Missions"] = {1007}
	},
	[33] = {
		["Name"] = "Auctioneer Oboe",
		["Model"] = "RCSP_MRMAYOR_MALES_01",
		["Pos"] = vector3(2653.53,-1450.42,46.74), --Emerald
		["Heading"] = 275.61,
		["Blip"] = 1420154945,
		["Missions"] = {1008}
	},
	[34] = {
		["Name"] = "Mrs Clause",
		["Model"] = "CS_creepyoldlady",
		["Pos"] = vector3(-1344.78,2404.83,307.06), --Emerald
		["Heading"] = 338.96,
		["Blip"] = 1420154945,
		["Missions"] = {1009}
	},
}