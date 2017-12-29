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
open class BaseCollider {
    var ownerRenderAsset: GLES2BaseModelAsset!
    init(renderAsset: GLES2BaseModelAsset) {
        self.ownerRenderAsset = renderAsset
    }
    open func isIntersected(renderAsset: GLES2BaseModelAsset) -> Bool {
        return true
    }
}
