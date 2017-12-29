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
open class BaseBehaviour {
    var id: Int!
    var renderer: BaseRenderer!
    var renderAsset: BaseModelAsset!
    open func onCreate() -> Void {
        return
    }
    open func onUpdate(delta: TimeInterval) -> Void {
        return
    }
    open func onRender() -> Void {
        self.renderer.render(renderAsset: self.renderAsset)
        return
    }
    open func getRenderAsset() -> BaseModelAsset {
        return self.renderAsset
    }
}
