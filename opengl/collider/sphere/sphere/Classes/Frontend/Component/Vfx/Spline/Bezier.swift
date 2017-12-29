// ======================================================================
// Project Name    : sphere
//
// Copyright © 2017 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import Foundation
import GLKit
open class Bezier {
    open static func create(currentTime: Float, totalTime: Float, start: GLKVector3, control: GLKVector3, end: GLKVector3) -> GLKVector3 {
        var t: Float = currentTime / totalTime
        if (t > 1.0) {
            t = 1.0
        }
        var tp: Float = 1.0 - t
        if (tp < 0.0) {
            tp = 0.0
        }
        let x: Float = t * t * end.x + 2 * t * tp * control.x + tp * tp * start.x
        let y: Float = t * t * end.y + 2 * t * tp * control.y + tp * tp * start.y
        let z: Float = t * t * end.z + 2 * t * tp * control.z + tp * tp * start.z
        return GLKVector3(v: (x, y, z))
    }
    open static func create(currentTime: Float, totalTime: Float, start: GLKVector3, control1: GLKVector3, control2: GLKVector3, end: GLKVector3) -> GLKVector3 {
        var t: Float = currentTime / totalTime
        if (t > 1.0) {
            t = 1.0
        }
        var tp: Float = 1.0 - t
        if (tp < 0.0) {
            tp = 0.0
        }
        let x: Float = t * t * t * end.x + 3 * t * t * tp * control2.x + 3 * t * tp * tp * control1.x + tp * tp * tp * start.x
        let y: Float = t * t * t * end.y + 3 * t * t * tp * control2.y + 3 * t * tp * tp * control1.y + tp * tp * tp * start.y
        let z: Float = t * t * t * end.z + 3 * t * t * tp * control2.z + 3 * t * tp * tp * control1.z + tp * tp * tp * start.z
        return GLKVector3(v: (x, y, z))
    }
}
