// ======================================================================
// Project Name    : box
//
// Copyright © 2017 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import Foundation
import GLKit
open class BoxCollider: BaseCollider {
    override init(renderAsset: GLES2BaseModelAsset) {
        super.init(renderAsset: renderAsset)
    }
    override open func isIntersected(renderAsset: GLES2BaseModelAsset) -> Bool {
        let opx: Float = self.ownerRenderAsset.transform.position.x
        let opy: Float = self.ownerRenderAsset.transform.position.y
        let opz: Float = self.ownerRenderAsset.transform.position.z
        let oscx: Float = self.ownerRenderAsset.transform.scale.x / 2
        let oscy: Float = self.ownerRenderAsset.transform.scale.y / 2
        let oscz: Float = self.ownerRenderAsset.transform.scale.z / 2
        let apx: Float = renderAsset.transform.position.x
        let apy: Float = renderAsset.transform.position.y
        let apz: Float = renderAsset.transform.position.z
        let ascx: Float = renderAsset.transform.scale.x / 2
        let ascy: Float = renderAsset.transform.scale.y / 2
        let ascz: Float = renderAsset.transform.scale.z / 2
        let osx: Float = opx - oscx
        let oex: Float = opx + oscx
        let osy: Float = opy - oscy
        let oey: Float = opy + oscy
        let osz: Float = opz - oscz
        let oez: Float = opz + oscz
        let asx: Float = apx - ascx
        let aex: Float = apx + ascx
        let asy: Float = apy - ascy
        let aey: Float = apy + ascy
        let asz: Float = apz - ascz
        let aez: Float = apz + ascz
        return ((osx <= asx && asx <= oex && osy <= asy && asy <= oey && osz <= asz && asz <= oez) || (osx <= aex && aex <= oex && osy <= aey && aey <= oey && osz <= aez && aez <= oez))
    }
}
