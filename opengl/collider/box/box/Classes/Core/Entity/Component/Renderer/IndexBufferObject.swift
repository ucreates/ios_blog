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
open class IndexBufferObject {
    open var id: GLuint = 0
    open func create(indices: [GLubyte]) -> Void {
        let glUbyteSize: Int = MemoryLayout<GLubyte>.size
        let dataSize: Int = indices.count * glUbyteSize
        glGenBuffers(GLsizei(1), &self.id)
        glBindBuffer(GLenum(GL_ELEMENT_ARRAY_BUFFER), self.id)
        glBufferData(GLenum(GL_ELEMENT_ARRAY_BUFFER), dataSize, indices, GLenum(GL_STATIC_DRAW))
        return
    }
}
