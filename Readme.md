checks if the application is running on a jailbroken device

based on: https://developerinsider.co/best-way-to-check-if-your-ios-app-is-running-on-a-jailbroken-phone/
By Vineet Choudhary

with two improvements
- making reverse engineering more difficult by
  - changed variable names
  - and obfuscated strings
- suggesting having the scheme value encrypted in an xcconfig

usage

  if UIDevice.current.x04 {
  }


⚠️ note: the author warns about adding cydia to LSApplicationQueriesSchemes in info.plist

a much more secure way is having $(X0R_KEY) variable called from an xcconfig file, that have the string computed and not static.
