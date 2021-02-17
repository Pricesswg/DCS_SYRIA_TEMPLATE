-----------------------------------------------------------------------------------------------------------------
------------------------------CAP RED ZONE SCRIPTING - SIRYA DYNAMIC TEMPLATE -----------------------------------
-----------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- DEFINE THE SET:GROUP OBJECT THAT BUILDS A COLLECTION OF GROUPS THAT DEFINE THE EWR NETWORK.
-- HERE WE BUILD THE NETWORK WHIT ALL THE GROUPS THAT HAVE A NAME STARTING WHIT EWR AND EW.        
-------------------------------------------------------------------------------------------------------------------

DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes("EWR", "EW")
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

RedZone = ZONE_POLYGON:New( "redborder", GROUP:FindByName( "redborder" ) )

A2ADispatcher:SetBorderZone( {RedZone} )

CAPZoneRedBorder = ZONE_POLYGON:New( "redborder", GROUP:FindByName( "redborder" ) )
CAPZONEDX = ZONE_POLYGON:New( "CAPDX", GROUP:FindByName( "CAPDX" ) )
CAPZONEDXBACK = ZONE_POLYGON:New("CAPDXBACK",GROUP:FindByName( "CAPDXBACK" ) )
CAPZONECENTRO = ZONE_POLYGON:New( "CAPCX", GROUP:FindByName( "CAPCX" ) )
CAPZONEBACK = ZONE_POLYGON:New( "CAPZONEBACK", GROUP:FindByName( "CAPZONEBACK" ) )
CAPZONESX = ZONE_POLYGON:New( "CAPZONESX", GROUP:FindByName( "CAPZONESX" ) )
CAPZONESOUTH = ZONE_POLYGON:New( "CAPZONESOUTH", GROUP:FindByName( "CAPZONESOUTH" ) )

-------------------------------------------------------------------------------------------------------------------
-- CAP SQUADRONS
-------------------------------------------------------------------------------------------------------------------

--CAPDX
A2ADispatcher:SetSquadron( "REDSQ Mig21-1", AIRBASE.Syria.Rayak, { "REDSQ Mig21-1"} )
--CAPDXBACK
A2ADispatcher:SetSquadron( "REDSQ Mig29-1", AIRBASE.Syria.Rayak, { "REDSQ Mig29-1"} )
--CAPCENTRO
A2ADispatcher:SetSquadron( "REDSQ Mig23-2", AIRBASE.Syria.Mezzeh, { "REDSQ Mig23-2" } )
--CAPZONEBACK
A2ADispatcher:SetSquadron( "REDSQ Mig29-3", AIRBASE.Syria.Al_Dumayr, { "REDSQ Mig29-3" } )
--CAPZONESX
A2ADispatcher:SetSquadron( "REDSQ Mig29-3", AIRBASE.Syria.Mezzeh, { "REDSQ Mig23-2" } )
--CAPZONESOUTH
A2ADispatcher:SetSquadron( "REDSQ Mig21-5", AIRBASE.Syria.Mezzeh, { "REDSQ Mig21-5" } )

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

--CAPDX
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "REDSQ Mig21-1" )
--CAPDXBACK
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "REDSQ Mig29-1" )
--CAPCX
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "REDSQ Mig23-2" )
--CAPZONEBACK
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "REDSQ Mig29-3" )
--CAPZONESX
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "REDSQ Mig23-2" )
--CAPZONESOUTH
A2ADispatcher:SetSquadronTakeoffFromParkingHot( "REDSQ Mig21-5" )

-------------------------------------------------------------------------------------------------------------------
--DEFINE THE DEFAULT LANDING AND DESPAWN METHOD FOR THE CAP SQUADRONS
-------------------------------------------------------------------------------------------------------------------
--CAPDX
A2ADispatcher:SetSquadronLandingAtRunway( "REDSQ Mig21-1" )
--CAPDXBACK
A2ADispatcher:SetSquadronLandingAtRunway( "REDSQ Mig29-1" )
--CAPCX
A2ADispatcher:SetSquadronLandingAtRunway( "REDSQ Mig23-2" )
--CAPZONEBACK
A2ADispatcher:SetSquadronLandingAtRunway( "REDSQ Mig29-3" )
--CAPZONESX
A2ADispatcher:SetSquadronLandingAtRunway( "REDSQ Mig23-2" )
--CAPZONESOUTH
A2ADispatcher:SetSquadronLandingAtRunway( "REDSQ Mig21-5" )

-------------------------------------------------------------------------------------------------------------------
--DEFINE THE PARAMETERS FOR THE SPAWN OF THE SQUADRONS, THE ORIGINAL TIMING IS 300/750 
-------------------------------------------------------------------------------------------------------------------
--CAPDX
A2ADispatcher:SetSquadronCap( "REDSQ Mig21-1", CAPZONEDX, 8000, 10000, 500, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "REDSQ Mig21-1", 1, 16, 900, 1 )
--CAPDXBACK
A2ADispatcher:SetSquadronCap( "REDSQ Mig29-1", CAPZONEDXBACK, 8000, 15000, 500, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "REDSQ Mig29-1", 1, 10, 1200, 1 )
--CAPCX
A2ADispatcher:SetSquadronCap( "REDSQ Mig23-2", CAPZONECENTRO, 8000, 10000, 500, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "REDSQ Mig23-2", 1, 14, 800, 1 )
--CAPZONEBACK
A2ADispatcher:SetSquadronCap( "REDSQ Mig29-3", CAPZONEBACK, 10000, 15000, 500, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "REDSQ Mig29-3", 2, 16, 1200, 2 )
--CAPZONESX
A2ADispatcher:SetSquadronCap( "REDSQ Mig23-2", CAPZONESX, 8000, 12000, 500, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "REDSQ Mig23-2", 1, 14, 800, 1 )
--CAPZONESOUTH
A2ADispatcher:SetSquadronCap( "REDSQ Mig21-5", CAPZONESOUTH, 10000, 15000, 500, 800, 800, 1200, "BARO" )
A2ADispatcher:SetSquadronCapInterval( "REDSQ Mig21-5", 1, 12, 900, 1 )

-------------------------------------------------------------------------------------------------------------------
--DEFINE THE GROUPING OF THE SQUADRONS
-------------------------------------------------------------------------------------------------------------------
--CAPDX
A2ADispatcher:SetSquadronGrouping( "REDSQ Mig21-1", 2 )
--CAPDXBACK
A2ADispatcher:SetSquadronGrouping( "REDSQ Mig29-1", 1 )
--CAPCX
A2ADispatcher:SetSquadronGrouping( "REDSQ Mig23-2", 2 )
--CAPZONEBACK
A2ADispatcher:SetSquadronGrouping( "REDSQ Mig29-3", 2 )
--CAPZONESX
A2ADispatcher:SetSquadronGrouping( "REDSQ Mig23-2", 2 )
--CAPZONESOUTH
A2ADispatcher:SetSquadronGrouping( "REDSQ Mig21-5", 1 )

-------------------------------------------------------------------------------------------------------------------
--DEFINE THE DEFAULT OVERHEAD FOR THE SQUADRONS, DEFAULT IS 1.0/1.5
-------------------------------------------------------------------------------------------------------------------

--CAPDX
A2ADispatcher:SetSquadronOverhead( "REDSQ Mig21-1", 1.0)
--CAPDXBACK
A2ADispatcher:SetSquadronOverhead( "REDSQ Mig29-1", 1.0)
--CAPCX
A2ADispatcher:SetSquadronOverhead( "REDSQ Mig23-2", 1.0)
--CAPZONEBACK
A2ADispatcher:SetSquadronOverhead( "REDSQ Mig29-3", 1.0)
--CAPZONESX
A2ADispatcher:SetSquadronOverhead( "REDSQ Mig23-2", 1.0)
--CAPZONESOUTH
A2ADispatcher:SetSquadronOverhead( "REDSQ Mig21-5", 1.0)

-------------------------------------------------------------------------------------------------------------------
 -- DET THE DEFAULT FUEL THRESHOLD
-------------------------------------------------------------------------------------------------------------------

 --A2ADispatcher:SetSquadronFuelThreshold( "REDSQ Mig21-1", 0.30 )  -- Go RTB when only 30% of fuel remaining in the tank.
 --A2ADispatcher:SetSquadronFuelThreshold( "REDSQ Mig21-1", 0.30 )  
 --A2ADispatcher:SetSquadronRefuelThreshold( "REDSQ Mig21-1", 0.30 ) 


-------------------------------------------------------------------------------------------------------------------
-- TEST AA INTERCEPT BY AWACS
-------------------------------------------------------------------------------------------------------------------

AIDispatcher = AI_A2A_GCICAP:New( { "EW" } )
AIDispatcher:SetBorderZone( {RedZone} )
AIDispatcher:SetDefaultTakeoffInAirAltitude( 8000 )

SyriaA2ATemplates = {
    "INTERCEPT  Mig29 1",
    "INTERCEPT  Mig29 2"
    }


 AIDispatcher:SetSquadron( "INTERCEPT1", AIRBASE.Syria.Al_Dumayr, SyriaA2ATemplates, 5 )
 AIDispatcher:SetSquadronGci( "INTERCEPT1", 600, 800 )

 AIDispatcher:SetSquadron( "INTERCEPT2", AIRBASE.Syria.Al_Dumayr, SyriaA2ATemplates, 5 )
 AIDispatcher:SetSquadronGci( "INTERCEPT2", 600, 800 )











