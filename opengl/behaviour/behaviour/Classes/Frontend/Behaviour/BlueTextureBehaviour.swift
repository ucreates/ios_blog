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
open class BlueTextureBehaviour: BaseBehaviour {
    fileprivate var counter: Float!
    override open func onCreate() -> Void {
        let vartexSharder: GLES2ShaderAsset = GLES2ShaderAsset(shaderAssetPath: "Shaderes/Texture/vertex_shader.glsl", shaderType: GLenum(GL_VERTEX_SHADER))
        let fragmentSharder: GLES2ShaderAsset = GLES2ShaderAsset(shaderAssetPath: "Shaderes/Texture/fragment_shader.glsl", shaderType: GLenum(GL_FRAGMENT_SHADER))
        self.renderAsset = TextureAsset(textureAssetPath: "Textures/texture02.png")
        self.renderAsset.create()
        self.renderAsset.transform.position = GLKVector3(v: (1.0, 0.0, 0.0))
        self.renderer = GLES2Renderer()
        self.renderer.setVertexShader(shader: vartexSharder)
        self.renderer.setFragmentShader(shader: fragmentSharder)
        let ret: Bool = self.renderer.create(renderAsset: self.renderAsset)
        if (false == ret) {
            TraceUtility.log(val: "faild create renderer")
            return
        }
        self.counter = 0.0
        return
    }
    override open func onUpdate(delta: TimeInterval) -> Void {
        self.counter = self.counter + 0.1
        let nx: Float = self.renderAsset.transform.position.x
        let ny: Float = sin(self.counter)
        let nz: Float = self.renderAsset.transform.position.z
        self.renderAsset.transform.position = GLKVector3(v: (nx, ny, nz))
        return
    }
}
