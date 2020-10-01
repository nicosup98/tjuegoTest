local Player = require('Player')
local p
function love.load()
    p = Player(
        {
            j1={
                asset={
                    idle={
                        url='assets/Owlet_Monster/Owlet_Monster_Idle_4.png',
                        width=32,
                        heigth=32,
                        posX=128,
                        posY=128,
                        totalFrames=4
                    },
                    run={
                        url='assets/Owlet_Monster/Owlet_Monster_Run_6.png',
                        width=32,
                        heigth=32,
                        posX=128,
                        posY=128,
                        totalFrames=6
                    },
                    golpeA={
                        url='assets/Owlet_Monster/Owlet_Monster_Attack1_4.png',
                        width=32,
                        heigth=32,
                        posX=128,
                        posY=128,
                        totalFrames=4
                    },
                    golpeB={
                        url='assets/Owlet_Monster/Owlet_Monster_Attack2_6.png',
                        width=32,
                        heigth=32,
                        posX=128,
                        posY=128,
                        totalFrames=6
                    },
                    golpeRun={
                        url="assets/Owlet_Monster/Owlet_Monster_Walk+Attack_6.png",
                        width=32,
                        heigth=32,
                        posX=128,
                        posY=128,
                        totalFrames=6
                    }
                }
            }
        }
    )
end

function love.update(dt)
    p:update(dt)
end

function love.draw()
    p:draw()
end