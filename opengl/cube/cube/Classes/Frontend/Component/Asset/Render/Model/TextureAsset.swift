// ======================================================================
// Project Name    : cube
//
// Copyright © 2017 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import GLKit
open class TextureAsset: BaseModelAsset {
    open var textureId: GLuint = 0
    var textureAssetPath: String
    init(textureAssetPath: String) {
        self.textureAssetPath = textureAssetPath
        super.init(type: BaseModelAsset.TEXTURE)
    }
    open override func create() -> Void {
        self.vertices = [
            // Front
            0.5, -0.5, 0.5, self.color.r, self.color.g, self.color.b, self.color.a, 1, 0, // 0
            0.5, 0.5, 0.5, self.color.r, self.color.g, self.color.b, self.color.a, 1, 1, // 1
            -0.5, 0.5, 0.5, self.color.r, self.color.g, self.color.b, self.color.a, 0, 1, // 2
            -0.5, -0.5, 0.5, self.color.r, self.color.g, self.color.b, self.color.a, 0, 0, // 3
            // Back
            -0.5, -0.5, -0.5, self.color.r, self.color.g, self.color.b, self.color.a, 1, 0, // 4
            -0.5, 0.5, -0.5, self.color.r, self.color.g, self.color.b, self.color.a, 1, 1, // 5
            0.5, 0.5, -0.5, self.color.r, self.color.g, self.color.b, self.color.a, 0, 1, // 6
            0.5, -0.5, -0.5, self.color.r, self.color.g, self.color.b, self.color.a, 0, 0, // 7
            // Left
            -0.5, -0.5, 0.5, self.color.r, self.color.g, self.color.b, self.color.a, 1, 0, // 8
            -0.5, 0.5, 0.5, self.color.r, self.color.g, self.color.b, self.color.a, 1, 1, // 9
            -0.5, 0.5, -0.5, self.color.r, self.color.g, self.color.b, self.color.a, 0, 1, // 10
            -0.5, -0.5, -0.5, self.color.r, self.color.g, self.color.b, self.color.a, 0, 0, // 11
            // Right
            0.5, -0.5, -0.5, self.color.r, self.color.g, self.color.b, self.color.a, 1, 0, // 8
            0.5, 0.5, -0.5, self.color.r, self.color.g, self.color.b, self.color.a, 1, 1, // 9
            0.5, 0.5, 0.5, self.color.r, self.color.g, self.color.b, self.color.a, 0, 1, // 10
            0.5, -0.5, 0.5, self.color.r, self.color.g, self.color.b, self.color.a, 0, 0, // 11
            // Top
            0.5, 0.5, 0.5, self.color.r, self.color.g, self.color.b, self.color.a, 1, 0, // 8
            0.5, 0.5, -0.5, self.color.r, self.color.g, self.color.b, self.color.a, 1, 1, // 9
            -0.5, 0.5, -0.5, self.color.r, self.color.g, self.color.b, self.color.a, 0, 1, // 10
            -0.5, 0.5, 0.5, self.color.r, self.color.g, self.color.b, self.color.a, 0, 0, // 11
            // Bottom
            0.5, -0.5, -0.5, self.color.r, self.color.g, self.color.b, self.color.a, 1, 0, // 12
            0.5, -0.5, 0.5, self.color.r, self.color.g, self.color.b, self.color.a, 1, 1, // 13
            -0.5, -0.5, 0.5, self.color.r, self.color.g, self.color.b, self.color.a, 0, 1, // 14
            -0.5, -0.5, -0.5, self.color.r, self.color.g, self.color.b, self.color.a, 0, 0, // 15
        ]
        self.indices = [
            // Front
            0, 1, 2,
            2, 3, 0,
            // Back
            4, 5, 6,
            6, 7, 4,
            // Left
            8, 9, 10,
            10, 11, 8,
            // Right
            12, 13, 14,
            14, 15, 12,
            // Top
            16, 17, 18,
            18, 19, 16,
            // Bottom
            20, 21, 22,
            22, 23, 20,
        ]
        super.create()
        let path: String = Bundle.main.path(forResource: textureAssetPath, ofType: nil)!
        let option = [GLKTextureLoaderOriginBottomLeft: true]
        do {
            let info: GLKTextureInfo = try GLKTextureLoader.texture(withContentsOfFile: path, options: option as [String: NSNumber]?)
            self.textureId = info.name
        } catch {
            TraceUtility.log(val: error.localizedDescription)
        }
        return
    }
}
