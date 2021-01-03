local _,r = node.bootreason()
if r == 6 then node.startup({command="@_reset1.lua"}) node.restart() end
dofile('params.lua')

dofile('config.lua')

print('normal operation goes here')
print('Additional paramerter from WIFI setup page: deepSleepSec='..deepSleepSec)
print('Additional paramerter from WIFI setup page: device_name='..device_name)

-- use device_name to identify your sensor when sending data to the web
-- use deepSleepSec to sleep between sensor measurements

-- rtctime.dsleep(deepSleepSec * 1000000, 4)

tmr.create():alarm(deepSleepSec * 1000, tmr.ALARM_AUTO, function()
  print('read a sensor value and send it to the web')
end)
