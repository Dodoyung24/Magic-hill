#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\configgui.ahk
#Include %A_ScriptDir%\Macro.ahk
#Include %A_ScriptDir%\Lib\keybinds.ahk

SaveConfig() {
    global enabled1, enabled2, enabled3, enabled4, enabled5, enabled6
    global placement1, placement2, placement3, placement4, placement5, placement6

    SaveChoiceGui.Show("AutoSize Center")

    return
}

LoadConfig() {
    global enabled1, enabled2, enabled3, enabled4, enabled5, enabled6
    global placement1, placement2, placement3, placement4, placement5, placement6

    LoadChoiceGui.Show("AutoSize Center")

    return
}

GuiClose() {
    LoadChoiceGui.Hide()
    SaveChoiceGui.Hide()
}

SaveConfigToFile(filePath) {
    File := FileOpen(filePath, "w")
    if !File {
        AddToLog("Failed to save the configuration.")
        return
    }

    File.WriteLine("Enabled1=" enabled1.Value)
    File.WriteLine("Enabled2=" enabled2.Value)
    File.WriteLine("Enabled3=" enabled3.Value)
    File.WriteLine("Enabled4=" enabled4.Value)
    File.WriteLine("Enabled5=" enabled5.Value)
    File.WriteLine("Enabled6=" enabled6.Value)

    File.WriteLine("Placement1=" placement1.Text)
    File.WriteLine("Placement2=" placement2.Text)
    File.WriteLine("Placement3=" placement3.Text)
    File.WriteLine("Placement4=" placement4.Text)
    File.WriteLine("Placement5=" placement5.Text)
    File.WriteLine("Placement6=" placement6.Text)

    File.Close()
    AddToLog("Configuration saved successfully to " filePath ".")
}

SaveGlobal(*) {
    global enabled1, enabled2, enabled3, enabled4, enabled5, enabled6
    global placement1, placement2, placement3, placement4, placement5, placement6

    SaveConfigToFile("C:\global.txt")
    SaveWebhookSettings(true)
    GuiClose()
}

SaveLocal(*) {
    global enabled1, enabled2, enabled3, enabled4, enabled5, enabled6
    global placement1, placement2, placement3, placement4, placement5, placement6

    SaveConfigToFile("Lib\Settings\config.txt")
    SaveWebhookSettings(false)
    GuiClose()
}

LoadGlobal(*) {
    global enabled1, enabled2, enabled3, enabled4, enabled5, enabled6
    global placement1, placement2, placement3, placement4, placement5, placement6

    LoadConfigFromFile("C:\global.txt")
    LoadWebhookSettings(true)
    GuiClose()
}

LoadLocal(*) {
    global enabled1, enabled2, enabled3, enabled4, enabled5, enabled6
    global placement1, placement2, placement3, placement4, placement5, placement6

    LoadConfigFromFile("Lib\Settings\config.txt")
    LoadWebhookSettings(false)
    GuiClose()
}

LoadConfigFromFile(filePath) {
    global enabled1, enabled2, enabled3, enabled4, enabled5, enabled6
    global placement1, placement2, placement3, placement4, placement5, placement6

    if !FileExist(filePath) {
        AddToLog("No configuration file found. Default settings will be used.")
    } else {
        ; Open file for reading
        file := FileOpen(filePath, "r", "UTF-8")
        if !file {
            AddToLog("Failed to load the configuration.")
            return
        }

        ; Read settings from the file
        while !file.AtEOF {
            line := file.ReadLine()
            if RegExMatch(line, "Enabled(\d)=(\d+)", &match) {
                slot := match.1
                value := match.2
                enabledgui := "Enabled" slot
                enabledgui := %enabledgui%
                enabledgui.Value := value ; Set checkbox value
            }
            if RegExMatch(line, "Placement(\d)=(\d+)", &match) {
                slot := match.1
                value := match.2
                placementgui := "Placement" slot
                placementgui := %placementgui%
                placementgui.Text := value ; Set dropdown value
            }
        }
        file.Close()
        AddToLog("Configuration loaded successfully.")
    }


    LoadChatSettings() ; Load chat settings
}

SaveChatSend() {
    global ChatToSend, ChatStatusBox

    ; Open file for writing
    File := FileOpen("Lib\Settings\chatsettings.txt", "w")
    if !File {
        AddToLog("Failed to save the chat settings.")
        return
    }

    ; Write the chat settings to the file
    File.WriteLine("MessageToSend=" ChatToSend.Value)
    File.WriteLine("ChatEnabled=" ChatStatusBox.Value)
    File.Close()
    AddToLog("Chat settings saved successfully.")
    SendChatGUI.Hide()
}

LoadChatSettings() {
    global ChatToSend, ChatStatusBox

    if !FileExist("Lib\Settings\chatsettings.txt") {
        AddToLog("No chat settings file found. Default settings will be used.")
        return
    }

    ; Open file for reading
    File := FileOpen("Lib\Settings\chatsettings.txt", "r", "UTF-8")
    if !File {
        AddToLog("Failed to load the chat settings.")
        return
    }

    ; Read and apply the chat settings
    while !File.AtEOF {
        line := File.ReadLine()
        if RegExMatch(line, "MessageToSend=(.+)", &match) {
            ChatToSend.Value := match.1 ; Set the chat message
        }
        if RegExMatch(line, "ChatEnabled=(\d+)", &match) {
            ChatStatusBox.Value := match.1 ; Set the checkbox value
        }
    }

    File.Close()
    AddToLog("Chat settings loaded successfully.")
}

SaveWebhookSettings(isGlobal) {
    global WebhookURL, WebhookCheckbox


    ; Open file for writing
    File := FileOpen((isGlobal = true) ? "C:\webhooksettings.txt" : "Lib\Settings\webhooksettings.txt", "w")
    if !File {
        AddToLog("Failed to save the chat settings.")
        return
    }

    ; Write the chat settings to the file
    File.WriteLine("WebhookURL=" WebhookURL.Value)
    File.WriteLine("WebhookEnabled=" WebhookCheckbox.Value)
    File.Close()
    AddToLog("Chat settings saved successfully.")
    SendChatGUI.Hide()

}

LoadWebhookSettings(isGlobal) {
    global WebhookURL, WebhookCheckbox

    if !FileExist((isGlobal = true) ? "C:\webhooksettings.txt" : "Lib\Settings\webhooksettings.txt") {
        AddToLog("No webhook settings file found. Default settings will be used.")
        return
    }

    ; Open file for reading
    File := FileOpen((isGlobal = true) ? "C:\webhooksettings.txt" : "Lib\Settings\webhooksettings.txt", "r", "UTF-8")
    if !File {
        AddToLog("Failed to load the chat settings.")
        return
    }

    ; Read and apply the chat settings
    while !File.AtEOF {
        line := File.ReadLine()
        if RegExMatch(line, "WebhookURL=(.+)", &match) {
            WebhookURL.Value := match.1 ; Set the chat message
        }
        if RegExMatch(line, "WebhookEnabled=(\d+)", &match) {
            WebhookCheckbox.Value := match.1 ; Set the checkbox value
        }
    }

    File.Close()
    try {
        if (WebhookURL.Value != "") {
            global Webhook := WebHookBuilder(WebhookURL.Value)
            AddToLog("Succesfully loaded webhook URL")
        }
    } catch {
        MsgBox("Your webhook URL is not valid.", "Webhook", 4096 + 0)
    }
    AddToLog("Webhook settings loaded successfully.")
}

SaveHotkeys(*) {
    global hotkey1, hotkey2, hotkey3, keybindsGui

    if (hotkey1.Value == "" or hotkey2.Value == "" or hotkey3.Value == "") {
        AddToLog("One of the keybinds is empty. Please change it.")
        return
    }

    if (hotkey1.Value == hotkey2.Value || hotkey1.Value == hotkey3.Value || hotkey2.Value == hotkey3.Value) {
        AddToLog("Duplicate keybinds detected. Please assign unique keys to each function.")
        return
    }

    File := FileOpen("C:\keybinds.txt", "w")
    if !File {
        AddToLog("Failed to save the keybind settings.")
        return
    }
    ; Write the chat settings to the file
    File.WriteLine("Hotkey1=" hotkey1.Value)
    File.WriteLine("Hotkey2=" hotkey2.Value)
    File.WriteLine("Hotkey3=" hotkey3.Value)
    File.Close()
    AddToLog("Keybind settings saved successfully.")
    keybindsGui.Hide()

    Reload()
}

LoadHotkeys() {
    global hotkey1, hotkey2, hotkey3, keybindsGui

    if !FileExist("C:\keybinds.txt") {
        AddToLog("No keybind settings file found. Default settings will be used.")
        Hotkey("F1", (*) => SetupMacro())
        Hotkey("F2", (*) => InitializeMacro())
        Hotkey("F3", (*) => StopMacro())

        KeyBinds.Text := "F1 - Fix Roblox Position `n F2 - Start Macro `n F3 - Stop Macro"
        return
    }

    ; Open file for reading
    File := FileOpen("C:\keybinds.txt", "r", "UTF-8")
    if !File {
        AddToLog("Failed to load the keybind settings.")
        return
    }

    ; Read and apply the chat settings
    while !File.AtEOF {
        line := File.ReadLine()
        if RegExMatch(line, "Hotkey1=(.+)", &match) {
            hotkey1.Value := match.1 ; Set the chat message
        }
        if RegExMatch(line, "Hotkey2=(.+)", &match) {
            hotkey2.Value := match.1 ; Set the checkbox value
        }
        if RegExMatch(line, "Hotkey3=(.+)", &match) {
            hotkey3.Value := match.1 ; Set the checkbox value
        }
    }

    hotkeyKeybind1 := hotkey1.Value or "F1"
    hotkeyKeybind2 := hotkey2.Value or "F2"
    hotkeyKeybind3 := hotkey3.Value or "F3"

    Hotkey(hotkeyKeybind1, (*) => SetupMacro())
    Hotkey(hotkeyKeybind2, (*) => InitializeMacro())
    Hotkey(hotkeyKeybind3, (*) => StopMacro())

    KeyBinds.Text := hotkeyKeybind1 " - Fix Roblox Position`n" . hotkeyKeybind2 " - Start Macro`n" . hotkeyKeybind3 " - Stop Macro"

    File.Close()
    AddToLog("Keybind settings loaded successfully.")
}

SaveStageSetting(txt) {
    File := FileOpen("Lib\Settings\stage.txt", "w")
    if !File {
        AddToLog("Failed to save the play settings configuration.")
        return
    }
    File.WriteLine("Stage=" txt) ; Assuming ActionDropdown is the variable for the dropdown
    File.Close()
    AddToLog("Stage settings configuration saved successfully.")
}

LoadStageSetting(txt) {
    if !FileExist("Lib\Settings\stage.txt") {
        AddToLog("No play settings file found. Default settings will be used.")
    } else {
        file := FileOpen("Lib\Settings\stage.txt", "r", "UTF-8")
        if !file {
            AddToLog("Failed to load the play settings configuration.")
            return
        }
        while !file.AtEOF {
            line := file.ReadLine()
            if RegExMatch(line, "Stage=(.+)", &match) {
                txt := match.1 ; Set the dropdown value
            }
        }
        file.Close()
        AddToLog("Stage settings configuration loaded successfully.")
    }
}

SavePlaySetting() {
    File := FileOpen("Lib\Settings\playsettings.txt", "w")
    if !File {
        AddToLog("Failed to save the play settings configuration.")
        return
    }
    File.WriteLine("PlaySetting=" ActionDropdown.Text) ; Assuming ActionDropdown is the variable for the dropdown
    File.Close()
    AddToLog("Play settings configuration saved successfully.")
}

LoadPlaySetting() {
    if !FileExist("Lib\Settings\playsettings.txt") {
        AddToLog("No play settings file found. Default settings will be used.")
    } else {
        file := FileOpen("Lib\Settings\playsettings.txt", "r", "UTF-8")
        if !file {
            AddToLog("Failed to load the play settings configuration.")
            return
        }
        while !file.AtEOF {
            line := file.ReadLine()
            if RegExMatch(line, "PlaySetting=(.+)", &match) {
                ActionDropdown.Text := match.1 ; Set the dropdown value
            }
        }
        file.Close()
        AddToLog("Play settings configuration loaded successfully.")
    }
}