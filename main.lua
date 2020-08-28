local playerIdle
local Player = require('Player')
local time = 0
local delayFrameChange = 0.10
local p1 = Player:new(nil,1000,10,1)

function love.load()
    playerIdle=p1:loadAsset()
end

function love.update(dt)
    time=p1:idle(dt,time,delayFrameChange)
end

function love.draw()
    love.graphics.draw(playerIdle,p1.asset.idleAnimation[p1.asset.currentF],128,128)
end