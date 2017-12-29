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
open class VertexBufferObject {
    open static let COORDS_PER_VERTEX: Int = 3
    open static let COLORS_PER_VERTEX: Int = 4
    open static let UV_PER_VERTEX: Int = 2
    open static let POSITION_START_POINTER: UnsafeRawPointer? = UnsafeRawPointer.init(bitPattern: 0)
    open static let COLOR_START_POINTER: UnsafeRawPointer? = UnsafeRawPointer.init(bitPattern: VertexBufferObject.COORDS_PER_VERTEX * MemoryLayout<GLfloat>.size)
    open static let UV_START_POINTER: UnsafeRawPointer? = UnsafeRawPointer.init(bitPattern: (VertexBufferObject.COORDS_PER_VERTEX + VertexBufferObject.COLORS_PER_VERTEX) * MemoryLayout<GLfloat>.size)
    open var id: GLuint = 0
    open var stride: Int = 0
    open func create(vertices: [GLfloat], rendereAssetType: Int) -> Void {
        let vertexSize: Int = MemoryLayout<GLfloat>.size
        let glfloatSize: Int = MemoryLayout<GLfloat>.size
        let dataSize: Int = vertices.count * vertexSize
        glGenBuffers(GLsizei(1), &self.id)
        glBindBuffer(GLenum(GL_ARRAY_BUFFER), self.id)
        glBufferData(GLenum(GL_ARRAY_BUFFER), dataSize, vertices, GLenum(GL_STATIC_DRAW))
        glEnableVertexAttribArray(Vertex.Attributes.position.rawValue)
        glVertexAttribPointer(Vertex.Attributes.position.rawValue, GLint(VertexBufferObject.COLORS_PER_VERTEX), GLenum(GL_FLOAT), GLboolean(GL_FALSE), GLsizei(vertexSize), VertexBufferObject.POSITION_START_POINTER)
        glEnableVertexAttribArray(Vertex.Attributes.color.rawValue)
        glVertexAttribPointer(Vertex.Attributes.color.rawValue, GLint(VertexBufferObject.COLORS_PER_VERTEX), GLenum(GL_FLOAT), GLboolean(GL_FALSE), GLsizei(vertexSize), VertexBufferObject.COLOR_START_POINTER)
        glEnableVertexAttribArray(Vertex.Attributes.texCoord.rawValue)
        glVertexAttribPointer(Vertex.Attributes.texCoord.rawValue, GLint(VertexBufferObject.UV_PER_VERTEX), GLenum(GL_FLOAT), GLboolean(GL_FALSE), GLsizei(vertexSize), VertexBufferObject.UV_START_POINTER)
        self.stride = (VertexBufferObject.COORDS_PER_VERTEX + VertexBufferObject.COLORS_PER_VERTEX + VertexBufferObject.UV_PER_VERTEX) * glfloatSize
        return
    }
}
