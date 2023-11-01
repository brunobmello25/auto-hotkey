Persistent

MinecraftTitle := "Minecraft" ; Name of the Minecraft window. Change if necessary.
ClickInterval := 1200 ; Interval in milliseconds for regular left clicks
EatInterval := 300000 ; Interval in milliseconds to eat (every 5 minutes here)
EatDuration := 6000 ; Duration in milliseconds to hold right click for eating (6 seconds here)
ElapsedTime := 0 ; Initialize ElapsedTime

Loop
{
    if (WinExist(MinecraftTitle))
    {
        ; Regular left click
        ControlClick("x0 y0", MinecraftTitle)
        Sleep(ClickInterval)
        
        ; Keep track of elapsed time for eating
        ElapsedTime += ClickInterval
        
        ; If it's time to eat
        if (ElapsedTime >= EatInterval)
        {
            ; Hold right click for a while to eat
            ControlSend(MinecraftTitle, "{RButton down}")
            Sleep(EatDuration)
            ControlSend(MinecraftTitle, "{RButton up}")
            
            ; Reset elapsed time counter
            ElapsedTime := 0
        }
    }
    else
    {
        ; If Minecraft isn't running or the title doesn't match, wait a bit before checking again
        Sleep(5000)
    }
}
