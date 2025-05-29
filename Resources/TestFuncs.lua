-- // Test Required Functions (Report any issues)~
local List = {
    "setclipboard",
    "identifyexecutor",
    "appendfile",
    "writefile",
    "readfile",
    "makefolder",
    "isfolder",
    "isfile",
    "listfiles",
    "delfile",
    "delfolder",
    "getcustomasset",
    "fireclickdetector",
};

local HikuriFuncs = {}

for _,v in ipairs(List) do
    if typeof(getfenv()[v]) ~= "function" then
        table.insert(HikuriFuncs,v);
    end
end

if #HikuriFuncs > 0 then
    local EpicFail = table.concat(FlamewareFuncs,", {!} ");
    game:GetService("Players").LocalPlayer:Kick("[HIKURIWARE]: ❌ Failed: {!} "..EpicFail);
else
    game:GetService("Players").LocalPlayer:Kick("[HIKURIWARE]: Passed all checks ✅");
end
