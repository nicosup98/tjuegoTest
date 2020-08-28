Player ={
    vida=100,
    damage=1,
    dmgMult=1,
    asset={
        totalOfFrame=4,
        assetURL='assets/Owlet_Monster/Owlet_Monster_Idle_4.png',
        currentF= 1,
        fWidth = 32,
        fHeigth=32,
        idleAnimation={}
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
        totalOfFrame=4,
        assetURL='assets/Owlet_Monster/Owlet_Monster_Idle_4.png',
        currentF=1,
        fWidth = 32,
        fHeigth=32,
        idleAnimation={}
    }
    return o
end

function Player:loadAsset(url)
    local owletIdle = love.graphics.newImage(url or self.asset.assetURL)
    for idle = 1,self.asset.totalOfFrame do
        self.asset.idleAnimation[idle] = love.graphics.newQuad((idle -1)*self.asset.fWidth,0,self.asset.fWidth,self.asset.fHeigth,owletIdle:getDimensions() )
    end
    return owletIdle
end

function Player:idle(dt,t,delayFrameChange)
    t = t +dt

    if t > delayFrameChange then
        t = t - delayFrameChange
        self.asset.currentF = self.asset.currentF % self.asset.totalOfFrame +1
    end
    return t
end

return Player