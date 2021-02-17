-----------------------------------------------------------------------------------------------------------------
--------------------------------------CARRIER SETUP - SYRIA TEMPLATE --------------------------------------------
-----------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------
--SETUP S3B RECOVERY TANKER CVN-73 George Washington
-----------------------------------------------------------------------------------------------------------------
local tanker=RECOVERYTANKER:New("CVN-73 George Washington", "Texaco")
tanker:SetTakeoffAir()
tanker:SetTACAN(10, "TKR")
tanker:SetRadio(260)
tanker:__Start(1)

-----------------------------------------------------------------------------------------------------------------
-- E-2D SET AS AIRSPAWN OVER CARRIER
-----------------------------------------------------------------------------------------------------------------


local awacs=RECOVERYTANKER:New("CVN-73 George Washington", "AWACS E2D")
awacs:SetAWACS()
awacs:SetCallsign(CALLSIGN.AWACS.Wizard, 1)
awacs:SetTakeoffAir()
awacs:SetAltitude(20000)
awacs:SetRacetrackDistances(30, 15)
awacs:SetRadio(300)
awacs:SetModex(611)
awacs:SetTACAN(2, "WIZ")
awacs:__Start(1)

-----------------------------------------------------------------------------------------------------------------
-- SET RESCUE ELICOPTER ON CARRIER
-----------------------------------------------------------------------------------------------------------------

Rescuehelo=RESCUEHELO:New(UNIT:FindByName("CVN-73 George Washington"), "UH60RESCUE")
Rescuehelo:SetTakeoffAir()
Rescuehelo:SetModex(42)
Rescuehelo:__Start(1)

