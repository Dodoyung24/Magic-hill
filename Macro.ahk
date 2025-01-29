;magic


; huge thanks to:
; yuh for heavily inspiring  the macro + some functions

#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\imageForCS.ahk
#Include %A_ScriptDir%\Lib\OCR-main\Lib\OCR.ahk
#Include %A_ScriptDir%\Lib\WebhookOptions.ahk
#Include %A_ScriptDir%\Lib\keybinds.ahk
#Include %A_ScriptDir%\Lib\IsProcessElevated.ahk

global MacroStartTime := A_TickCount
#Include %A_ScriptDir%\Lib\updates.ahk
SendMode "Event"
RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"
UnitExistence := "|<>*91$66.btzzzzzzyDzXlzzzzzzyDzXlzzzzzzyDzXlzzzyzzyDbXlUS0UM3UC1XlUA0UE30A1XlW4EXl34AMXlX0sbXXC80XVX4MbXX6A1U3UA0bk30ARk7UC0bk3UA1sDUz8bw3kC1zzbyszzzzzzzzbw1zzzzzzzzby3zzzzzzzzzzjzzzzzzU"
MaxUpgrade := "|<>*134$53.0000000007U3k00000TUDk00001XUsk000033XVU0000636300800A3M6TzwS0M3UDrjRa0k70S0AS61U40s0EMAD001U0k0Ty41331k1zwA6673k7zsQAAS7UTzkwsMQC0TzVzkk0M0Tz3zVk0kETy7z3k1VkzwTz7kX7nzzzzzzzzzzzzzzzzzzw"
MaxUpgrade2 := "|<>*146$47.D07U0001z0Tk000371lU00067z3zzzzw7w7zzzzs7kDzzzzk7UTzSzzUC0w0MwD081k0UkS00301U1w82663U3sMAAC7UDkssMwD0zVvkksQ0z3zVU0k0y7z3U1UUwDy7U33VszyDX6Dbzzzzzzzzzzzzzzzy"
MaxUpgrade3 := "|<>*91$49.Dk7s00004M3600006633000031X1U0001UP0nzr3kkD0PzynAM3UD06D3A0U70331a00301U1X20VVUs1lVUklsS1kkssMwD0kMSQAC70AA/u603036413U1UUn20Vs0ksNX0My4NqMTUDnzzlwU"
VoteStart := "|<>*95$38.ryzzzzlz7zlzwDVzwTzXszz7zsSC30Q7770E40klU410C8sklVXUACAM0w7X360T1s1kEbsz0Q40zDsTVUM"
LobbyText := "|<>*134$56.0000000000k00U10000T00y1w000Cs0RkvU003606AAM000lU1X36000AMzMwlswS36zyDwTzjslw7WD4ST6AS0M1k33lX7060A0MMPlkkVX366DwQS8sFkk3z772C4QC1zlkkV327UTw40M0k1wDz1UC0Q0z3zsQ7WD4TkzzzzzzzzwTzzzzzzzy7zzzzzzzzXzzzzzzzzszs"
AreasText := "|<>*108$36.zs007zyzztzzwTzzzzwTzTzzsA4613tA421/k4M0F3k4M4FXXUQ603bmy713zzzzzzU"
MatchmakeUI := "|<>*129$83.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUzzzzzzzzzzzzz0zzzzzzzw7zzzw1zzzzzzzkDzzzs3zzzzzzzUTzzzs7zzzzzzz0zzzzkTzzzzzzy1zzzzzzzzzzzzw3zzzzzzzzzzzzs7zzzzzzzzzzzzkDy0Tw7UsDzzzzUTk0Ds7007zzzz0z00DUA007zzzy1w00D0M007zzzw3k00S0k00Dzzzs7U00Q1U00DzzzkC0S0s3060TzzzUQ1y0k60y0zzzz0s7w1UA1y1zzzy1kDs30M3w3zzzw3UTk60k7s7zy7k70TUA1UDkDzs70C0Q0s30TUTzk00S001k60z0zzU01w007UA1y1zz007w00D0M3w3zz00Dw00y0k7s7zz01zw03y1kDkDzzU7zy0Tw7UzkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
CaptchaExistence := "|<>*100$131.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDzzzzzzzs3zzzzzzzzzzzkDzzzzzzz01zzzzzzy7zzzUTzzzzzzs00zzzzzzs7zzz0zzzzzzzU01zzzzzzkDzzy1zzzzzzy003zzzzzzUTzzw3zzzzzzs007zzzzzz0zzzs7zzzzzzk7wTzzzzzy1zyTkDzzzzzz0Tzz0UsEDk0DU7UEDz0Uzy1zzw01U0DU0S0300Dw01zw3zzk0300C00s0600Dk03zsDzz00600C01U0A00T007zkTzw00A00A0200M00Q00DzUzzs30M3US1w1lk70s30Tz0zzkD0kDUw3s7zUT1kD0zy1zzUz1UT1s7kTz0y3Uz1zw1zz1w30y3kDUzy1w31w3zw1zC1s61s7UT0zw3s61s7zs0sA00A00D0y0Es7kA00Dzs00A00M00y0C00kDUQ00Tzs00M00k01y0A01UT0s00zzs00s01U07w0Q030y3s01zzs03s0300zw1w0C1w7s03zzw0TwCC1rzy3y1y7wDwCDzzzzzzzw3zzzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzzUTzzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzy3zzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Matchmaking := "|<>*93$73.zzzzzzzzzzzzzzlzzzsszzzzk08zzzwATzzzs04Tzzy6Dzzzw03zzzz3zzzzy7zzzzzVzzzzz3zX4DwElW7w8U7lU3s0Mk1w0E1sk0w0AM0Q080wM0A06A06040SAC6736737W7z6D37VX3VXl3zX7VVklXkkkVzlXkk0MlsM0EzslsQ0AMwC08zwMwC06AS7U4TyATDlb6DbxXzzzzzzzzzzzlzzzzzzzzzzs0zzzzzzzzzzw0zzzzzzzzzzy0zzzzzzzzzzzty"
AutoAbility := "|<>*83$21.zzzzzzzwD4S0kXl28wS03Xk0QSH7nWMy0n7sCQzzzzU"
ClaimText := "|<>*127$71.00000000000000A7s01y000007zTs07w00000Tzlk0AQ00003k7VU0MM0000D03300kk0000Q0667zXzsw01k0AAzzzzzy031ysTrjTSyS0C7zky0AA0EQ0QCTVs0MM00Q0ss73U0kk00M1lkC711VVUUk3VnwC73333VU73zsQS666737y3tksQAAAC7zy01Uk0MMMQDzy030k0kkksTzy061U1VVVkzzz0y3kX77XXzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
LoadingScreen := "|<>*87$90.U07zzzzzzzzzzzz000Tzzzzzzzzzzz0007zzzzzzzzzzz0001zzzzzzzzzzz0000zzzzzzzzzzz0000Tzzzzzzzzzz0000Dzzzzzzzzzz00007zzzzzzzzzz00003zzzzzzzzzz0Ds01zzzzzzzzzz0Dy01zzzzzzzzzz0DzU0y0zw1y0s1z0Dzk0w0zw0w0k0T0Dzs0w0Tw0w000D0Dzs0Q0Tw0w00070Dzw0Q0Tw0w00030Dzw0Q0Tw0w00030Dzw0Q0Tw0w00010Dzw0Q0Tw0w00010Dzw0Q0Tw0w03000Dzw0Q0Tw0w0Dk00Dzw0Q0Tw0w0Ts00Dzs0Q0Tw0w0Ts00Dzs0w0Tw0w0Tw00Dzk0w0Tw0w0Tw00DzU0w0Ts0w0Tw00Dz01w0Ds0w0Tw00Dw01y07k0w0Tw000003y0000w0Tw000007y0000w0Tw00000Dz0000w0Tw00000Dz0000w0Tw00000zzU000w0Tw00001zzk000w0Tw00003zzs040w0Tw0000Dzzw0A0y0zw0U01zzzzUy1z1zy1U"
ReplayText :="|<>*101$71.Tk0000Dk0001zs0000FU00000Q0001V000000A00032000000M00064000000Py7zA8TzwD3kw7NbMFnD8m4Vk3U3ka08P0D30703VM0ES0Q406033U0ksE08QA46711kkU0k0MQAC73U10100ksMMC7U60107UkksQB08D23j01Uk0P0kK40C070k0m10Y40A0O1U1a63AQ0sFa3kXAAyDjzky7xzwEkkA7tV01U0VVU000320000220000640000AA0000AM0000AE0000DU0000TU0000600000C1"


CheckForUpdates()


global randomizedStages := true

SetupMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(27, 15, 800, 600, RobloxWindow)
        Sleep 50
    }
    if WinExist("Taxi Winter Event Farm") {
        Sleep 50
        WinActivate("Taxi Winter Event Farm")
        Sleep 100
    }

}

InitializeMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    global MacroStartTime := A_TickCount

    if WinExist("Taxi Auto-Challenge") {
        WinActivate("Taxi Auto-Challenge")
    }

    if WinExist(RobloxWindow) {
        WinMove(27, 15, 800, 600, RobloxWindow)
        WinActivate(RobloxWindow)
        Sleep 100
    }
    else {
        MsgBox("Yo Diddy you gotta open roblox for it to work yea, microsoft roblox dont work bbg", "Error T4", "+0x1000",)
        return
    }

    if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
        GoToRaids()
    }
    else {
        MsgBox("You must be in the lobby with default camera angle to start the macro.", "Error T3", "+0x1000",)
        return
    }

}

SetDefaultKeyboard(localeID) {
    static SPI_SETDEFAULTINPUTLANG := 0x005A, SPIF_SENDWININICHANGE := 2
    Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
    binaryLocaleID := Buffer(4, 0)
    NumPut("UInt", LocaleID, binaryLocaleID)
    DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "Ptr", binaryLocaleID, "UInt", SPIF_SENDWININICHANGE)
    for hwnd in WinGetList()
        PostMessage 0x50, 0, Lan, , hwnd
}

BetterClick(x, y, LR := "Left") { ; credits to yuh for this, lowk a life saver
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick(LR, -1, 0, , , , "R")
    Sleep(50)
}

ScrollDown(power) {
    ; Scroll up using the mouse wheel
    Loop power {
        SendInput("{WheelDown}")
        Sleep 100 ; Optional delay between scrolls
    }
}

LoadStage() {
    if !FileExist("Lib\Settings\stage.txt") {
        AddToLog("No stage configuration file found. Default settings will be used.")
        return 1 ; Default to Stage 1 if the file doesn't exist
    } else {
        file := FileOpen("Lib\Settings\stage.txt", "r", "UTF-8")
        if !file {
            AddToLog("Failed to load the stage configuration.")
            return 1 ; Default to Stage 1 if the file cannot be opened
        }
        
        while !file.AtEOF {
            line := file.ReadLine()
            if RegExMatch(line, "Stage=(\d+)", &match) {
                return match.1 ; Return the stage number
            }
        }
        file.Close()
    }
    return 1 ; Default to Stage 1 if no valid stage found
}

GoToRaids() {
    SendInput ("{Tab}")
    loop {
        if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
            AddToLog("Found LoadingScreen, stopping loop")
            break
        }
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
            AddToLog("Found VoteStart, stopping loop")
            break
        }
        if (ok := FindText(&X, &Y, 338, 505, 536, 572, 0, 0, ClaimText)) ; daily reward
        {
            BetterClick(406, 497)
            Sleep 3000
        }

        if (randomizedStages) {
            selectedStage := Random(1,3)
        } else {
            selectedStage := LoadStage() 
        }
        

 
        ;AddToLog("Selected stage: " selectedStage)

        ; go to play area
        BetterClick(89, 302) ; play
        Sleep 1000
        HoldKey("d", 1600)
        Sleep 500
        HoldKey("w", 2400)
        Sleep 3500
        BetterClick(703, 135) ; Select the legend stages
        Sleep 1000
        BetterClick(700, 235) ; Magic hills
        Sleep 400
        ;ScrollDown(2) 
        ;Sleep 800
        ;BetterClick(702, 300) 
        ;Sleep 800

        if (selectedStage = "1") {
            BetterClick(287, 240) ; Click position for Stage 1
        }
        else if (selectedStage = "2") {
            BetterClick(287, 271) ; Click position for Stage 2
        }
        else if (selectedStage = "3") {
            BetterClick(287, 304) ; Click position for Stage 3
        }

        Sleep 1000
        BetterClick(400, 439) ; play
        Sleep 500

        ; just make sure it doesnt require find match or play here
        if (ActionDropdown.Text = "Find match") {
            BetterClick(460, 320) ; find match
            Sleep 1000
            AntiCaptcha()
        } else if (ActionDropdown.Text = "Play here") {
            BetterClick(335, 332) ; Click the "Play here" button
            Sleep 1000 
            BetterClick(400, 439) ; play button its the same position
        }

        BetterClick(400, 520) ; cancel
        Sleep 200
    }
    
    LoadedLoop()
    StartedLoop()
    OnSpawnSetup()
    TryPlacingUnits()

}

StopMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    Reload()
}
; Define the rectangle coordinates
global startX := 30, startY := 285, endX := 200, endY := 285
global step := 50 ; Step size for grid traversal
global successfulCoordinates := [] ; Array to store successful placements
global successThreshold := 3 ; Number of successful placements needed

PlaceUnit(x, y, slot := 1) {
    SendInput(slot)
    Sleep 50
    BetterClick(x, y)
    Sleep 50
    SendInput("q")

    ; Check if placement is successful
    if IsPlacementSuccessful() {


        return true
    }
    return false
}

IsPlacementSuccessful() {

    Sleep 2000
    if (ok := FindText(&X, &Y, 78, 182, 400, 451, 0, 0, UnitExistence)) {
        AddToLog("placed unit successfully")
        BetterClick(329, 184) ; close upg menu
        return true
    }
    return false
}

Numpad5:: {
    SendWebhook()
}

#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\Gdip_All.ahk

TryPlacingUnits() {
    global startX, startY, endX, endY, step, successfulCoordinates
    successfulCoordinates := [] ; Reset successfulCoordinates for each run

    x := startX ; Initialize x only once
    y := startY ; Initialize y only once

    ; Iterate through all slots (1 to 6)
    for slotNum in [1, 2, 3, 4, 5, 6] {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text

        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0

        ; Continue placement for the current slot
        while (placementCount < placements && y >= endY) { ; Rows
            while (placementCount < placements && x <= endX) { ; Columns
                if PlaceUnit(x, y, slotNum) {
                    placementCount++
                    successfulCoordinates.Push({ x: x, y: y }) ; Track successful placements
                }
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }
                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse
                if ShouldStopUpgrading(1) {                 
                    return LobbyLoop()
                }

                Reconnect()
                x += step - 20 ; Move to the next column
            }
            if x > endX {
                x := startX ; Reset x for the next row
                y -= (step - 50) ; Move to the next row
            }
            Reconnect()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        Reconnect()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}


UpgradeUnits() {
    global successfulCoordinates

    AddToLog("Beginning unit upgrades.")

    while true { ; Infinite loop to ensure continuous checking
        for index, coord in successfulCoordinates {

            UpgradeUnit(coord.x, coord.y)

            if ShouldStopUpgrading() {
                
                successfulCoordinates := []
                return LobbyLoop()
            }

            if IsMaxUpgrade() {
                AddToLog("Max upgrade reached for: X" coord.x " Y" coord.y)
                successfulCoordinates.RemoveAt(index) ; Remove the coordinate
                continue ; Skip to the next coordinate
            }

            Sleep(200)
            if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
            {
                BetterClick(373, 237)
            }
            BetterClick(348, 391) ; next
            BetterClick(565, 563) ; move mouse
            Reconnect()
        }

        ; If all units are maxed, still check for stopping condition
        if successfulCoordinates.Length = 0 {
            Reconnect()
            BetterClick(348, 391) ; next
            if ShouldStopUpgrading() {
             
                return LobbyLoop()
            }
            Sleep(2000) ; Prevent excessive looping

        }

        Reconnect()
    }
}


UpgradeUnit(x, y) {
    BetterClick(x, y - 3)
    BetterClick(264, 363) ; upgrade
    BetterClick(264, 363) ; upgrade
    BetterClick(264, 363) ; upgrade
}

IsMaxUpgrade() {
    Sleep 500
    if (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade) or (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade2)) or (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade3)))
    {
        return true
    }
}



ShouldStopUpgrading(sleepamount := 300) {
    Sleep sleepamount

    if (randomizedStages) {          ;checks if randomstage is on, if yes then he will make go back to lobby when its time for it
        if CheckForLobbyButton() {
            if (WebhookCheckbox.Value = 1) {
                SendWebhook()
            }
            BetterClick(340, 117)  ; Click on return
            AddToLog("Stopping due to finding lobby condition")
            return true
        }
    } else {
        ; If randomizedStages is false, perform the CheckForReplayButton action ;if randomstage is off then he does replay
        if CheckForReplayButton() {
            if (WebhookCheckbox.Value = 1) {
                SendWebhook()
            }

            ; Loop 5 times to click the Replay Button               ;clicks 5 times on replay button
            Loop 5 {
                BetterClick(485, 117)  ; Click on the Replay Button
                Sleep 200  ; Wait 200ms before the next click
            }
            AddToLog("Continuing due to replay condition")
            return true
        }
    }

    return false  ; If nothing matches, he say nothing
}



OnSpawn() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    OnSpawnSetup()
}

LookDown() {
    MouseMove(400, 300)
    loop 20 {
        SendInput("{WheelUp}")
        Sleep 50
    }
    Sleep 200
    MouseGetPos(&x, &y)
    MouseMove(400, 300)
    SendInput(Format("{Click {} {} Left}", x, y + 150))

    loop 20 {
        SendInput("{WheelDown}")
        Sleep 50
    }
}

LoadedLoop() {
    AddToLog("Waiting to load in")
    loop {
        Sleep 1000 
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
        {
            AddToLog("Loaded in")
            Sleep 1000
            BetterClick(350, 103) ; click yes
            BetterClick(350, 100) ; click yes
            BetterClick(350, 97) ; click yes
            break
        }
        Reconnect()


    }
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        AddToLog("Sending chat")
        SendChat()
    }
}

StartedLoop() {
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
        {
            continue
        }
        AddToLog("Game started")
        break
    }
}

LobbyLoop() {
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText))
        {
            break
        }
        Reconnect()
    }
    AddToLog("Returned to lobby, going back to raids")
    return GoToRaids()
}

CheckForLobbyButton() {
    if (ok := FindText(&X, &Y, 273, 103, 482, 214, 0, 0, LobbyText))
    {
        return true
    }
}

SendChat() {
    SendInput("/")
    Sleep 250
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        for char in StrSplit(chat) {
            Send(char)
            Sleep(Random(100, 200))  ; Optional delay between each keypress
        }
    }
    Sleep 1200
    SendInput("{Enter}")
    Sleep 250
}

TPtoSpawn() {
    BetterClick(27, 574) ; setings
    Sleep 1000
    BetterClick(400, 287)
    Sleep 600
    loop 4 {
        Sleep 150
        SendInput("{WheelDown 1}") ; scroll
    }
    Sleep 600
    BetterClick(523, 271) ; tp to spawn
    Sleep 600
    BetterClick(582, 150) ; exit settings

}

DebugOCR() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    if ocrResult {
        BetterClick(414, 342)
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha) {
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }
}

AntiCaptcha() {
    ; Perform OCR on the defined region directly
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    ; Display OCR results
    if ocrResult {
        BetterClick(414, 342) ; Click to focus on captcha input
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
            BetterClick(584, 192) ; close captcha
            return
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha) {
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }

    BetterClick(309, 386) ; select
    Sleep 1500
    BetterClick(383, 221)
    Sleep 500

    sleep 6000
    if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
        return
    }
    if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
        return
    }
    AddToLog("Walking to ensure the UI pops up again if it didnt matchmake")

    loop 2 {
        HoldKey("D", 400)
        HoldKey("A", 800)
        HoldKey("Space", 2000)
    }

    Sleep 1500
    if (ok := FindText(&X, &Y, 221, 206, 403, 355, 0, 0, MatchmakeUI))
    {
        AddToLog("Waiting for captcha cooldown then retrying")
        Sleep 6000
    }
    return
}




CheckforNextButton() {
    NextButton := "|<>*126$49.000000003UQ000003sz0001w36Nk000z1VgM000lUkyAz77MsMD7zzrwTA3XkCTA1a0lk2740n0Mk1U20NW0Mss3kwlUA0S3swMs60D1wSQQ37z0S7yD1U7070z7ks13XkTXwS1ntwTzzzzzzzzzzzzzzzzzzzzzzzzs"
    
    if (ok := FindText(&X, &Y, 355-150000, 441-150000, 355+150000, 441+150000, 0, 0, NextButton)){
        AddToLog("found button, checking for replay next")
        loop 5 {
            BetterClick(348, 391) ; next
            Sleep 200
        }
        Sleep 2000
        return true
    }
    return false
}





CheckForReplayButton() {
   
       if (ok := FindText(&X, &Y, 485-150000, 117-150000, 485+150000, 117+150000, 0, 0, ReplayText)) { 
       return true
 }
}


Positioning() {
    HoldKey("a", 5000)
    Sleep 400
    HoldKey("w",500)
    Sleep 200
    HoldKey("a",3050)
    Sleep 300
    HoldKey("s",1500) ;500
    Sleep 1500
    ;HoldKey("a", 2000)
    ;Sleep 2000
}

OnSpawnSetup() {
    
    SendInput ("{Tab}")
    LookDown()
    Sleep 200
    TPtoSpawn()
    Sleep 200
    Positioning()
    Sleep 200
    AddToLog("Attempting to move to spot")
    Sleep 1000
}

Reconnect() {
    ; Check for Disconnected Screen
    color := PixelGetColor(519, 329) ; Get color at (519, 329)
    if (color = 0x393B3D) {
        AddToLog("Disconnected! Attempting to reconnect...")

        ; Use Roblox deep linking to reconnect
        Run("roblox://placeID=" 8304191830)
        Sleep 2000
        if WinExist(RobloxWindow) {
            WinMove(27, 15, 800, 600, RobloxWindow)
            WinActivate(RobloxWindow)
            Sleep 1000
        }
        loop {
            AddToLog("Reconnecting to Roblox...")
            Sleep 15000
            if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
                AddToLog("Reconnected Succesfully!")
                return GoToRaids() ; Check for challenges in the lobby
            }
            else {
                Reconnect()
            }
        }
    }
}

HoldKey(key, duration) {
    SendInput ("{" key "up}")
    ; go to teleporter
    Sleep 100
    SendInput ("{" key " down}")
    Sleep duration
    SendInput ("{" key " up}")
    KeyWait key ; Wait for "d" to be fully processed
}