local mon = {peripheral.find("monitor")}
for i = 1, #mon do
    mon[i].clear()
    mon[i].setCursorPos(1, 1)
    mon[i].write("123")
end
