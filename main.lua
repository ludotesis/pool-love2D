function love.load()
    
    love.physics.setMeter(64)
    world = love.physics.newWorld(0, 9.81*64, true)

    cuerpo = love.physics.newBody(world, 650/2, 650-25)
    forma  = love.physics.newRectangleShape(650, 50)
    acople = love.physics.newFixture(cuerpo, forma)

    love.window.setMode(650, 650)
end

function love.draw()
    love.graphics.polygon("fill", cuerpo:getWorldPoints(forma:getPoints()))
end