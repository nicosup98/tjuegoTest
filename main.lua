local Player = require('Player')
local time = 0
local delayFrameChange = 0.10
local p1 = Player:new(nil,1000,10,1)

function love.load()
    p1.asset.idle:loadAssets()
end

function love.update(dt)
    time=p1.asset.idle:idleAnimation(dt,time,delayFrameChange)
end

function love.draw()
    -- love.graphics.draw(p1.asset.idle.assetImg,p1.asset.idle.animation[p1.asset.idle.currentF],128,128)
    p1.asset.idle:drawIdle()
end