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
open class BaseBehaviour {
    var id: Int!
    var intersect: Bool!
    var destroy: Bool!
    var hitBehaviourId: Int!
    var collider: BaseCollider?
    var renderer: BaseRenderer!
    var renderAsset: GLES2BaseModelAsset!
    init() {
        self.collider = nil
        self.destroy = false
        self.intersect = false
        self.hitBehaviourId = -1
    }
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
    open func onCollisionEnter(behaviour: BaseBehaviour) -> Void {
        return
    }
    open func onCollisionStay(behaviour: BaseBehaviour) -> Void {
        return
    }
    open func onCollisionExit(behaviour: BaseBehaviour) -> Void {
        return
    }
    open func getRenderAsset() -> GLES2BaseModelAsset {
        return self.renderAsset
    }
}
