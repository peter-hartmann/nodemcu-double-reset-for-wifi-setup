# Nodemcu double reset for wifi setup

Features:
  * after hardware reset the LED on pin D4 will glim dimmed for 2 seconds, click reset again during that time in order to turn wifi setup on
  * while in wifi-setup mode the LED keeps flashing
  * take your phone (or laptop) and connect to the wifi setup hotspot to setup the wifi for the ESP, plus additional custom parametere if applicable
  * wifi setup mode ends automatically after successful wifi setup
  * your phone will (should) automatically go back to your previews wifi connection - a very smooth experience
  * the accesspoint name and password to be used for the wifi setup are configuratble in [config.lua](config.lua)
  * the wifi setup screen supports custom parameters as described in [enduser-setup](https://nodemcu.readthedocs.io/en/release/modules/enduser-setup/)
  * the custom parameters are stored in [params.lua](params.lua) when the wifi setup is done

Hot it works:
  * the mechnism is based on changing the startup file for the lua interpreter if, and only if, the hardware reset is used i.e. neither software reset not waking from deepsleep interfere
  * in normal mode the startup file is init.lua
  * on hardware reset the init.lua calls [_reset1.lua](_reset1.lua), which changed the startup file to [_reset2.lua](_reset2.lua) and changes it back to [init.lua](init.lua) after 2 seconds
  * if within those 2 seconds another reset occurs, then [_reset2.lua](_reset2.lua) will run and provide the wifi setup
  * when the wifi setup succeeds then the startup file will be changed back to [init.lua](init.lua)

Todo:
  * compacitify to use less processor cycles in normal mode - to reduce power consumption, it's not bad as is but can likely be improved
  * im wifi setup default the additional custom parameters to values previously set, so that e.g. the device-name doesn't need to be reentered

Want to help?
  * Feel free to log issues or enhancements requests
  * Pull requests are welcome