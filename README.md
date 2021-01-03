# Nodemcu double reset for wifi setup

Features:
  * after hardware reset the LED on pin D4 will glim dimmed for 2 seconds, click reset again during that time in order to turn wifi setup on
  * while in wifi-setup mode the LED keeps flashing
  * wifi setup mode ends automatically after successful wifi setup
  * the accesspoint name and password to be used for the wifi setup are configuratble in [config.lua]()
  * the wifi setup screen supports custom parameters as described in [enduser-setup](https://nodemcu.readthedocs.io/en/release/modules/enduser-setup/)
  * the custom parametrers will be storred in [params.lua]()

Hot it works:
  * the mechnism is based on changing the startup file for the lua interpreter if, and only if, the hardware reset is used
  * in normal mode the startup file is init.lua
  * on hardware reset the init.lua calls [_reset1.lua](), which changed the startup file to [_reset2.lua]() and changes it back to [init.lua]() after 2 seconds
  * if within those 2 seconds another reset occurs, then [_reset2.lua]() will run and provide the wifi setup
  * when the wifi setup succeeds then the startup file will be changed back to [init.lua]()

Todo:
  * compacitify to use less processor cycles in normal mode - to reduce power consumption, it's not bad as is but can likely be improved
  * im wifi setup default the additional custom parameters to values previously set, so that e.g. the device-name doesn't need to be reentered
