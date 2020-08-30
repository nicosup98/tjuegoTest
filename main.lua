local Player = require('Player')
local p1 = Player:new(nil,1000,10,1)
local animationEnum = require('AnimationEnum')
function love.load()
    local idle = love.graphics.newImage('assets/Owlet_Monster/Owlet_Monster_Idle_4.png')
    local run = love.graphics.newImage('assets/Owlet_Monster/Owlet_Monster_Run_6.png')
    p1.asset.idle:loadAssets(idle)
    p1.asset.run:loadAssets(run)
end

function love.update(dt)
    if love.keyboard.isDown('up') then
        p1.asset.run:Animation(dt)
        p1.asset.currentAnimationStatus = animationEnum.run
    else
        p1.asset.idle:Animation(dt)
        p1.asset.currentAnimationStatus = animationEnum.idle
    end
end

function love.draw()
    p1:drawAnimation()

    -- love.graphics.draw(p1.asset.idle.assetImg,p1.asset.idle.animation[p1.asset.idle.currentF],128,128)

end