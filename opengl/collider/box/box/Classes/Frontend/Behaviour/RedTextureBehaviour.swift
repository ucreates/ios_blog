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
open class RedTextureBehaviour: BaseBehaviour {
    var time: Float = 0
    override init() {
        super.init()
        self.id = 0
    }
    override open func onCreate() -> Void {
        let vartexSharder: GLES2ShaderAsset = GLES2ShaderAsset(shaderAssetPath: "Shaderes/Texture/vertex_shader.glsl", shaderType: GLenum(GL_VERTEX_SHADER))
        let fragmentSharder: GLES2ShaderAsset = GLES2ShaderAsset(shaderAssetPath: "Shaderes/Texture/fragment_shader.glsl", shaderType: GLenum(GL_FRAGMENT_SHADER))
        self.renderAsset = GLES2TextureAsset(GLES2TextureAssetPath: "Textures/texture01.png")
        self.renderAsset.create()
        self.renderAsset.transform.position = GLKVector3(v: (-2.0, 0, 0))
        self.collider = BoxCollider(renderAsset: self.renderAsset)
        self.renderer = GLES2Renderer()
        self.renderer.setVertexShader(shader: vartexSharder)
        self.renderer.setFragmentShader(shader: fragmentSharder)
        let ret: Bool = self.renderer.create(renderAsset: self.renderAsset)
        if (false == ret) {
            return
        }
        return
    }
    override open func onUpdate(delta: TimeInterval) -> Void {
        let npos: GLKVector3 = Bezier.create(currentTime: self.time, totalTime: 5.0, start: GLKVector3(v: (-2.0, 0, 5.0)), control: GLKVector3(v: (-1.0, 5, 2.5)), end: GLKVector3(v: (0.0, 0, 0)))
        let nrx: Float = self.renderAsset.transform.rotation.x + 5
        let nry: Float = self.renderAsset.transform.rotation.y + 5
        let nrz: Float = self.renderAsset.transform.rotation.z + 5
        self.renderAsset.transform.position = npos
        self.renderAsset.transform.rotation = GLKVector3(v: (nrx, nry, nrz))
        self.time += 0.1
        return
    }
    override open func onCollisionEnter(behaviour: BaseBehaviour) -> Void {
        self.destroy = true
        return
    }
}
