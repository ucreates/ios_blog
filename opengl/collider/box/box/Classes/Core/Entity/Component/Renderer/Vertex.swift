// ======================================================================
// Project Name    : box
//
// Copyright © 2017 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import GLKit
public struct Vertex {
    enum Attributes: GLuint {
        case position = 0
        case color = 1
        case texCoord = 2
    }
    var x: GLfloat = 0.0
    var y: GLfloat = 0.0
    var z: GLfloat = 0.0
    var r: GLfloat = 0.0
    var g: GLfloat = 0.0
    var b: GLfloat = 0.0
    var a: GLfloat = 1.0
    var u: GLfloat = 0.0
    var v: GLfloat = 0.0
    init(_ x: GLfloat, _ y: GLfloat, _ z: GLfloat, _ r: GLfloat = 0.0, _ g: GLfloat = 0.0, _ b: GLfloat = 0.0, _ a: GLfloat = 1.0, _ u: GLfloat = 0.0, _ v: GLfloat = 0.0) {
        self.x = x
        self.y = y
        self.z = z
        self.r = r
        self.g = g
        self.b = b
        self.a = a
        self.u = u
        self.v = v
    }
}
