-- Find all connected monitors
peripheral.find("modem", rednet.open)
local mon = { peripheral.find("monitor") }

-- Ensure monitors are found
if #mon == 0 then
    error("No monitors found. Connect at least one monitor.")
end

-- Setup Shop Function
function SetupShop()
    redstone.setOutput("back", false)
    for i = 1, #mon do
        local m = mon[i]
        m.clear()
        m.setCursorPos(8, 2)
        m.write("=== Welcome to the Slayer Shop ===")
        m.setCursorPos(8, 4)
        m.write("32 Apple for 5 Silver Coin")
        m.setCursorPos(14, 19)
        m.write("=== Touch to Purchase! ===")
    end
end

function GetDoor()
    redstone.setOutput("back", false)
    sleep(1)
    redstone.setOutput("back", true)
end

function Purchase_made()
    print("Purchase made!")
    --adjust the id as needed
    rednet.send(1, "getPayment")
end

function foo()
    local id, message = rednet.receive()  -- Wait for a message
    print(("Computer %d sent message: %s"):format(id, message))
    
    if message == "getDoor" then
        GetDoor()
    end
end

-- Handle Touch Event
function handleTouch(x, y)
    -- Check if touch is within the button area (adjust as needed)
    if y == 6 and x >= 8 and x <= 26 then
        Purchase_made()
        return true
    else
        print("Touch outside purchase area.")
        return false
    end
end

-- Main Program Loop
while true do
    -- Display the shop
    SetupShop()

    -- Wait for a monitor touch event
    local event, side, x, y = os.pullEvent("monitor_touch")

    -- Process the touch
    handleTouch(x, y)
end