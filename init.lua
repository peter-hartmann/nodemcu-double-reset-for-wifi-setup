local _,r = node.bootreason()
if r == 6 then node.startup({command="@_reset1.lua"}) node.restart() end
dofile('params.lua')

dofile('config.lua')

print('normal operation goes here')
print('Additional paramerter from WIFI setup page: deepSleepSec='..deepSleepSec)
print('Additional paramerter from WIFI setup page: device_name='..device_name)
