// ======================================================================
// Project Name    : texture
//
// Copyright © 2017 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import GLKit
open class GLES2ShaderAsset: BaseRenderAsset {
    fileprivate var handle: GLuint
    fileprivate var path: String
    fileprivate var type: GLuint
    init (shaderAssetPath: String, shaderType: GLenum) {
        self.handle = 0
        self.path = shaderAssetPath
        self.type = shaderType
    }
    open func compile() -> Void {
        let fullPath: String = Bundle.main.path(forResource: self.path, ofType: nil)!
        do {
            let source: NSString = try NSString(contentsOfFile: fullPath, encoding: String.Encoding.utf8.rawValue)
            let handle: GLuint = glCreateShader(self.type)
            var sourceLength: GLint = GLint(Int32(source.length))
            var shaderCString = source.utf8String
            glShaderSource(handle, GLsizei(1), &shaderCString, &sourceLength)
            glCompileShader(handle)
            var status: GLint = 0
            glGetShaderiv(handle, GLenum(GL_COMPILE_STATUS), &status)
            if (GL_FALSE == status) {
                var actualLength: GLsizei = 0
                var infoLength: GLsizei = 0
                let bufferLength: GLsizei = 1024
                let info: [GLchar] = Array(repeating: GLchar(0), count: Int(bufferLength))
                glGetShaderiv(handle, GLenum(GL_INFO_LOG_LENGTH), &infoLength)
                glGetShaderInfoLog(handle, bufferLength, &actualLength, UnsafeMutablePointer(mutating: info))
                TraceUtility.log(val: info)
                self.handle = 0
            } else {
                self.handle = handle
            }
        } catch {
            TraceUtility.log(val: error.localizedDescription)
            self.handle = 0
        }
        return
    }
    open func getHandle() -> GLuint {
        return self.handle
    }
    open func updateMatrix(programHandle: GLuint, uniformName: String, matrixArray: [Float]) -> Void {
        let location: GLint = glGetUniformLocation(programHandle, uniformName)
        glUniformMatrix4fv(location, 1, GLboolean(GL_FALSE), matrixArray)
        return
    }
    open func updateTexture(programHandle: GLuint, uniformName: String) -> Void {
        let location: GLint = glGetUniformLocation(programHandle, uniformName)
        glUniform1i(location, 1)
        return
    }
    open func updateVertex(programHandle: GLuint, attributeName: String, size: Int, vbo: VertexBufferObject) -> Void {
        var startPointer: UnsafeRawPointer? = nil
        if (size == VertexBufferObject.COORDS_PER_VERTEX) {
            startPointer = VertexBufferObject.POSITION_START_POINTER
        } else if (size == VertexBufferObject.COLORS_PER_VERTEX) {
            startPointer = VertexBufferObject.COLOR_START_POINTER
        } else if (size == VertexBufferObject.UV_PER_VERTEX) {
            startPointer = VertexBufferObject.UV_START_POINTER
        }
        self.updateVertex(programHandle: programHandle, attributeName: attributeName, size: GLint(size), type: GLenum(GL_FLOAT), stride: vbo.stride, pointer: startPointer)
        return
    }
    open func updateVertex(programHandle: GLuint, attributeName: String, size: GLint, type: GLenum, stride: Int, pointer: UnsafeRawPointer?) -> Void {
        let location: GLuint = GLuint(glGetAttribLocation(programHandle, attributeName))
        glEnableVertexAttribArray(location)
        glVertexAttribPointer(location, size, type, GLboolean(GL_FALSE), GLsizei(stride), pointer)
        return
    }
    open func disableVertex(programHandle: GLuint, attributeName: String) -> Void {
        let location: GLuint = GLuint(glGetAttribLocation(programHandle, attributeName))
        glDisableVertexAttribArray(location)
        return
    }
}
