local Assets = {
    totalOfFrame=1,
    assetImg={},
    currentF= 1,
    fWidth = 32,
    fHeigth=32,
    animation={},
    t =0,
    delayFrameChange = 0.1
}

function Assets:new(o,totalOfFrame,fWidth,fHeigth)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    self.totalOfFrame = totalOfFrame or 4
    self.assetImg = {}
    self.currentF =  1
    self.fHeigth = fHeigth or 32
    self.fWidth =  fWidth or 32
    self.animation = {}
    self.t =0
    self.delayFrameChange = 0.5
    return o
end

function Assets:loadAssets(asset)
    self.assetImg={}
    self.assetImg = asset
    for idle = 1,self.totalOfFrame do
        self.animation[idle] = love.graphics.newQuad((idle -1)*self.fWidth,0,self.fWidth,self.fHeigth,self.assetImg:getDimensions() )
    end
end

function Assets:Animation(dt)
    self.t = self.t +dt

    if self.t > self.delayFrameChange then
        self.t = self.t - self.delayFrameChange
        self.currentF = self.currentF % self.totalOfFrame +1
    end
end
function Assets:getAnimation()
    love.graphics.print(self.currentF,0,100)
    return  {self.assetImg,self.animation[self.currentF]}
end
return Assets