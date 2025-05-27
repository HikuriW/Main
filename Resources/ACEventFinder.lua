--shared.RaidTypes = {"WinterIsland","JejuIsland"};
--shared.SearchRaids = true; -- // Dont touch unless ur not an idiot.
--shared.WaitHikrui = true; -- // Executes after loading UI.
--shared.Timer = 1.15;

repeat task.wait(0.1) until game:IsLoaded();

if shared.WaitHikrui then repeat task.wait(1.5) until (shared.GetUI and shared.GetUI()) end;

local ServerHop = loadstring(game:HttpGet("https://raw.githubusercontent.com/HikuriW/Main/home/Resources/Serverhopper"))();
local Notified = false;

while shared.SearchRaids == true do task.wait(shared.Timer);
    local Flag = false;

    local FindEvent = function(Island)
        local Succ,Res = pcall(function()
            return workspace.__Main.__World[Island].Buildings.Model.Part ~= nil;
        end)
        return Succ and Res;
    end

    for _,Island in ipairs(shared.RaidTypes) do
        if FindEvent(Island) then Flag = Island;
            break;
        end
    end

    if Flag then
        if not Notified then Notified = true;
            if (shared.GetUI and shared.GetUI()) then
                Window:Notify({Title = Window.Settings.Title,Description = "[!] Looks like you found "..Flag,Lifetime = 4.5});
            else
                -- // For non Hikuriware users (Filthy scum, die.)
                print("[!] Looks like you found "..Flag);
            end
        end
    else
        local Settings = {ping = true,fps = false,asc = false};
        local Succ,Err = pcall(function()
            ServerHop:GetServers(Settings);
        end)

        if not Succ then
            if (shared.GetUI and shared.GetUI()) then
                Window:Notify({Title = Window.Settings.Title,Description = "[!] Server hop failed: "..tostring(Err),Lifetime = 4.5});
            else
                -- // Perish in hell, little boy~
                warn("[!] Server hop failed: ",Err);
            end
        end
    end
end
