do
-----------------------------------------------------------------------------------------------------------------
------------------------------IADS RED INTEGRATION - SIRYA DYNAMIC TEMPLATE ------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--CREATE THE RED COALITION, NAMED SYRIA
-----------------------------------------------------------------------------------------------------------------
    syriaIADS = SkynetIADS:create('SYRIA')

-----------------------------------------------------------------------------------------------------------------
--DEBUGGING, REMOVE THE -- COMMAND TO ACTIVATE THE EXPORT
-----------------------------------------------------------------------------------------------------------------

        ---debug settings remove from here on if you do not wan't any output on what the IADS is doing
        --local iadsDebug = syriaIADS:getDebugSettings()
        --iadsDebug.IADSStatus = true
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
--DEFINE THE PREFIXES TO IDENTIFY EARLY WARNING RADARS AND SAM SITES
-----------------------------------------------------------------------------------------------------------------

        syriaIADS:addEarlyWarningRadarsByPrefix('EW')
        syriaIADS:addSAMSitesByPrefix('SAM')
        syriaIADS:setUpdateInterval(30)
        syriaIADS:addRadioMenu()
                
        syriaIADS:setupSAMSitesAndThenActivate()

        syriaIADS:addMooseSetGroup(DetectionSetGroup)

-----------------------------------------------------------------------------------------------------------------        
--COMMAND CENTER - NODE - ELECTRIC CENTRAL ADD:
-----------------------------------------------------------------------------------------------------------------        
        local commandCenter = StaticObject.getByName("CMDwest")
        local comPowerSource = StaticObject.getByName("Static-Electric-Central-CMDwest")   
        local conNode = Unit.getByName("NODEWEST")   
        syriaIADS:addCommandCenter(commandCenter):addPowerSource(comPowerSource):addConnectionNode(conNode)

        local commandCenter = StaticObject.getByName("CMDfarwest")
        local comPowerSource = StaticObject.getByName("Static-Electric-Central-CMDfarwest")
        local conNode = Unit.getByName("NODEFARWEST")
        syriaIADS:addCommandCenter(commandCenter):addPowerSource(comPowerSource):addConnectionNode(conNode)

        local commandCenter = StaticObject.getByName("CMDcenter")
        local comPowerSource = StaticObject.getByName("Static-Electric-Central-CMDCenter")
        local conNode = Unit.getByName("NODECENTER")
        syriaIADS:addCommandCenter(commandCenter):addPowerSource(comPowerSource):addConnectionNode(conNode)

-----------------------------------------------------------------------------------------------------------------
 --EW RADAR ADD:
 -----------------------------------------------------------------------------------------------------------------

        local connectionNodeEW = Unit.getByName("NODEWEST")
        local powerSource = StaticObject.getByName("Static-Electric-Central-CMDwest")
        syriaIADS:getEarlyWarningRadarByUnitName('EWR-Sborka'):addConnectionNode(connectionNodeEW):addPowerSource(powerSource)

        local connectionNodeEW = Unit.getByName("NODEWEST")
        local powerSource = StaticObject.getByName("Static-Electric-Central-CMDwest")
        syriaIADS:getEarlyWarningRadarByUnitName('EWR-Sborka-1'):addConnectionNode(connectionNodeEW):addPowerSource(powerSource)

        local connectionNodeEW = Unit.getByName("NODEWEST")
        local powerSource = StaticObject.getByName("Static-Electric-Central-CMDwest")
        syriaIADS:getEarlyWarningRadarByUnitName('EWR-Sborka-6'):addConnectionNode(connectionNodeEW):addPowerSource(powerSource)

        local SA15PointDEF = syriaIADS:getSAMSiteByGroupName('SAM-SA15-4')
        local connectionNodeEW = Unit.getByName("NODEWEST")
        local powerSource = StaticObject.getByName("Static-Electric-Central-CMDwest")
        syriaIADS:getEarlyWarningRadarByUnitName('SAM-SA11-2'):addConnectionNode(connectionNodeEW):addPowerSource(powerSource):addPointDefence(SA15PointDEF):setActAsEW(true)

-----------------------------------------------------------------------------------------------------------------       
--SAM SITE ADD
-----------------------------------------------------------------------------------------------------------------
       
        local SA15PointDEF = syriaIADS:getSAMSiteByGroupName('SAM-SA15-6')
        local connectionNodeEW = Unit.getByName("NODEWEST")
        local powerSource = StaticObject.getByName("Static-Electric-Central-CMDwest")
        syriaIADS:getEarlyWarningRadarByUnitName('SAM-SA11-1'):addConnectionNode(connectionNodeEW):addPowerSource(powerSource):addPointDefence(SA15PointDEF):setActAsEW(true):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

        local SA15PointDEF = syriaIADS:getSAMSiteByGroupName('SAM-SA15-7')
        local connectionNodeEW = Unit.getByName("NODEWEST")
        local powerSource = StaticObject.getByName("Static-Electric-Central-CMDwest")
        syriaIADS:getEarlyWarningRadarByUnitName('SAM-SA3-1'):addConnectionNode(connectionNodeEW):addPowerSource(powerSource):addPointDefence(SA15PointDEF)

        local SA15PointDEF = syriaIADS:getSAMSiteByGroupName('SAM-SA15-5')
        local connectionNode = Unit.getByName("NODEWEST")
        local powerSource = StaticObject.getByName("Static-Electric-Central-CMDwest")
        syriaIADS:getSAMSiteByGroupName('SAM-SA3-2'):addPowerSource(powerSource):addConnectionNode(connectionNode):addPointDefence(SA15PointDEF):setIgnoreHARMSWhilePointDefencesHaveAmmo(true)

        local connectionNode = Unit.getByName("NODEWEST")
        syriaIADS:getSAMSiteByGroupName('SAM-SA8'):addConnectionNode(connectionNode)

        local connectionNode = Unit.getByName("NODEWEST")
        syriaIADS:getSAMSiteByGroupName('SAM-SA8-1'):addConnectionNode(connectionNode)

        local SA15PointDEF = syriaIADS:getSAMSiteByGroupName('SAM-SA15-4')
        local connectionNode = Unit.getByName("NODEWEST")
        local powerSource = StaticObject.getByName("Static-Electric-Central-CMDwest")
        syriaIADS:getSAMSiteByGroupName('SAM-SA11-2'):addPowerSource(powerSource):addConnectionNode(connectionNode):addPointDefence(SA15PointDEF):setIgnoreHARMSWhilePointDefencesHaveAmmo(true):setActAsEW(true)
       
-----------------------------------------------------------------------------------------------------------------
--Molniya AND AWACS NODE connections:
-----------------------------------------------------------------------------------------------------------------
        local connectionNodeEW = Unit.getByName('NODEWEST')
        ewRadar = syriaIADS:getEarlyWarningRadarByUnitName('EW-K-50')
        ewRadar:addConnectionNode(connectionNodeEW)

        local connectionNodeEW = Unit.getByName('NODEWEST')
        ewRadar = syriaIADS:getEarlyWarningRadarByUnitName('EW-Molniya')
        ewRadar:addConnectionNode(connectionNodeEW)
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--add the variable for the CAP Scripting
syriaIADS:addMooseSetGroup(DetectionSetGroup)



end