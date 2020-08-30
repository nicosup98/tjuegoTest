local Assets = require("Assets")
local animationEnum = require('AnimationEnum')
local Player ={}
function Player:new(o,vida,damage,dmgMult,asset)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    self.damage = damage or 1
    self.vida = vida or 100
    self.dmgMult = dmgMult or 1
    self.asset = asset or {
            idle=Assets:new(nil),
            run=Assets:new(nil),
            currentAnimationStatus = animationEnum.idle,
            runQuad = {},
            idleQuad= {}
        }
    return o
end
function Player:drawAnimation()
    local animation
    if self.asset.currentAnimationStatus == animationEnum.run then
        animation= self.asset.run:getAnimation(self.asset.runQuad)
        love.graphics.print('run')
    else
        love.graphics.print('idle')

        animation= self.asset.idle:getAnimation(self.asset.idleQuad)
    end
    love.graphics.draw(animation[1],animation[2],128,128)
end

function Player:doRunAnimation(input,dt)
    if input then
        self.asset.run:Animation(dt,6)
        self.asset.currentAnimationStatus = animationEnum.run
    else
        self.asset.idle:Animation(dt,4)
        self.asset.currentAnimationStatus = animationEnum.idle
    end
end
-- function Player:loadAssets()
--     for idle = 1,self.asset.idle.totalOfFrame do
--         self.asset.idle.animation[idle] = love.graphics.newQuad((idle -1)*self.asset.idle.fWidth,0,self.asset.idle.fWidth,self.asset.idle.fHeigth,self.asset.idle.assetImg:getDimensions() )
--     end
-- end

-- function Player:idleAnimation(dt,t,delayFrameChange)
--     t = t +dt

--     if t > delayFrameChange then
--         t = t - delayFrameChange
--         self.asset.idle.currentF = self.asset.idle.currentF % self.asset.idle.totalOfFrame +1
--     end
--     return t
-- end

return Player