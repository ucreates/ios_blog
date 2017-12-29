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
open class TextureBehaviour: BaseBehaviour {
    override open func onCreate() -> Void {
        let vartexSharder: GLES2ShaderAsset = GLES2ShaderAsset(shaderAssetPath: "Shaderes/Texture/vertex_shader.glsl", shaderType: GLenum(GL_VERTEX_SHADER))
        let fragmentSharder: GLES2ShaderAsset = GLES2ShaderAsset(shaderAssetPath: "Shaderes/Texture/fragment_shader.glsl", shaderType: GLenum(GL_FRAGMENT_SHADER))
        self.renderAsset = TextureAsset(textureAssetPath: "Textures/texture.png")
        self.renderAsset.create()
        self.renderer = GLES2Renderer()
        self.renderer.setVertexShader(shader: vartexSharder)
        self.renderer.setFragmentShader(shader: fragmentSharder)
        let ret: Bool = self.renderer.create(renderAsset: self.renderAsset)
        if (false == ret) {
            TraceUtility.log(val: "faild create renderer")
            return
        }
        return
    }
}
