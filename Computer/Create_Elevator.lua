local mon = {peripheral.find("monitor")}
 
for i = 1, #mon do
    mon[i].clear()
    rs.setOutput("left",false)
    rs.setOutput("top",false)
    mon[i].setCursorPos(5,1)
    mon[i].setTextScale(0.5)
    w, h = mon[i].getSize()
    mon[i].setBackgroundColor(colors.black)
    mon[i].write("Elevator")
           
    mon[i].setCursorPos(2,3)
    mon[i].setBackgroundColor(colors.red)
    mon[i].write("Surface Level")
    mon[i].setBackgroundColor(colors.black)
    
    mon[i].setCursorPos(5,5)
    mon[i].setBackgroundColor(colors.red)
    mon[i].write("Level B1")
    mon[i].setBackgroundColor(colors.black)
    
    mon[i].setCursorPos(2,9)
    mon[i].setBackgroundColor(colors.red)
    mon[i].write("Mining Level")
    mon[i].setBackgroundColor(colors.black)
end
 
function updown()
    rs.setOutput("top",true)
    sleep(1)
    rs.setOutput("top",false)
end
function startandstop()
    rs.setOutput("left",true)
    sleep(1)
    rs.setOutput("left",false)
end
 
while true do
    event, side, x, y = {os.pullEvent("monitor_touch")}
    if x > 2 and x < 10 and y == 3 then
    
    end
    
    if os.pullEvent("redstone") then
        startandstop()
    end
end