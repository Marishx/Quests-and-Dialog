function CreateDialog (id, title, subtitle, options)
    local self = {}

    self.id = id
    self.title = title
    self.subtitle = subtitle
    self.options = {}

        for k,v in pairs(options) do
            self.options[k] = v
        end

    local rTable = {}

    rTable.getId = function()
		return self.id
    end

    rTable.getTitle = function()
		return self.title
    end

    rTable.getSubtitle = function()
		return self.subtitle
    end
    
    rTable.getOptions = function()
		return self.options
    end
    
    return rTable
end