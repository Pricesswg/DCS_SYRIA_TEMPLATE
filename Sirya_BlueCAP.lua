-----------------------------------------------------------------------------------------------------------------
------------------------------CAP BLUE ZONE SCRIPTING - SIRYA DYNAMIC TEMPLATE -----------------------------------
-----------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- DEFINE THE SET:GROUP OBJECT THAT BUILDS A COLLECTION OF GROUPS THAT DEFINE THE EWR NETWORK.
-- HERE WE BUILD THE NETWORK WHIT ALL THE GROUPS THAT HAVE A NAME STARTING WHIT EWR AND EW.        
-------------------------------------------------------------------------------------------------------------------

DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes("BLUEEWR", "AWACS")
DetectionSetGroup:FilterStart()
Detection = DETECTION_AREAS:New( DetectionSetGroup, 42000 )

-------------------------------------------------------------------------------------------------------------------
-- SETUP THE DISPATCHER, AND INITIALIZE IT.            
-------------------------------------------------------------------------------------------------------------------

A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
A2ADispatcher:SetEngageRadius( 40000 )

-------------------------------------------------------------------------------------------------------------------
-- SETUP THE BORDER
-- INITIALIZE THE DISPATCHER, SETTING UP A BORDER ZONE. THIS IS A POLYGON,
-- WHICH TAKES THE WAYPOINTS OF A LATE ACTIVATED GROUP WHIT THE NAME redborder AS THE BOUNDARIES OF THE BORDER AREA 
-- ANY ENEMY CROSSING THIS BORDER WILL BE ENGAGED
-------------------------------------------------------------------------------------------------------------------

BlueZone = ZONE_POLYGON:New( "blueborder", GROUP:FindByName( "blueborder" ) )

A2ADispatcher:SetBorderZone( {BlueZone} )

CAPZoneBlueBorder = ZONE_POLYGON:New( "blueborder", GROUP:FindByName( "blueborder" ) )
BLUECAPSX = ZONE_POLYGON:New( "BLUECAPSX", GROUP:FindByName( "BLUECAPSX" ) )
BLUECAPNORD = ZONE_POLYGON:New("BLUECAPNORD",GROUP:FindByName( "BLUECAPNORD" ) )
BLUECAPDX = ZONE_POLYGON:New( "BLUECAPDX", GROUP:FindByName( "BLUECAPDX" ) )
BLUECAPSOUTH = ZONE_POLYGON:New( "BLUECAPSOUTH", GROUP:FindByName( "BLUECAPSOUTH" ) )

-------------------------------------------------------------------------------------------------------------------
--DEFINE THE CAP GROUP FOR ISRAEL
-------------------------------------------------------------------------------------------------------------------

IsraelCAPTemplates = {
    "BLUESQ F15 1",
    "BLUESQ F15 2",
    "BLUESQ F16 1",
    "BLUESQ F16 2"
    }


-------------------------------------------------------------------------------------------------------------------
-- CAP SQUADRONS
-------------------------------------------------------------------------------------------------------------------

--BLUECAPSX
A2ADispatcher:SetSquadron( "BLUESX", AIRBASE.Syria.Ramat_David, IsraelCAPTemplates )
--BLUECAPNORD
A2ADispatcher:SetSquadron( "BLUENORD", AIRBASE.Syria.Ramat_David, IsraelCAPTemplates )
--BLUECAPDX
A2ADispatcher:SetSquadron( "BLUEDX", AIRBASE.Syria.Ramat_David, IsraelCAPTemplates )
--BLUECAPSOUTH
A2ADispatcher:SetSquadron( "BLUESOUTH", AIRBASE.Syria.Ramat_David, IsraelCAPTemplates )

-------------------------------------------------------------------------------------------------------------------
--AIRBASE OF SYRIA, USE THEM TO DEFINE THE AIRFIELD OF DEPARTURE.
-------------------------------------------------------------------------------------------------------------------

    --AIRBASE.Syria.Kuweires
    --AIRBASE.Syria.Marj_Ruhayyil
    --AIRBASE.Syria.Kiryat_Shmona
    --AIRBASE.Syria.Marj_as_Sultan_North
    --AIRBASE.Syria.Eyn_Shemer
    --AIRBASE.Syria.Incirlik
    --AIRBASE.Syria.Damascus
    --AIRBASE.Syria.Bassel_Al_Assad
    --AIRBASE.Syria.Aleppo
    --AIRBASE.Syria.Qabr_as_Sitt
    --AIRBASE.Syria.Wujah_Al_Hajar
    --AIRBASE.Syria.Al_Dumayr
    --AIRBASE.Syria.Hatay
    --AIRBASE.Syria.Haifa
    --AIRBASE.Syria.Khalkhalah
    --AIRBASE.Syria.Megiddo
    --AIRBASE.Syria.Rayak
    --AIRBASE.Syria.Mezzeh
    --AIRBASE.Syria.King_Hussein_Air_College
    --AIRBASE.Syria.Jirah
    --AIRBASE.Syria.Taftanaz
    --AIRBASE.Syria.Rene_Mouawad
    --AIRBASE.Syria.Ramat_David
    --AIRBASE.Syria.Minakh
    --AIRBASE.Syria.Adana_Sakirpasa
    --AIRBASE.Syria.Marj_as_Sultan_South
    --AIRBASE.Syria.Hama
    --AIRBASE.Syria.Al_Qusayr
    --AIRBASE.Syria.Palmyra
    --AIRBASE.Syria.Tabqa
    --AIRBASE.Syria.Beirut_Rafic_Hariri
    --AIRBASE.Syria.An_Nasiriyah
    --AIRBASE.Syria.Abu_al_Duhur


-------------------------------------------------------------------------------------------------------------------    
--DEFINE THE DEFAULT TAKEOFF ALTITUDE FOR THE AIR SPAWNED AIRCRAFT
-------------------------------------------------------------------------------------------------------------------
A2ADispatcher:SetDefaultTakeoffInAirAltitude( 8000 )    

-------------------------------------------------------------------------------------------------------------------
--DEFINE THE TAKEOFF METHOD FOR THE SQUADRONS
-------------------------------------------------------------------------------------------------------------------

--BLUECAPSX
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "BLUESX" )
--BLUECAPNORD
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "BLUENORD" )
--BLUECAPDX
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "BLUEDX" )
--BLUECAPSOUTH
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "BLUESOUTH" )


-------------------------------------------------------------------------------------------------------------------
--DEFINE THE DEFAULT LANDING AND DESPAWN METHOD FOR THE CAP SQUADRONS
-------------------------------------------------------------------------------------------------------------------
--BLUECAPSX
A2ADispatcher:SetSquadronLandingAtRunway( "BLUESX" )
--BLUECAPNORD
A2ADispatcher:SetSquadronLandingAtRunway( "BLUENORD" )
--BLUECAPDX
A2ADispatcher:SetSquadronLandingAtRunway( "BLUEDX" )
--BLUECAPSOUTH
A2ADispatcher:SetSquadronLandingAtRunway( "BLUESOUTH" )


-------------------------------------------------------------------------------------------------------------------
--DEFINE THE PARAMETERS FOR THE SPAWN OF THE SQUADRONS, THE ORIGINAL TIMING IS 300/750 
-------------------------------------------------------------------------------------------------------------------

--BLUECAPSX
A2ADispatcher:SetSquadronCap( "BLUESX", BLUECAPSX, 8000, 10000, 500, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "BLUESX", 2, 24, 900, 1 )
--BLUECAPNORD
A2ADispatcher:SetSquadronCap( "BLUENORD", BLUECAPNORD, 8000, 15000, 500, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "BLUENORD", 2, 20, 600, 1 )
--BLUECAPDX
A2ADispatcher:SetSquadronCap( "BLUEDX", BLUECAPDX, 8000, 10000, 500, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "BLUEDX", 2, 22, 800, 1 )
--BLUECAPSOUTH
A2ADispatcher:SetSquadronCap( "BLUESOUTH", BLUECAPSOUTH, 10000, 15000, 500, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "BLUESOUTH", 2, 26, 700, 1 )


-------------------------------------------------------------------------------------------------------------------
--DEFINE THE GROUPING OF THE SQUADRONS
-------------------------------------------------------------------------------------------------------------------

--BLUECAPSX
A2ADispatcher:SetSquadronGrouping( "BLUESX", 2 )
--BLUECAPNORD
A2ADispatcher:SetSquadronGrouping( "BLUENORD", 2 )
--BLUECAPDX
A2ADispatcher:SetSquadronGrouping( "BLUEDX", 2 )
--BLUECAPSOUTH
A2ADispatcher:SetSquadronGrouping( "BLUESOUTH", 2 )


-------------------------------------------------------------------------------------------------------------------
--DEFINE THE DEFAULT OVERHEAD FOR THE SQUADRONS, DEFAULT IS 1.0/1.5
-------------------------------------------------------------------------------------------------------------------

--BLUECAPSX
A2ADispatcher:SetSquadronOverhead( "BLUESX", 1.0)
--BLUECAPNORD
A2ADispatcher:SetSquadronOverhead( "BLUENORD", 1.0)
--BLUECAPDX
A2ADispatcher:SetSquadronOverhead( "BLUEDX", 1.0)
--BLUECAPSOUTH
A2ADispatcher:SetSquadronOverhead( "BLUESOUTH", 1.0)


-------------------------------------------------------------------------------------------------------------------
 -- DET THE DEFAULT FUEL THRESHOLD
-------------------------------------------------------------------------------------------------------------------

 --A2ADispatcher:SetSquadronFuelThreshold( "BLUESX", 0.30 )  -- Go RTB when only 30% of fuel remaining in the tank.
 --A2ADispatcher:SetSquadronFuelThreshold( "BLUESX", 0.30 )  
 --A2ADispatcher:SetSquadronRefuelThreshold( "BLUESX", 0.30 ) 


-------------------------------------------------------------------------------------------------------------------
-- TEST AA INTERCEPT BY AWACS
-------------------------------------------------------------------------------------------------------------------

AIDispatcher = AI_A2A_GCICAP:New( { "AWACS" } )
AIDispatcher:SetBorderZone( {BlueZone} )
AIDispatcher:SetDefaultTakeoffInAirAltitude( 8000 )

IsraelA2ATemplates = {
    "INTERCEPT F15",
    "INTERCEPT F16"
    }


 AIDispatcher:SetSquadron( "INTERCEPT1", AIRBASE.Syria.Ramat_David, IsraelA2ATemplates, 5 )
 AIDispatcher:SetSquadronGci( "INTERCEPT1", 600, 1000 )

 AIDispatcher:SetSquadron( "INTERCEPT2", AIRBASE.Syria.Ramat_David, IsraelA2ATemplates, 5 )
 AIDispatcher:SetSquadronGci( "INTERCEPT2", 600, 1000 )