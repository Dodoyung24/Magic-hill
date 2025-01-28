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
MagicHill :="|<>*101$591.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs00000000000001zy0000000001zy07zzzzzzzzzzzzzzzzzXzzzzzzzzzzzzzsTw7y3zzzzzzzzzsTzzzzzsDzzs7zzzzzzzzz00000000000000D1s000000000S3s0zzzzzzzzzzzzzzzzzk7zzzzzzzzzzzzy0z0TU7zzzzzzzzs1zzzzzw0zzs0Tzzzzzzzzs00000000000003U70000000003U7U7Dzzzzbzzzzzzzzzzw0TzzzzzzyDzzszU3k1w0zzzzzzzzy0DU000DU3zy03zzz1zzzzzU0000000000000Q0Q000000000Q0S0UDzzzU7zzzzzzzzzzU3zzzzzzz0Tzw1w0S0D07zzzzzzzzU0s0000w0TzU0Dzzk7zzzzw00000000000003U3U00000000301s00zzzs0zzzzzzzzzzw0Tzzzzzzk1zz07U3k1s0zzzzzzzzs0C00007U3zs01zzw0TzzzzU0000000000000Q0Q000000000Q07U03zzz07zzzzzzzzzzU3zzzzzzy0Dzs0w0S0D07zzzzzzzy01k0000Q0Ty00DzzU3zzzzw00000000000003U3U000000003U0Q00Tzzk0zzzzzzzzzzw0Tzzzzzzk1zz07U3k1s0zzzzzzzzk0S00003U3zk03zzw0Tzzzz00000000000000Q0Q000000000Q01k01zzw07zzzzzzzzzzU7zzzzzzy0Dzs0w0y0D07zzzzzzzw0Tk0000Q0Ty00TzzU3zzzzs00000000000003U30000000001y0C007zz00zzzzzzzzzzy1zzzzzzzk1zz07k7k1s0zzzzzzzzU7y00003U3zU07zzw0TzzzzU0000000000000C0s0000000007s0s00Tzs07zzzzzzzzzzzzzzzzzzy0Dzs0zzy0D07zzzzzzzs1zk0000w0Tw0DzzzU3zzzzwDk03s000000Ds1zz00z0000000DU7003zy00zzzzzzzzzzzzzzzzzzzk1zz07zzk1s0zzzzzzzz0Dy00007U3zU3zzzw0Tzzzzbz00zk3zrz0Tzw7zk0zzU1znzU0Q0s00DzU07zzzzzzzzzzzzzzzzzzy0Dzs0zzy0D07zzzzzzzs3zk1zzzw0Tw0TzzzU3zzzzxzw0DzVzzzwDzzszy0Tzz0Tzzz01k3U00zs00zzzzzzzzzzzzzzwDzzzk1zz07zzk1s0zzw1zzzy0Ty0DzzzU3zU3zzzw0Tzzzzz3k3kyTvz7nw0TzXsDk3w7lz7w0C0Q003z007zw1k7zs3kDk7zw0Dzzy0Dzs0y0y0D07zw00zzzk7zk1zzzw0TU00DzzU3s3U7zkC0Q3zk3UCw00Tk73k03ls3U7k0s3U00Dk00zy040zw040w0zy00Tzzk1zz07U7k1s0zy003zzy0zy0DzzzU3s001zzw0S080Dw1s70Ds000z000w0Mw00DC080D070A001w007z0003z0007U3z001zzy0Dzs0w0S0D07zU00Dzzk7zk1zzzw0T0007zzU3k000z070s0y0007k007U3j000xk000w0s1k007000zk000Tk000w0Tk007zzk1zz07U3k1s0zw001zzw0zy000DzU3s000zzw0S0003s0wC07U000y000w0Tk003y0003k70C000M007w0003w0007U3w000Tzy00000w0S0D07zU00DzzU7zk000Tw0T0007zzU3k000D03Xk0s0007U007U3w000Dk000C0s1k000040zU000T0000w0T0007zzk00007U3k1s0zs003zzw0zy0003zU3s000zzw0S0000s0SQ060000w001w0T0000y0000s3UC04001U7s0003s0007U3s000zzy00000w0S0D07z07UzzzUDzk000Tw0T0007zzU3k0007U1rU1k0007U3kDU3k0003k00070Q0k0k00Q0y0000S0000w0S0007zzk00007U3k1s0zs1zjzzw1zy0003zU3s001zzw0S0000Q07s0A0000w0zXw0S0000S0000Q3U607003U7k0Q03k0w07U3k0Q1zzy00000w0S0D07z07zzzzUDzk000Tw0Tw09zzzU3k0003k0z03U0007U1zzU3k0S03k0003UQ0k0s00w0y0Dk0S0Dk0w0S07sTzzk00007U3k1s0zs01zzzw1zy0003zU3zU3zzzw0S07s0S03k0w0DU0w00Tw0Q07s0C07s0Q3U707U0DU7k1z03U3z07U3U1zzzzy00000w0S0D07zU01zzzUDzk000Tw0Tw0TzzzU3k1zU3s0S0703y07U00zU3U1zU1k0zU3UQ0s0y01w0w0Tw0Q0Ts0w0Q0Tzzzzk1zz07U3k1s0zw003zzw1zy0007zU3zU3zzzw0S0Dw0TU1U1s0zk0y001w0Q0AC0C0Dw0Q3U707s0TU7U3zU3U3z07U3U3zzzzy0Dzs0w0S0D07zk00Dzz0Dzk1zzzw0Tw0TzzzU3k1zU3w0A0D07D07k007U3U3Vk1k1nU3UQ0s0z07w0w0Tw0Q0Ts0w0Q0Tzzzzk1zz07U3k1w0zy001zzw1zy0DzzzU3zU3zzzw0S0Dw0Tk003s0tk0z000Q0Q0QC0C0CQ0S3U707w1zU7U3z03k3z07U3U3zzzzy0Dzs0w0S0DU7zw007zzUDzk1zzzw0Tw0TzzzU3k1zU3y000T03y07w003U3U1nU1k1nU3kQ0k0zkTw0y0Ds0S0Dk0w0S0Dzzzzk1zz07U3k1w0zzk00zzw1zy0DzzzU3zU3zzzw0S0Dw0Ts007s0Tk0zs00Q0Q0Dw0C0CQ0S3U607zzzU7k0y03k0Q07U3k0y3zzy0Dzs0w0S0DU7zzk07zzUDzk1zzzw0Tw0TzzzU3k1zU3zU01zU0s07zk03U3U0z03k1nU3kQ0k0zzzw0y0000S0000w0S000Dzzk1zz07U3k0Q03yDs0zzw1zy0000DU1zU3zzzw0S0Dw0Tw00CQ0000y7w0Q0S0000S0CQ0S3U607zzzU7s0003s0007U3s000zzy0Dzs0w0S01U07UTU7zzUDzk0000w01w0TzzzU3k1zU3vk03nU0007UDk3U3k0003k1nU3kQ0k0zzzw0z0000T0000w0T0007zzk1zz07U3k0A00s000zzw1zy00007U0DU3zzzw0S0Dw0SS00QC0000w000Q0T0000y0CQ0S3UC07zzzU7w0003w0007U3w000zzy0Dzs0w0T01U070007zzU7zk0000Q00w0TzzzU3k1vU3ls07Vs00070003U3s0007k1nU3ks1k0zzzw0zk000Tk000w0Tk007zzk1zz07U3s0C00k001zzw0zy00003k07U3zzzw0S0DQ0S7U1s70000s000Q0TU001y0CQ0S70C07zzzU7z0003z0007U3z000zzy0Dzs0w0T01s06000Dzzk7zk0000S00w0TzzzU3k1zU3kw0C0w00070007U3i000Tk1nU3Us1U0zzzw0zw000Ty040w0Tw00Dzzk1zz07U3w0D00s003zzy0zy00007s07U3zzzw0S0Dy0S3k3k3k000w000w0Rs007i0CQ0Q70AUDzzzU7zk0k7zw3U7k7zs07zzz0Tzw1y0zk1y07k00zzzk7zs0000zU1y0TzzzU7k3zk3US0Q0DU107k00TU37U03tk3lk3Us3a3zzzz1zzkz1zzzw0z1zzk3zzzw7zzkTsDzkTy3zU0Tzzz0TzU000Dz0Ds7zzzz1z0zz0w1sDU0z0w1zU07y0sD00yD0wD0wC0Qzzzzzzzzzzzzzzz07zzzzzzzzzzzzzzzzzzzzzzzzzzzzs3zzzzzzzzzzzzzzzzzzzzzzU7zs03zzzyzkDtzy0z1zUzzUzz1k37zzzzzzzzzzzzszs0zzzzzzzzzzzzzzzzzzzzzzzzzzzzz0Dzzzzzzzzzzzzzzzzzzzzzs0zy007zzzVzzy7zU1zzk3zs7zkQ0szzzzzzzzzzzzy1y07zzzzzzzzzzzzzzzzzzzzzzzzzzzzw1zzzzzzzzzzzzzzzzzzzzzy03zU00DwTk1zy0Dk03zs0Dw0DwTU77zzzzzzzzzzzzk001zzzzzzzzzzzzzzzzzzzzzzzzzzzzzU7zzzzzzzzzzzzzzzzzzzzU001U0000000000000000000000Ds1kzzzzzzzzzzzzw000Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzy0TzzzzzzzzzzzzzzzzzzzwU00000000000000000000000003y0C7zzzzzzzzzzzzU003zzzzzzzzzzzzzzzzzzzzzzzzzzzzzk0DzzzzzzzzzzzzzzzzzzzwU0000000000000000000000000Q03Uzzzzzzzzzzzzw000zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz01zzzzzzzzzzzzzzzzzzzzY00000000000000000000000003U0Q7zzzzzzzzzzzzU00Dzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0Dzzzzzzzzzzzzzzzzzzzw00000000000000000000000000Q070zzzzzzzzzzzzz003zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk1zzzzzzzzzzzzzzzzzzzw000000000000000000000000003U1s7zzzzzzzzzzzzw00zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz0DzzzzzzzzzzzzzzzzzzzU00000000000000000000000000Q0S0zzzzzzzzzzzzzw0Tzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw1zzzzzzzzzzzzzzzzzzzU000000000000000000000000003UDU7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzg000000000000000000000000000T7s0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwU000000000000000000000000001zy07zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0000000000000000000000000007z00U"

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
        Sleep 1000
        ; HoldKey("d", 2000)
        ; Sleep 500
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
                    AddToLog("Stopping due to finding lobby  condition.")
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
                AddToLog("Found return to lobby, going back.")
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
                AddToLog("Stopping due to finding return to lobby button.")
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
    if CheckForLobbyButton() {
        if (WebhookCheckbox.Value = 1) {
            SendWebhook()
        }
        BetterClick(376, 117)
        return true
    }
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