function initiate()
	turtle.select(1)
	turtle.refuel(3)
	print("Please put 1 stack of coal in the first slot, 1 stack of cobble in the second slot, and 1 stack of torches in the third slot. Then start the program! ")
	while turtle.detect()==false do
		turtle.forward()
	end
end


function CheckFuel()
	if turtle.getFuelLevel() < 500 then
		turtle.refuel(5)
	end
end


function forward()
	turtle.forward()
end


function dig()
	turtle.dig()
end


function digup()
	turtle.digUp()
end


function left()
	turtle.turnLeft()
end


function right()
	turtle.turnRight()
end


function up()
	turtle.up()
end


function down()
	turtle.down()
end

function Hammer()
	dig()
	forward()
	if turtle.detectDown()==false then
		turtle.select(2)
		turtle.placeDown()
	end
	turtle.turnLeft()
	turtle.dig()
	turtle.turnRight()
	turtle.turnRight()
	turtle.dig()
	turtle.turnLeft()
	turtle.digUp()
	turtle.up()
	turtle.turnLeft()
	turtle.dig()
	turtle.turnRight()
	turtle.turnRight()
	turtle.dig()
	turtle.turnLeft()
	turtle.digUp()
	turtle.up()
	turtle.turnLeft()
	turtle.dig()
	turtle.turnRight()
	turtle.turnRight()
	turtle.dig()
	turtle.turnLeft()
	turtle.down()
	turtle.down()
end

function excavation()
	Hammer()
	Hammer()
	Hammer()
	Hammer()
	Hammer()
	Hammer()
end	



function start()
	initiate()
	while true do
		CheckFuel()
		excavation()
	end
end

start()