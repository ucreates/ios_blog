// ======================================================================
// Project Name    : cube
//
// Copyright © 2017 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import Foundation
import GLKit
open class TraceUtility {
    open static let IDENTIFIER: String = "cube"
    open static func log(val: String) -> Void {
        print(TraceUtility.IDENTIFIER + String(describing: val))
        return
    }
    open static func log(val: [GLchar]) -> Void {
        let info: String = String(validatingUTF8: val)!
        TraceUtility.log(val: info)
        return
    }
}
