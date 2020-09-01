local ClassCreate = require('ClassCreate')
local Animations = ClassCreate:derive('Animations')
function Animations:new(imgCharged,totalFrames,width,heigth)
    self.quads = {}
    self.t = 0
    self.totalOfFrame = totalFrames
    self.delayFrameChange = 0.1
    self.currentframeAnimation = 1
    for k = 1,totalFrames do
        self.quads[k] = love.graphics.newQuad((k-1)*width,0,width,heigth,imgCharged:getDimensions())
    end
end

function Animations:animate(dt)
    self.t = self.t +dt
    if self.t > self.delayFrameChange then
        self.t = self.t - self.delayFrameChange
        self.currentframeAnimation = self.currentframeAnimation % self.totalOfFrame +1
    end
end

function Animations:getQuadsForDraw()
    return self.quads[self.currentframeAnimation]
end

return Animations