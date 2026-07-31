bochas = {}
miBocha = nil
velocidad = 400

local tag = "Bocha"

function CrearBocha(x, y, r,sprite)
    local bocha = {}

    bocha.cuerpo = love.physics.newBody(world, x, y,"dynamic")
    bocha.forma  = love.physics.newCircleShape(r)
    bocha.acople = love.physics.newFixture(bocha.cuerpo, bocha.forma)
    bocha.acople:setUserData(tag)
    bocha.sprite = love.graphics.newImage(sprite)

    return bocha
end

function CargarBochas()

    local x = 650/2
    local y = 100
    local cantidad = 6

    for i = 1, cantidad do
        table.insert(bochas, CrearBocha(x ,y+ (75 * i),20, i..".png"))
    end

    miBocha = bochas[cantidad]
end

function MoverBocha(x, y)
   local bx = miBocha.cuerpo:getX()
   local by = miBocha.cuerpo:getY()

   local dx = x - bx
   local dy = y - by

   local distancia = math.sqrt(dx * dx + dy * dy)

   if distancia > 0 then
        local impulseX = (dx / distancia) * velocidad
        local impulseY = (dy / distancia) * velocidad
        miBocha.cuerpo:applyLinearImpulse(impulseX, impulseY)
   end
end

function DibujarBochas()
    love.graphics.setColor(1, 1, 1)
    for index, bocha in ipairs(bochas) do
        love.graphics.draw(bocha.sprite, bocha.cuerpo:getX(),
                       bocha.cuerpo:getY(),0, 0.075,0.075, 256,256)
    end
end