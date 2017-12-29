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
import GLKit
open class BaseRenderer {
    var programHandle: GLuint!
    var vartexSharder: GLES2ShaderAsset!
    var fragmentSharder: GLES2ShaderAsset!
    init() {
        self.programHandle = 0
        self.vartexSharder = nil
        self.fragmentSharder = nil
    }
    open func create(renderAsset: GLES2BaseModelAsset) -> Bool {
        return true
    }
    open func render(renderAsset: GLES2BaseModelAsset) -> Void {
        return
    }
    open func setVertexShader(shader: GLES2ShaderAsset) -> Void {
        self.vartexSharder = shader
        return
    }
    open func setFragmentShader(shader: GLES2ShaderAsset) -> Void {
        self.fragmentSharder = shader
        return
    }
}
