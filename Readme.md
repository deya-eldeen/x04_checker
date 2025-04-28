# Jailbreak Detector (X04)

A lightweight, obfuscated Swift extension for `UIDevice` that detects whether your iOS app is running on a jailbroken device.

## Features

- **Multiple heuristics**: URL‐scheme checks, file‐presence scans, and write‐test attempts.  
- **Obfuscated internals**: Uses reversed strings and non‐descriptive identifiers (`x301`, `x802`, etc.) to hinder reverse engineering.  
- **Configurable scheme key**: Pull your custom jailbreak‐app scheme (`cydia://`, `sileo://`, etc.) from an XCConfig variable, not hard‐coded.

## Installation

1. **Add `X04.swift`** to your project.  
2. **Expose your scheme** in Info.plist under `LSApplicationQueriesSchemes`:  
   ```xml
   <key>LSApplicationQueriesSchemes</key>
   <array>
     <string>cydia</string>  <!-- or your custom value -->
   </array>
   ```
3. **Inject your encrypted scheme key** via an `.xcconfig` file:  
   ```ini
   // Breakdown into parts to avoid literal strings
   X0R_KEY_A = sec
   X0R_KEY_B = re
   X0R_KEY_C = t
   X0R_KEY   = $(X0R_KEY_A)$(X0R_KEY_B)$(X0R_KEY_C)
   ```
4. **Point your build setting** to use that XCConfig for Info.plist processing (e.g., in your target’s "Build Settings").

## How It Works

The extension adds two properties on `UIDevice`:

```swift
var x102: Bool   // returns true on Simulator
var x04: Bool    // returns true if any jailbreak check succeeds
```

Internally, `X04` runs four checks:

1. **`x301` – URL Scheme**:  
   Attempts `UIApplication.shared.canOpenURL( URL(string: "<scheme>://") )`.
2. **`x302` & `x303` – File Checks**:  
   Iterates two arrays (`x801`, `x802`) of reversed file paths (e.g. `/Applications/Cydia.app`, `/usr/sbin/sshd`, etc.).
3. **`x304` – Write Test**:  
   Tries writing a dummy file outside the sandbox (e.g. `/DeveloperInsider`) and sees if it succeeds.

> **Note**: Simulator always returns `false` for `x04` to avoid false positives during development.

## Usage

```swift
if UIDevice.current.x04 {
    // Device appears jailbroken—take action (disable features, alert user, etc.)
}
```

## Customization & Extension

- **Add more paths**: Append to the `x801` and `x802` arrays in `JailbreakDetector.swift`.  
- **Swap scheme**: Change the reversed default (`"aidyc"`) or inject a new key via XCConfig.  
- **Logging & Metrics**: Wrap each check in logging calls or send metrics to your analytics backend.

## Credits & Resources

- Original concept by **Vineet Choudhary**.  
- Article: [Best Way to Check if Your iOS App Is Running on a Jailbroken Phone](https://developerinsider.co/best-way-to-check-if-your-ios-app-is-running-on-a-jailbroken-phone/)  

---

> **Security disclaimer**: No jailbreak detection is foolproof. Obfuscation raises the bar, but determined attackers may still bypass checks. Always combine detection with server‐side safeguards and integrity checks.

