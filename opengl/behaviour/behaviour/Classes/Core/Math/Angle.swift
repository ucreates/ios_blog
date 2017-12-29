// ======================================================================
// Project Name    : behaviour
//
// Copyright © 2017 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import Foundation
open class Angle {
    open static func toDegree(radian: Float) -> Float {
        return radian * 180.0 / .pi
    }
    open static func toRadian(degree: Float) -> Float {
        return degree * .pi / 180.0
    }
}
