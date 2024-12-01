local mon = { peripheral.find("monitor") }
local chest = peripheral.find("minecraft:chest")

local Out_Chest = peripheral.wrap("minecraft:chest_3")
local chest_bal = peripheral.wrap("minecraft:chest_6")
local chest_item = peripheral.wrap("minecraft:chest_7")

-- Ensure monitors are found
if #mon == 0 then
    error("No monitors found. Connect at least one monitor.")
end

-- Setup Shop Function
function SetupShop()
    for i = 1, #mon do
        local m = mon[i]
        m.clear()
        m.setCursorPos(8, 2)
        m.write("=== Welcome to the Slayer Shop ===")
        m.setCursorPos(12, 4)
        m.write("32 Apple for 5 Silver Coin")
        m.setCursorPos(14, 19)
        m.write("=== Touch to Purchase! ===")
    end
end

function LookForItem(item, amount)
    local chest = peripheral.find("minecraft:chest")
    for slot, item in pairs(chest.list()) do
        if item.name == "appel" then
            if item.count == "32" then
                
            end 
        end
    end
    
end

function Purchase_Apple()
    LookForItem("minecraft:apple", "32")
    Out_Chest.pullItems(peripheral.getName(chest_bal), 5)
    sleep(1)
    chest_item.pullItems(peripheral.getName(Out_Chest), 32)
    sleep(1)
    SetupShop()
end

-- Handle Touch Event
function handleTouch(x, y)
    -- Check if touch is within the button area (adjust as needed)
    if y == 19 and x >= 14 and x <= 26 then
        Purchase_Apple()
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
