function main() 
    LUI.FlowManager.RequestAddMenu( nil, "request_yesno_popup_generic", true, false, nil, {
        popup_title = Engine.Localize( "@MENU_COMPLETED_CHEAT" ) .. " - " .. Engine.Localize( "@LUA_MENU_CAMPAIGN_UNLOCKED_ALL_TITLE" ),
        yes_action = unlockAll,
        message_text = Engine.Localize( "@LUA_MENU_CAMPAIGN_UNLOCKED_ALL_DESC" )
    } )
end

function unlockAll()
    Engine.SetDvarBool("mis_cheat", true)
    Engine.PlaySound( "mission_unlock_cheat" )
    Engine.ExecNow( "profile_menuDvarsSetup" )
    Engine.SetDvarBool( "profileMenuOption_resumeIsGameCompleted", true )
    Engine.SetDvarBool( "profileMenuOption_hasUnlockedAll_SP", true )
    Engine.SetDvarBool( "profileMenuOption_hasBeenNotifiedCampaignCompleted", true )
    Engine.ExecNow( "profile_menuDvarsFinish" )
    Engine.Exec( "updategamerprofile" )
    LUI.FlowManager.RequestPopupMenu( nil, "campaign_arcade_cheat_unlocked", true, false, false )
end

main()