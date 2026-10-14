// Command & Conquer: Generals - Zero Hour autosplitter
// Times each mission from the cursor appearing to the victory splash. Compare against Game Time.
// map: 1 = loading, 2 = main menu, >2 = mission.

state("game.dat")
{
    byte cursorControl : "game.dat", 0x61A9C0, 0x48;
    byte map : "game.dat", 0x62A340;
}

state("generals_origin")
{
    byte cursorControl : "generals_origin.exe", 0x62B5FC, 0x48;
    ushort victorySplash : "generals_origin.exe", 0x62C018, 0x10;
    byte map : "generals_origin.exe", 0x5F5700;
}

state("generals")
{
    byte cursorControl : "generals.exe", 0x62B5FC, 0x48;
    ushort victorySplash : "generals.exe", 0x62C018, 0x10;
    byte map : "generals.exe", 0x5F5700;
}

startup
{
    settings.Add("split_victory", true, "Split when the victory splash appears");

    vars.hasVictory = false;
    vars.paused = false;
    vars.missionLoaded = false;
}

init
{
    vars.hasVictory = game.ProcessName != "game.dat";
    vars.paused = false;
    vars.missionLoaded = false;
}

onStart
{
    vars.paused = false;
}

update
{
    // Guards against the cursor flag flipping during boot.
    if (old.map == 1 && current.map > 2)
        vars.missionLoaded = true;
    else if (current.map == 2)
        vars.missionLoaded = false;

    if (vars.hasVictory)
    {
        // Pause from victory until the cursor appears in the next mission; restarts don't pause.
        if (current.map > 2 && current.victorySplash == 1 && old.victorySplash == 0)
            vars.paused = true;
        else if (vars.paused && current.map > 2 && current.cursorControl == 1 && old.cursorControl == 0)
            vars.paused = false;
    }
}

start
{
    return vars.missionLoaded && current.map > 2 && current.cursorControl == 1 && old.cursorControl == 0;
}

split
{
    return vars.hasVictory && settings["split_victory"] && current.map > 2
        && current.victorySplash == 1 && old.victorySplash == 0;
}

isLoading
{
    return vars.paused;
}
