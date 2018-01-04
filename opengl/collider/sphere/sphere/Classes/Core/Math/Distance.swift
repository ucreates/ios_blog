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
open class Distance {
    open static func create(start: Float, end: Float) -> Float {
        var distance: Float = fabsf(start - end)
        distance = powf(distance, 2)
        return sqrtf(distance)
    }
}
