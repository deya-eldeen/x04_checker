X04 checks if an iOS application is running on a jailbroken device..
based on code by By Vineet Choudhary

with two improvements
- making reverse engineering more difficult by
  - changed variable names
  - and obfuscated strings
- suggesting having the scheme value encrypted in an xcconfig

usage

  if UIDevice.current.x04 {
  }

==================

⚠️ note: the author asks for adding cydia to LSApplicationQueriesSchemes in info.plist

a much more secure way is having $(X0R_KEY) variable called from an xcconfig file, that have the string computed using concatenation

xcconfig concatenation

// X0R

  X0R_KEY_A = sec

  X0R_KEY_B = re

  X0R_KEY_C = t

  X0R_KEY = $(X0R_KEY_A)$(X0R_KEY_B)$(X0R_KEY_C)

==================

resource https://developerinsider.co/best-way-to-check-if-your-ios-app-is-running-on-a-jailbroken-phone/
