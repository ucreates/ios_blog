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
open class GLES2Renderer: BaseRenderer {
    open override func create(renderAsset model: BaseModelAsset) -> Bool {
        if (nil == self.vartexSharder || nil == self.fragmentSharder) {
            TraceUtility.log(val: "invalid shader")
            return false
        }
        self.vartexSharder.compile()
        self.fragmentSharder.compile()
        self.programHandle = glCreateProgram()
        let vhandle: GLuint = vartexSharder.getHandle()
        let fhandle: GLuint = fragmentSharder.getHandle()
        glAttachShader(self.programHandle, vhandle)
        glAttachShader(self.programHandle, fhandle)
        if(BaseModelAsset.CUBE == model.type) {
            glBindAttribLocation(self.programHandle, Vertex.Attributes.position.rawValue, "a_Position")
            glBindAttribLocation(self.programHandle, Vertex.Attributes.color.rawValue, "a_Color")
        } else if (BaseModelAsset.TEXTURE == model.type) {
            glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_MAG_FILTER), GL_NEAREST)
            glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_MIN_FILTER), GL_NEAREST)
            glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_WRAP_S), GL_CLAMP_TO_EDGE)
            glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_WRAP_T), GL_CLAMP_TO_EDGE)
            glBindAttribLocation(self.programHandle, Vertex.Attributes.position.rawValue, "a_Position")
            glBindAttribLocation(self.programHandle, Vertex.Attributes.color.rawValue, "a_Color")
            glBindAttribLocation(self.programHandle, Vertex.Attributes.texCoord.rawValue, "a_TexCoord")
        }
        glLinkProgram(self.programHandle)
        var linkStatus: GLint = 0
        glGetProgramiv(self.programHandle, GLenum(GL_LINK_STATUS), &linkStatus)
        if (GL_FALSE == linkStatus) {
            var infoLength: GLsizei = 0
            let bufferLength: GLsizei = 1024
            let info: [GLchar] = Array(repeating: GLchar(0), count: Int(bufferLength))
            var actualLength: GLsizei = 0
            glGetProgramiv(self.programHandle, GLenum(GL_INFO_LOG_LENGTH), &infoLength)
            glGetProgramInfoLog(self.programHandle, bufferLength, &actualLength, UnsafeMutablePointer(mutating: info))
            glDeleteProgram(self.programHandle)
            TraceUtility.log(val: info)
            return false
        }
        return true
    }
    open override func render(renderAsset: BaseModelAsset) -> Void {
        let camera: GLES2Camera = GLES2Camera.getInstance()
        let projectionMatrix: GLKMatrix4 = camera.getProjectionMatrix()
        let viewMatrix: GLKMatrix4 = camera.getViewMatrix()
        let modelMatrix: GLKMatrix4 = renderAsset.transform.getMatrix()
        let modelViewMatrix: GLKMatrix4 = GLKMatrix4Multiply(viewMatrix, modelMatrix)
        let pmtx: [Float] = projectionMatrix.array
        let mvmtx: [Float] = modelViewMatrix.array
        glEnable(GLenum(GL_DEPTH_TEST))
        glEnable(GLenum(GL_CULL_FACE))
        glEnable(GLenum(GL_BLEND))
        glBlendFunc(GLenum(GL_SRC_ALPHA), GLenum(GL_ONE_MINUS_SRC_ALPHA))
        glUseProgram(self.programHandle)
        if(BaseModelAsset.CUBE == renderAsset.type) {
            self.vartexSharder.updateMatrix(programHandle: self.programHandle, uniformName: "u_ProjectionMatrix", matrixArray: pmtx)
            self.vartexSharder.updateMatrix(programHandle: self.programHandle, uniformName: "u_ModelViewMatrix", matrixArray: mvmtx)
            self.vartexSharder.updateVertex(programHandle: self.programHandle, attributeName: "a_Position", size: VertexBufferObject.COORDS_PER_VERTEX, vbo: renderAsset.vbo)
            self.vartexSharder.updateVertex(programHandle: self.programHandle, attributeName: "a_Color", size: VertexBufferObject.COLORS_PER_VERTEX, vbo: renderAsset.vbo)
        } else if (BaseModelAsset.TEXTURE == renderAsset.type) {
            let textureAsset: TextureAsset = renderAsset as! TextureAsset
            glActiveTexture(GLenum(GL_TEXTURE1))
            glBindTexture(GLenum(GL_TEXTURE_2D), textureAsset.textureId)
            self.vartexSharder.updateMatrix(programHandle: self.programHandle, uniformName: "u_ProjectionMatrix", matrixArray: pmtx)
            self.vartexSharder.updateMatrix(programHandle: self.programHandle, uniformName: "u_ModelViewMatrix", matrixArray: mvmtx)
            self.vartexSharder.updateVertex(programHandle: self.programHandle, attributeName: "a_Position", size: VertexBufferObject.COORDS_PER_VERTEX, vbo: renderAsset.vbo)
            self.vartexSharder.updateVertex(programHandle: self.programHandle, attributeName: "a_Color", size: VertexBufferObject.COLORS_PER_VERTEX, vbo: renderAsset.vbo)
            self.vartexSharder.updateVertex(programHandle: self.programHandle, attributeName: "a_TexCoord", size: VertexBufferObject.UV_PER_VERTEX, vbo: renderAsset.vbo)
            self.fragmentSharder.updateTexture(programHandle: self.programHandle, uniformName: "u_Texture")
        }
        glBindBuffer(GLenum(GL_ARRAY_BUFFER), renderAsset.vbo.id)
        glBindBuffer(GLenum(GL_ELEMENT_ARRAY_BUFFER), renderAsset.ibo.id)
        glDrawElements(GLenum(GL_TRIANGLES), GLsizei(GLuint(renderAsset.indices.count)), GLenum(GL_UNSIGNED_BYTE), nil)
        if(BaseModelAsset.CUBE == renderAsset.type) {
            self.vartexSharder.disableVertex(programHandle: self.programHandle, attributeName: "a_Position")
            self.vartexSharder.disableVertex(programHandle: self.programHandle, attributeName: "a_Color")
        } else if (BaseModelAsset.TEXTURE == renderAsset.type) {
            glDisable(GLenum(GL_TEXTURE_2D))
            self.vartexSharder.disableVertex(programHandle: self.programHandle, attributeName: "a_Position")
            self.vartexSharder.disableVertex(programHandle: self.programHandle, attributeName: "a_Color")
            self.vartexSharder.disableVertex(programHandle: self.programHandle, attributeName: "a_TexCoord")
        }
        glDisable(GLenum(GL_DEPTH_TEST))
        glDisable(GLenum(GL_CULL_FACE))
        glDisable(GLenum(GL_BLEND))
        glUseProgram(0)
        return
    }
}
