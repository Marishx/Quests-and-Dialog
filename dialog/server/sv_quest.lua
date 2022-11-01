if Config.ExampleQuest then

    TriggerEvent("dialog:createDialog", 2, "Bobby Train", "Hey! I've lost my horse, can you help me?",
        {
            {name = "Yes, sure! I will find it for you", func = function(source) TriggerEvent('dialog:openDialog', 3 , source) end},
            {name = "Don't be sad! I'll give u 5$", func = function(source) TriggerEvent('dialog:openDialog', 6 , source) end},
            {name = "Let me think about it", func = function(source) TriggerEvent('dialog:openDialog', 2 , source) end},
            {name = "You need pay for my help!", func = function(source) TriggerEvent('dialog:openDialog', 5 , source) end},
            {name = "Fuck off!", func = function(source) TriggerEvent('dialog:openDialog', 4 , source) end},
            {name = "I can't help you!", func = function(source) TriggerEvent('dialog:openDialog', 4 , source) end},
            {name = "Don't waste my time!", func = function(source) TriggerEvent('dialog:openDialog', 4 , source) end},
        }
    )
    
    TriggerEvent("dialog:createDialog", 3, "Bobby Train", "What you need to know?",
        {
            {name = "What is the color of your horse?", func = function(source) TriggerEvent('dialog:openDialog', 7 , source) end},
            {name = "How you'r horse looks like?",  func = function(source) TriggerEvent('dialog:openDialog', 7 , source) end},
            {name = "What is you'r horse breed?",func = function(source) TriggerEvent('dialog:openDialog', 8 , source) end},
        }
    )
    
    TriggerEvent("dialog:createDialog", 4, "Bobby Train", "Sorry i don't want to interrupt you.",
        {
            {name = "Bye.", func = function() end, focusOFF = true},
            {name = "Fuck you!",  func = function() end, focusOFF = true}
        }
    )
    
    TriggerEvent("dialog:createDialog", 5, "Bobby Train", "Are you kidding me!? I don't have money anymore.",
        {
            {name = "Bye.", func = function() end, focusOFF = true},
            {name = "Fuck you!",  func = function() end, focusOFF = true}
        }
    )
    
    TriggerEvent("dialog:createDialog", 6, "Bobby Train", "Thanks but i think 5$ it's not enough for a new horse.",
        {
            {name = "Happens.", func = function() end, focusOFF = true},
            {name = "I don't care!",  func = function() end, focusOFF = true},
            {name = "Ok. I'll give you 10$ and fuck off...",  func = function(source) RemoveMoney(source) end, focusOFF = true}
        }
    )
    
    TriggerEvent("dialog:createDialog", 7, "Bobby Train", "My horse? It's ummm.. Red?.",
        {
            {name = "Oh ok. Where you have seen it last time?", func = function(source) TriggerEvent('dialog:openDialog', 9 , source) end},
            {name = "Ok. Fuck off.",  func = function() end, focusOFF = true}
        }
    )
    
    TriggerEvent("dialog:createDialog", 8, "Bobby Train", "My horse breed? I don't remember.",
        {
            {name = "Oh ok. So how i can help you, if you don't even know what is your horse breed?!", func = function() end, focusOFF = true},
            {name = "Ok. Fuck off.",  func = function() end, focusOFF = true}
        }
    )
    
    TriggerEvent("dialog:createDialog", 9, "Bobby Train", "Last time i seen it on Heartland Overflow.",
        {
            {name = "Ok. Just wait here, i will find it!", func = function() end, focusOFF = true},
            {name = "Ok. Fuck off.",  func = function() end, focusOFF = true}
        }
    )
    
    function RemoveMoney(source)
        TriggerEvent('vorp_core:getPlayerFromId', source, function(user)
            user.removeMoney(10)
        end)
    end
    
    end