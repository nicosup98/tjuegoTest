local ClassCreate = require('ClassCreate')
local Player = ClassCreate:derive('Player')
local Assets = require('Assets')
--[[
       player={
            asset = {
                    assetName={
                        url = string
                        width= number
                        heigth = number
                    },
                        ...
            },
        ...
        }
    ]]
function Player:new(player)
    self.players = {}
   for k, v in pairs(player) do
        self.players[k] = {}
        print(k)
        for k2 in pairs(v) do
            print(k2,v.asset.idle.url)
            self.players[k].asset={}
            for k3, v3 in pairs(v.asset) do
                print(k3,v3.width)
            self.players[k].asset[k3]= Assets(v3)
            end
        end
        -- self.players[k]
   end
   for key in pairs(self.players.j1.asset) do
       print(key)
   end
end

function Player:update(dt)
    -- for _, value in pairs(self.players) do
    --     for _, value2 in pairs(value.asset) do
    --         value2.assetCharged:animate(dt)
    --     end
    -- end
    if love.keyboard.isDown('right') then
        self.players.j1.asset.run.assetCharged:animate(dt)
    else
        self.players.j1.asset.idle.assetCharged:animate(dt)
    end
end

function Player:draw()
    -- for _, value in pairs(self.players) do
    --     for _, value2 in pairs(value.asset) do
    --         value2:draw()
    --     end
    -- end
    if love.keyboard.isDown('right') then
        self.players.j1.asset.run:draw()
    else
        self.players.j1.asset.idle:draw()
    end
end

return Player