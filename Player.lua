local Assets = require("Assets")
Player ={
    vida=100,
    damage=1,
    dmgMult=1,
    asset={
        idle={}
    }
}
function Player:new(o,vida,damage,dmgMult,asset)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    self.damage = damage or 1
    self.vida = vida or 100
    self.dmgMult = dmgMult or 1
    self.asset = asset or {
            idle=Assets:new(nil,4,'assets/Owlet_Monster/Owlet_Monster_Idle_4.png')
        }
    return o
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