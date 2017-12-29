// ======================================================================
// Project Name    : texture
//
// Copyright © 2017 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import Foundation
import GLKit
open class Transform {
    open var position: GLKVector3 = GLKVector3(v: (0.0, 0.0, 0.0))
    open var scale: GLKVector3 = GLKVector3(v: (1.0, 1.0, 1.0))
    open var rotation: GLKVector3 = GLKVector3(v: (0.0, 0.0, 0.0))
    open func getMatrix() -> GLKMatrix4 {
        var matrix: GLKMatrix4 = GLKMatrix4Identity
        matrix = GLKMatrix4Translate(matrix, self.position.x, self.position.y, self.position.z)
        matrix = GLKMatrix4Rotate(matrix, Angle.toRadian(degree: self.rotation.x), 1.0, 0, 0)
        matrix = GLKMatrix4Rotate(matrix, Angle.toRadian(degree: self.rotation.y), 0, 1.0, 0)
        matrix = GLKMatrix4Rotate(matrix, Angle.toRadian(degree: self.rotation.z), 0, 0, 1.0)
        matrix = GLKMatrix4Scale(matrix, self.scale.x, self.scale.y, self.scale.z)
        return matrix
    }
}
