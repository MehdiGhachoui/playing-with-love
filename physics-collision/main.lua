local world
local player = {}
local object = {}

love.load = function ()
  world = love.physics.newWorld(0,0)
  player.body = love.physics.newBody(world,100,100,"dynamic")
  player.shape = love.physics.newRectangleShape(50,50)
  player.fixture = love.physics.newFixture(player.body,player.shape)

  object.body = love.physics.newBody(world,200,200,"static")
  object.shape = love.physics.newRectangleShape(100,100)
  object.fixture = love.physics.newFixture(object.body,object.shape)
end

love.draw = function ()
  love.graphics.polygon("line",player.body:getWorldPoints(player.shape:getPoints()))
  love.graphics.polygon("fill",object.body:getWorldPoints(object.shape:getPoints()))
end

love.update = function (dt)
  world:update(dt)
  local dx,dy = 0,0
  if love.keyboard.isDown("down")  then
    dy = 1
  end
  if love.keyboard.isDown("right") then
    dx = 1
  end
  if love.keyboard.isDown("up")  then
    dy = -1
  end
  if love.keyboard.isDown("left") then
    dx = -1
  end

  local delta = math.sqrt(dx^2+dy^2)
  dx = delta == 0 and dx or dx/delta
  dy = delta == 0 and dy or dy/delta

  player.body:setLinearVelocity(100*dx,100*dy)
end
