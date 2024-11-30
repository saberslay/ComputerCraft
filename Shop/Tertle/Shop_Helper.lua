-- Find the modem and open rednet
local modem = peripheral.find("modem", rednet.open)
if modem then
    rednet.open(modem)  -- Open the rednet communication using the found modem
    print("Modem connected and rednet opened.")
end

-- GetPayment function
function GetPayment()
    print("Getting Payment...")

    rednet.send(0, "getDoor")
end

-- Main loop to receive messages
while true do
    local id, message = rednet.receive()  -- Wait for a message
    print(("Computer %d sent message: %s"):format(id, message))
    
    if message == "getPayment" then
        GetPayment()
    end
end