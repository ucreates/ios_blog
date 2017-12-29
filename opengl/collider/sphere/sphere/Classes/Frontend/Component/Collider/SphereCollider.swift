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
open class SphereCollider: BaseCollider {
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
        let bdx: Float = (0.5 * oscx) + (0.5 * ascx)
        let bdy: Float = (0.5 * oscy) + (0.5 * ascy)
        let bdz: Float = (0.5 * oscz) + (0.5 * ascz)
        let cdx: Float = Distance.create(start: opx, end: apx)
        let cdy: Float = Distance.create(start: opy, end: apy)
        let cdz: Float = Distance.create(start: opz, end: apz)
        return (bdx >= cdx && bdy >= cdy && bdz >= cdz)
    }
}
