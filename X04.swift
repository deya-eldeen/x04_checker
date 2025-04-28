import UIKit

extension UIDevice {
    /// Simulator detection
    var x102: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }

    /// Jailbreak check using multiple heuristics
    var x04: Bool {
        guard !UIDevice.current.x102 else { return false }
        return X04.x301() || X04.x302() || X04.x303() || X04.x304()
    }
}

private struct X04 {
    // MARK: - Scheme from xcconfig (X0R_KEY) or default "cydia"
    private static let xKey: String = {
        if let raw = Bundle.main.object(forInfoDictionaryKey: "X0R_KEY") as? String {
            return reverse(raw)
        }
        return reverse("aidyc")
    }()

    // MARK: - URL Scheme Check
    static func x301() -> Bool {
        guard let url = URL(string: "\(reverse(xKey))://") else { return false }
        return UIApplication.shared.canOpenURL(url)
    }

    // MARK: - File Existence Checks
    static func x302() -> Bool { hasSuspicious(list: x801) }
    static func x303() -> Bool { hasSuspicious(list: x802) }

    // MARK: - Write Test
    static func x304() -> Bool {
        let testPath = reverse("redisnI repoleveD")
        do {
            try " ".write(toFile: testPath, atomically: true, encoding: .utf8)
            return true
        } catch {
            return false
        }
    }

    // MARK: - Helpers
    private static func hasSuspicious(list: [String]) -> Bool {
        for path in list where FileManager.default.fileExists(atPath: path) {
            return true
        }
        return false
    }

    private static func reverse(_ s: String) -> String {
        String(s.reversed())
    }

    // MARK: - Suspicious Paths
    static var x801: [String] {
        [
            reverse("/Applications/Cydia.app"),
            reverse("/Applications/blackra1n.app"),
            reverse("/Applications/FakeCarrier.app"),
            reverse("/Applications/unc0ver.app"),
            reverse("/private/var/lib/apt"),
            reverse("/usr/sbin/sshd"),
            reverse("/bin/bash"),
            reverse("/etc/apt"),
            reverse("/usr/bin/ssh")
        ]
    }

    static var x802: [String] {
        [
            reverse("/Library/MobileSubstrate/MobileSubstrate.dylib"),
            reverse("/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist"),
            reverse("/private/var/stash"),
            reverse("/private/var/tmp/cydia.log"),
            reverse("/private/var/lib/cydia/info"),
            reverse("/private/var/mobile/Library/SBSettings/Themes"),
            reverse("/usr/libexec/ssh-keysign")
        ]
    }
}
