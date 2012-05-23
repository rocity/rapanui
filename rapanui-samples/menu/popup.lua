--[[
--
-- RapaNui
--
-- by Ymobe ltd  (http://ymobe.co.uk)
--
-- LICENSE:
--
-- RapaNui uses the Common Public Attribution License Version 1.0 (CPAL) http://www.opensource.org/licenses/cpal_1.0.
-- CPAL is an Open Source Initiative approved
-- license based on the Mozilla Public License, with the added requirement that you attribute
-- Moai (http://getmoai.com/) and RapaNui in the credits of your program.
]]


popup = { isTransitioning = false }

local trn = RNTransition:new()


function popup.onShow()
    local background = RNFactory.createImage("images/background-blue.png", { parentGroup = sceneGroup }); background.x = 160; background.y = 720;

    trn:run(background, { type = "move", time = 1000, y = 440, onComplete = showThings })

    popup.group = {}
    popup.group[1] = background
    popup.isTransitioning = true
end

function showThings()
    local text1 = RNFactory.createText("Hey there,\n I'm a popup!", { size = 10, top = 200, left = 5, width = 200, height = 500 })
    popup.group[2] = text1
    popup.isTransitioning = false
end

function removeThings()
    popup.group[1]:remove()
    popup.isTransitioning = false
end


function popup.onHide()
    popup.group[2]:remove()
    trn:run(popup.group[1], { type = "move", time = 1000, y = 720, onComplete = removeThings })
    popup.isTransitioning = true
end



return popup