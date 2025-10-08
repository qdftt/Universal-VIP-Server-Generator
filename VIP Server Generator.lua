local generate = "https://raw.githubusercontent.com/qdftt/Universal-VIP-Server-Generator/refs/heads/main/generate.lua"

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/qdftt/DMONRBX/refs/heads/main/Stuff/Rayfield.lua'))()

local Window = Rayfield:CreateWindow({
   Name = "DMON | Universal VIP Server Generator",
   Icon = 0,
   LoadingTitle = "DMON Loading...",
   LoadingSubtitle = "by dmonmods",
   ShowText = "DMON",
   Theme = "Default",

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "DMON"
   },

   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "",
      Subtitle = "Key System",
      Note = "",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {""}
   }
})

local MainTab = Window:CreateTab("Main")

MainTab:CreateParagraph({
    Title = "Credits",
    Content = "Original AccessCode Generator by heardkometa (v3rm)"
})

MainTab:CreateButton({
    Name = "Generate AccessCode",
    Callback = function()
        local code = loadstring(game:HttpGet(generate))()
        Rayfield:Notify({
            Title = "Copied!",
            Content = "Code: " .. tostring(code),
            Duration = 6.5
        })
        setclipboard(code)
    end
})

local AccessCode = ""

MainTab:CreateInput({
    Name = "AccessCode",
    PlaceholderText = "Put your generated code here!",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        AccessCode = Text
        Rayfield:Notify({
            Title = "Code Applied",
            Content = "Your AccessCode: " .. Text,
            Duration = 3
        })
    end
})

MainTab:CreateButton({
    Name = "Teleport",
    Callback = function()
        if AccessCode == "" then
            Rayfield:Notify({
                Title = "Error",
                Content = "Please enter or generate an AccessCode first!",
                Duration = 4
            })
            return
        end

        Rayfield:Notify({
            Title = "Teleporting...",
            Content = "Using Code: " .. AccessCode,
            Duration = 3
        })

        task.wait(1)
        game.RobloxReplicatedStorage.ContactListIrisInviteTeleport:FireServer(game.PlaceId, "", AccessCode)
    end
})
