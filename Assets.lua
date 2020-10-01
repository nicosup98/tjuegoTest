local ClassCreate = require('ClassCreate')
local Assets = ClassCreate:derive('Assets')
local AnimationEnum = require('AnimationEnum')
local Animation = require('Animation')

function Assets:new(assets)
    self.currentFrame = AnimationEnum.idle
    self.assetCharged = {}
    self.asset = {
        img=love.graphics.newImage(assets.url),
        posX=assets.posX,
        posY=assets.posY
    }
    self.assetCharged =Animation(self.asset.img,assets.totalFrames,assets.width,assets.heigth)
end

function Assets:draw(invert)
    love.graphics.draw(self.asset.img,self.assetCharged:getQuadsForDraw(),self.asset.posX,self.asset.posY)
end

return Assets