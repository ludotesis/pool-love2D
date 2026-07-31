require("mesa")
require("bocha")

--bocha = {}

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
    world = love.physics.newWorld(0, 0, true)
    world:setCallbacks(iniciarContacto, teminarContacto)
 

    CrearMesa()

    CargarBochas()

    love.window.setMode(650, 650)
end

function love.keypressed(key, scancode, isrepeat)
    if key == "space"  then
        miBocha.cuerpo:applyLinearImpulse(0,-1000)
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        MoverBocha(x,y)
    end
end

function love.update(dt)
  world:update(dt)
end

function love.draw()
  
    DibujarMesa()
    DibujarBochas()
  
    love.graphics.setColor(1, 0, 0)
    if contacto then
        love.graphics.print("CHOQUE", 650/2,200 + 20)
        love.graphics.print(entidad1, 650/2,200 + 30)
        love.graphics.print(entidad2, 650/2,200 + 40)
    end
end