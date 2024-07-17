local player_x = 100
local player_y = 100
local player_speed = 100

love.draw = function ()
  love.graphics.rectangle("fill",player_x,player_y,50,50)
end

love.update = function (dt)
  local dx,dy = 0,0

  if love.keyboard.isDown("right") then
    dx = 1
  end
  if love.keyboard.isDown("left") then
    dx = -1
  end
  if love.keyboard.isDown("up") then
    dy = -1
  end
  if love.keyboard.isDown("down") then
    dy = 1
  end

  local delta = math.sqrt(dx^2 + dy^2)
  dx = delta == 0 and dx or dx/delta
  dy = delta == 0 and dy or dy/delta

  player_x = player_x + dx * player_speed * dt
  player_y = player_y + dy * player_speed * dt

end
