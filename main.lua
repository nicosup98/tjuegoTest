local Player = require('Player')
local p1 = Player:new(nil,1000,10,1)
function love.load()
    local idle = love.graphics.newImage('assets/Owlet_Monster/Owlet_Monster_Idle_4.png')
    local run = love.graphics.newImage('assets/Owlet_Monster/Owlet_Monster_Run_6.png')
    local idleQuad =p1.asset.idle:loadAssets(idle,4)
    local runQuad =p1.asset.run:loadAssets(run,6)
    local allIdleQuad = {}
    local allRunQuad = {}
    for k,q in pairs(idleQuad) do
        allIdleQuad[k]=love.graphics.newQuad(q[1],q[2],q[3],q[4],idle:getDimensions())
    end
    for k,q in pairs(runQuad) do
        allRunQuad[k]= love.graphics.newQuad(q[1],q[2],q[3],q[4],run:getDimensions())
    end

    p1.asset.idleQuad = allIdleQuad
    p1.asset.runQuad = allRunQuad
end

function love.update(dt)
    p1:doRunAnimation(love.keyboard.isDown('up'),dt)
end

function love.draw()
    p1:drawAnimation()

    -- love.graphics.draw(p1.asset.idle.assetImg,p1.asset.idle.animation[p1.asset.idle.currentF],128,128)

end