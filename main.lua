require("mesa")

bocha = {}

entidad1 = nil
entidad2 = nil
contacto = false

function iniciarContacto(a,b,col)
    contacto = true
    entidad1 = a:getUserData()
    entidad2 = b:getUserData()
end

function teminarContacto(a,b,col)
    contacto = false
    entidad1 = nil
    entidad2 = nil
end

function love.load()
    
    love.physics.setMeter(64)
    world = love.physics.newWorld(0, 1*64, true)
    world:setCallbacks(iniciarContacto, teminarContacto)
 

    CrearMesa()

    bocha.cuerpo = love.physics.newBody(world, 650/2, 650/2,"dynamic")
    bocha.forma = love.physics.newCircleShape(20)
    bocha.acople = love.physics.newFixture(bocha.cuerpo, bocha.forma)
    bocha.acople:setUserData("Bocha")
    bocha.sprite = love.graphics.newImage("bola.png")

    love.window.setMode(650, 650)
end

function love.keypressed(key, scancode, isrepeat)
    if key == "space" and contacto then
        bocha.cuerpo:applyLinearImpulse(0,-1000)
    end
end

function love.update(dt)
  world:update(dt) 
end

function love.draw()
  
    DibujarMesa()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw( bocha.sprite,
                        bocha.cuerpo:getX(),
                        bocha.cuerpo:getY(),
                        0, 
                        0.075,
                        0.075, 
                        256,
                        256)

    love.graphics.setColor(1, 0, 0)
    if contacto then
        love.graphics.print("CHOQUE", 650/2,200 + 20)
        love.graphics.print(entidad1, 650/2,200 + 30)
        love.graphics.print(entidad2, 650/2,200 + 40)
    end
end