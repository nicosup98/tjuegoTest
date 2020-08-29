Assets = {
    totalOfFrame=1,
    assetImg={},
    currentF= 1,
    fWidth = 32,
    fHeigth=32,
    animation={}
}

function Assets:new(o,totalOfFrame,assetImg,currentF,fWidth,fHeigth,animation)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    self.totalOfFrame = totalOfFrame or 4
    self.assetImg = love.graphics.newImage(assetImg)
    self.currentF = currentF or 1
    self.fHeigth = fHeigth or 32
    self.fWidth =  fWidth or 32
    self.animation = animation or {}
    return o
end

function Assets:loadAssets()
    for idle = 1,self.totalOfFrame do
        self.animation[idle] = love.graphics.newQuad((idle -1)*self.fWidth,0,self.fWidth,self.fHeigth,self.assetImg:getDimensions() )
    end
end

function Assets:idleAnimation(dt,t,delayFrameChange)
    t = t +dt

    if t > delayFrameChange then
        t = t - delayFrameChange
        self.currentF = self.currentF % self.totalOfFrame +1
    end
    return t
end

function Assets:drawIdle(x,y)
    love.graphics.draw(self.assetImg,self.animation[self.currentF],x or 128,y or 128)
end

return Assets