--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    -- Draw medal based on score
    scaleFactor = 0.3
    if self.score < 5 then
        bronze = love.graphics.newImage("bronze.png")
        love.graphics.draw(bronze, VIRTUAL_WIDTH/2 - (bronze:getWidth()*scaleFactor)/2, 135 - (bronze:getHeight()*scaleFactor)/2, 0, scaleFactor)
    elseif self.score >= 5 and self.score < 10 then
        silver = love.graphics.newImage("silver.png")
        love.graphics.draw(silver, VIRTUAL_WIDTH/2 - (silver:getWidth()*scaleFactor)/2, 135 - (silver:getHeight()*scaleFactor)/2, 0, scaleFactor)
    elseif self.score >= 10 then
        gold = love.graphics.newImage("gold.png")
        love.graphics.draw(gold, VIRTUAL_WIDTH/2 - (gold:getWidth()*scaleFactor)/2, 135 - (gold:getHeight()*scaleFactor)/2, 0, scaleFactor)
    end

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end