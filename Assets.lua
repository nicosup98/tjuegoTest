local Assets = {}

function Assets:new(o,fWidth,fHeigth)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    self.assetImg = {}
    self.currentF =  1
    self.fHeigth = fHeigth or 32
    self.fWidth =  fWidth or 32
    self.animation = {}
    self.t =0
    self.delayFrameChange = 0.1
    return o
end

function Assets:loadAssets(asset,totalOfFrame)
    -- self.assetImg={}
    self.assetImg = asset
    local animation = {}
    for idle = 1,totalOfFrame do
        animation[idle] = {(idle -1)*self.fWidth,0,self.fWidth,self.fHeigth}
    end
    return animation
end

function Assets:Animation(dt,totalOfFrame)
    self.t = self.t +dt
    if self.t > self.delayFrameChange then
        self.t = self.t - self.delayFrameChange
        self.currentF = self.currentF % totalOfFrame +1
    end
end
function Assets:getAnimation(allQuads)
    love.graphics.print(self.currentF,0,100)
    return  {self.assetImg,allQuads[self.currentF]}
end
return Assets