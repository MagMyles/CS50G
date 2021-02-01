Powerup = Class{}

function Powerup:init(type)
    
    self.type = type

    self.dx = 0
    self.dy = math.random(50, 70)

    self.x = 0
    self.y = 0

    self.width = 16
    self.height = 16
    
end

function Powerup:update(dt)
    self.y = self.y + self.dy*dt
end

function Powerup:render()
    love.graphics.draw(gTextures['main'], gFrames['powerups'][self.type], self.x, self.y)
end

function Powerup:pickedup(paddle)

    if self.x > paddle.x + paddle.width or paddle.x > self.x + self.width then
        return false
    end

    if self.y > paddle.y + paddle.height or paddle.y > self.y + self.height then
        return false
    end 

    return true
end
