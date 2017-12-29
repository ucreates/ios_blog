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
open class GLES2CubeAsset: GLES2BaseModelAsset {
    init() {
        super.init(type: GLES2BaseModelAsset.CUBE)
    }
    override open func create() {
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
            -0.5, -0.5, -0.5, self.color.r, self.color.g, self.color.b, self.color.a, 0, 0 // 15
        ]
        self.indices = [
            // Front
            0, 1, 2,
            2, 3, 0,

            // Back
            4, 5, 6,
            6, 7, 4,

            // Left
            3, 2, 5,
            5, 4, 3,

            // Right
            7, 6, 1,
            1, 0, 7,

            // Top
            1, 6, 5,
            5, 2, 1,

            // Bottom
            3, 4, 7,
            7, 0, 3
        ]
        super.create()
        return
    }
}

