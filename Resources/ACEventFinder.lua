-- // Hello Skidboy :), all my open source projects here: https://github.com/HikuriW/Sources

--shared.RaidTypes = {"WinterIsland","JejuIsland"};
--shared.SearchRaids = true; -- // Dont touch unless ur not an idiot.
--shared.WaitHikrui = true; -- // Executes after loading UI.

repeat task.wait(0.1) until game:IsLoaded();

if shared.WaitHikuri then repeat task.wait(1.5) until (shared.GetUI and shared.GetUI()) end;

local ServerHop = loadstring(game:HttpGet("https://raw.githubusercontent.com/HikuriW/Main/home/Resources/Serverhopper2"))();
local Notified = false;

while shared.SearchRaids == true do task.wait(1.15);
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
        if not Notified then
            if (shared.GetUI and shared.GetUI()) then
                Window:Notify({Title = Window.Settings.Title,Description = "[!] Looks like you found "..Flag,Lifetime = 4.5});
            else
                -- // For non Hikuriware users (Filthy scum, die.)
                print("[!] Looks like you found "..Flag);
            end
            Notified = true;
        end
    else
        if (shared.GetUI and shared.GetUI()) then
            Window:Notify({Title = Window.Settings.Title,Description = "[!] Server hopping...",Lifetime = 4.5});
        else
            -- // Perish in hell, little boy~
            print("[!] Server hopping...");
        end
        ServerHop:Teleport(game.PlaceId);
    end
end
