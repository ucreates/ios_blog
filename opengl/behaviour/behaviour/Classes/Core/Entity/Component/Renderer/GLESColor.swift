// ======================================================================
// Project Name    : behaviour
//
// Copyright © 2017 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import GLKit
public class GLESColor {
    open var r: GLfloat = 0.0
    open var g: GLfloat = 0.0
    open var b: GLfloat = 0.0
    open var a: GLfloat = 1.0
    init(r: GLfloat = 0.0, g: GLfloat = 0.0, b: GLfloat = 0.0, a: GLfloat = 1.0) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
}
