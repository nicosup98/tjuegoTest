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
        self.players[k] = {
            asset={}
        }
        print(k)
        for k2 in pairs(v) do
            print(k2,v.asset.idle.url)
            for k3, v3 in pairs(v.asset) do
                print(k3,v3.width)
            self.players[k].asset[k3]= Assets(v3)
            end
        end
   end
end

function Player:update(dt)
    if love.keyboard.isDown('right') and love.keyboard.isDown('z') then
        self.players.j1.asset.golpeRun.assetCharged:animate(dt) 


    elseif love.keyboard.isDown('z') then

        self.players.j1.asset.golpeA.assetCharged:animate(dt)

    elseif love.keyboard.isDown('x') then

        self.players.j1.asset.golpeB.assetCharged:animate(dt)

    elseif love.keyboard.isDown('right') or love.keyboard.isDown('left') then
        self.players.j1.asset.run.assetCharged:animate(dt)
    else
        self.players.j1.asset.idle.assetCharged:animate(dt)
    end
end

function Player:draw()
    if love.keyboard.isDown('right') and love.keyboard.isDown('z') then
        self.players.j1.asset.golpeRun:draw()

    elseif love.keyboard.isDown('left') then
        self.players.j1.asset.run:draw(false)

    elseif love.keyboard.isDown('z') then
        self.players.j1.asset.golpeA:draw()

    elseif love.keyboard.isDown('x') then
        self.players.j1.asset.golpeB:draw()

    elseif love.keyboard.isDown('right') then
        self.players.j1.asset.run:draw()
    else
        self.players.j1.asset.idle:draw()
    end
end

return Player