//  Created by Deya AlDeen on 26/09/2021.

import Foundation
import UIKit

extension UIDevice {
    var x102: Bool {return TARGET_OS_SIMULATOR != 0}
    
    var x04: Bool {
        get {
            if UIDevice.current.x102 { return false }
            if X04.x301() { return true }
            if X04.x302() { return true }
            if X04.x303() { return true }
            return X04.x304()
        }
    }
    
}

private struct X04 {
    
    static func x301() -> Bool {
        let x11011 = String("aidyc".reversed())+"://"
        return UIApplication.shared.canOpenURL(URL(string: x11011)!)
    }
    
    static func x302() -> Bool {
        for path in x801 {
            if FileManager.default.fileExists(atPath: path) {return true}
        }
        return false
    }
    
    static func x303() -> Bool {
        for path in x802 {
            if FileManager.default.fileExists(atPath: path) {return true}
        }
        return false
    }
    
    static func x304() -> Bool {
        let xx100 = String("redisnI repoleveD".reversed())
        do {
            try xx100.write(toFile: xx100, atomically: true, encoding: .utf8)
            return true
        } catch {
            return false
        }
    }
    
    static var x801: [String] {
        let x00000 = "/Ap"+"plications"
        let x00001 = "ppa.".reversed()
        let x00101 = "aidyC".reversed()
        let x00102 = "n1arkcalb".reversed()
        let x00103 = "reirraCekaF".reversed()
        let x00104 = "ycI".reversed()
        let x00105 = "neercSilletnI".reversed()
        let x00106 = "ebuTxM".reversed()
        let x00107 = "ppAkcoR".reversed()
        let x00108 = "sgnitteSBS".reversed()
        let x00109 = "draoBretniW".reversed()

        return ["\(x00000)/\(x00101)\(x00001)",
                "\(x00000)/\(x00102)\(x00001)",
                "\(x00000)/\(x00103)\(x00001)",
                "\(x00000)/\(x00104)\(x00001)",
                "\(x00000)/\(x00105)\(x00001)",
                "\(x00000)/\(x00106)\(x00001)",
                "\(x00000)/\(x00107)\(x00001)",
                "\(x00000)/\(x00108)\(x00001)",
                "\(x00000)/\(x00109)\(x00001)"
        ]
    }
    
    static var x802: [String] {
        
        return [
                String("bilyd.etartsbuSeliboM/etartsbuSeliboM/yrarbiL/".reversed()),
                String("hsab/nib/".reversed()),
                String("tpa/cte/".reversed()),
                String("dhss/nibs/rsu/".reversed()),
                String("revres-ptfs/cexebil/rsu/".reversed()),
                String("dhss/nib/rsu/".reversed()),
                String("tsilp.putratS.aidyC.kiruas.moc/snomeaDhcnuaL/yrarbiL/metsyS/".reversed()),
                String("tsilp.tobb.yeki.moc/snomeaDhcnuaL/yrarbiL/metsyS/".reversed()),
                String("gol.aidyc/pmt/rav/etavirp/".reversed()),
                String("hsats/rav/etavirp/".reversed()),
                String("semehT/sgnitteSBS/yrarbiL/elibom/rav/etavirp/".reversed()),
                String("aidyc/bil/rav/etavirp/".reversed()),
                String("/tpa/bil/rav/etavirp/".reversed()),
                String("tpa/bil/rav/etavirp/".reversed()),
                String("tsilp.ycneeV/seirarbiLcimanyD/etartsbuSeliboM/yrarbiL/".reversed()),
                String("tsilp.kcolCeviL/seirarbiLcimanyD/etartsbuSeliboM/yrarbiL/".reversed()),
        ]
    }
    
}
