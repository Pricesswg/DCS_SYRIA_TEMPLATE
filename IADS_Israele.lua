do
        -----------------------------------------------------------------------------------------------------------------
        ------------------------------IADS BLUE INTEGRATION - SIRYA DYNAMIC TEMPLATE ------------------------------------
        -----------------------------------------------------------------------------------------------------------------    
        -----------------------------------------------------------------------------------------------------------------        
        --DEFINE THE BLUE COALITION, NAMED ISRAELE: IT ALSO INCLUDE THE AMERICAN CARRIER GROUP
        -----------------------------------------------------------------------------------------------------------------
        
        blueIADS = SkynetIADS:create('ISRAELE')
        
        -----------------------------------------------------------------------------------------------------------------
        --DEBUGGING, REMOVE THE -- COMMAND TO ACTIVATE THE EXPORT
        -----------------------------------------------------------------------------------------------------------------
        
                ---debug settings remove from here on if you do not wan't any output on what the IADS is doing
                local iadsDebug = blueIADS:getDebugSettings()
                iadsDebug.IADSStatus = true
                --iadsDebug.samWentDark = true
                --iadsDebug.contacts = true
                --iadsDebug.radarWentLive = true
                --iadsDebug.noWorkingCommmandCenter = true
                --iadsDebug.ewRadarNoConnection = true
                --iadsDebug.samNoConnection = true
                --iadsDebug.jammerProbability = true
                --iadsDebug.addedEWRadar = true
                --iadsDebug.addedSAMSite = true
                --iadsDebug.hasNoPower = true
                --iadsDebug.harmDefence = true
                --iadsDebug.warnings = true
                --iadsDebug.samSiteStatusEnvOutput = true
                --iadsDebug.earlyWarningRadarStatusEnvOutput = true
                
                ---end remove debug ---
                
        -----------------------------------------------------------------------------------------------------------------
        --DEFINE THE PREFIXES FOR THE BLUE COALITION
        -----------------------------------------------------------------------------------------------------------------
                blueIADS:addEarlyWarningRadarsByPrefix('BLUEEWR' , 'AWACS' , 'ngton')
                blueIADS:addSAMSitesByPrefix('BLUESAM')
                blueIADS:setUpdateInterval(30)
                blueIADS:addRadioMenu()
        
                blueIADS:addMooseSetGroup(DetectionSetGroup)
        -----------------------------------------------------------------------------------------------------------------        
        --COMMAND CENTER - NODE - ELECTRIC CENTRAL ADD:
        -----------------------------------------------------------------------------------------------------------------        
                local commandCenter = StaticObject.getByName("BLUECMD")
                local comPowerSource = StaticObject.getByName("Static-Electric-Central-BLUECMD")   
                local conNode = Unit.getByName("BLUENODE")   
                blueIADS:addCommandCenter(commandCenter):addPowerSource(comPowerSource):addConnectionNode(conNode)
        
        -----------------------------------------------------------------------------------------------------------------
        --EW RADAR ADD:
        -----------------------------------------------------------------------------------------------------------------
                

                blueIADS:getEarlyWarningRadarByUnitName('BLUEEWR-Rolandewr-1')
        

                blueIADS:getEarlyWarningRadarByUnitName('BLUEEWR-Rolandewr-2')
        
        
                --local connectionNodeEW = Unit.getByName("BLUENODE")
                --local powerSource = StaticObject.getByName("Static-Electric-Central-BLUECMD")
                --blueIADS:getEarlyWarningRadarByUnitName('BLUESAM-Patriot-Ramat'):addConnectionNode(connectionNodeEW):addPowerSource(powerSource):setActAsEW(true)
        
                --local connectionNodeEW = Unit.getByName("BLUENODE")
                --local powerSource = StaticObject.getByName("Static-Electric-Central-BLUECMD")
                --blueIADS:getEarlyWarningRadarByUnitName('BLUESAM-HAWK-netafim'):addConnectionNode(connectionNodeEW):addPowerSource(powerSource):setActAsEW(true)
        
                --local connectionNodeEW = Unit.getByName("BLUENODE")
                --local powerSource = StaticObject.getByName("Static-Electric-Central-BLUECMD")
                --blueIADS:getEarlyWarningRadarByUnitName('BLUESAM-HAWK-Haifa'):addConnectionNode(connectionNodeEW):addPowerSource(powerSource):setActAsEW(true)
        
        -----------------------------------------------------------------------------------------------------------------
        --DEFINE THE SAM SITE 
        -----------------------------------------------------------------------------------------------------------------
        
                local connectionNode = Unit.getByName("BLUENODE")
                blueIADS:getSAMSiteByGroupName('BLUESAM-Roland'):addConnectionNode(connectionNode)
                blueIADS:setupSAMSitesAndThenActivate()
        
                local connectionNode = Unit.getByName("BLUENODE")
                blueIADS:getSAMSiteByGroupName('BLUESAM-Roland-1'):addConnectionNode(connectionNode)

                blueIADS:setupSAMSitesAndThenActivate()       
                local connectionNode = Unit.getByName("BLUENODE")
                blueIADS:getSAMSiteByGroupName('BLUESAM-Roland-2'):addConnectionNode(connectionNode)
                blueIADS:setupSAMSitesAndThenActivate()
        
                local connectionNode = Unit.getByName("BLUENODE")
                local powerSource = StaticObject.getByName("Static-Electric-Central-BLUECMD")
                blueIADS:getSAMSiteByGroupName('BLUESAM-Patriot-Ramat'):addPowerSource(powerSource):addConnectionNode(connectionNode):setActAsEW(true)
                blueIADS:setupSAMSitesAndThenActivate()
        
                local connectionNode = Unit.getByName("BLUENODE")
                local powerSource = StaticObject.getByName("Static-Electric-Central-BLUECMD")
                blueIADS:getSAMSiteByGroupName('BLUESAM-HAWK-netafim'):addPowerSource(powerSource):addConnectionNode(connectionNode):setActAsEW(true)
                blueIADS:setupSAMSitesAndThenActivate()
        
                local connectionNode = Unit.getByName("BLUENODE")
                local powerSource = StaticObject.getByName("Static-Electric-Central-BLUECMD")
                blueIADS:getSAMSiteByGroupName('BLUESAM-Hawk-Haifa'):addPowerSource(powerSource):addConnectionNode(connectionNode):setActAsEW(true)
                blueIADS:setupSAMSitesAndThenActivate()
        
                
        --add the variable for the CAP Scripting
        
        blueIADS:addMooseSetGroup(DetectionSetGroup)
        


end