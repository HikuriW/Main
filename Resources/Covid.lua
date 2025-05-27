-- shared.Country = "America";

local cloneref = cloneref or function(o) return o end;
local HttpService = cloneref(game:GetService("HttpService"));

local Succ,Res = pcall(function()
    return game:HttpGet("https://disease.sh/v3/covid-19/countries/"..shared.Country);
end)

if Succ then
    local Data = HttpService:JSONDecode(Res);

    print("Country: "..Data["country"]);
    print("Cases: "..Data["cases"]);
    print("Deaths: "..Data["deaths"]);
    print("Recovered: "..Data["recovered"]);
    print("Active: "..Data["active"]);
end
