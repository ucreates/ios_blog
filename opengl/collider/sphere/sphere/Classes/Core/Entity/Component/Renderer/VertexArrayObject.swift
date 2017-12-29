// ======================================================================
// Project Name    : sphere
//
// Copyright © 2017 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import GLKit
open class VertexArrayObject {
    open var arrays: GLuint = 0
    open func create() -> Void {
        glGenVertexArraysOES(1, &self.arrays)
        glBindVertexArrayOES(self.arrays)
        return
    }
}
