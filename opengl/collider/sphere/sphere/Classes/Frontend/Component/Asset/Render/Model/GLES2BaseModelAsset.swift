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
open class GLES2BaseModelAsset: BaseRenderAsset {
    open static let CUBE: Int = 1
    open static let TEXTURE: Int = 2
    open var vbo: VertexBufferObject!
    open var ibo: IndexBufferObject!
    open var vertices: [GLfloat]!
    open var indices: [GLubyte]!
    open var transform: Transform!
    open var color: GLESColor!
    open var type: Int!
    init(type: Int!) {
        self.color = GLESColor(r: 1.0, g: 1.0, b: 1.0, a: 1.0)
        self.type = type
    }
    open func create() -> Void {
        self.vbo = VertexBufferObject()
        self.vbo.create(vertices: self.vertices, rendereAssetType: self.type)
        self.ibo = IndexBufferObject()
        self.ibo.create(indices: self.indices)
        self.transform = Transform()
        return
    }
}
