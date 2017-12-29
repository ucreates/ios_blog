// ======================================================================
// Project Name    : sphere
//
// Copyright © 2016 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import GLKit
open class GLES2View: BaseView {
    fileprivate var camera: GLES2Camera!
    fileprivate var behaviourDictionary: Dictionary<Int, BaseBehaviour>!
    open func create(behaviourDictionary: Dictionary<Int, BaseBehaviour>, position: GLKVector3, fov: Float, near: Float, far: Float) -> Void {
        if (nil == self.parentViewController) {
            TraceUtility.log(val: "invalid parentViewController")
            return
        }
        let glkView: GLKView = self.parentViewController.view as! GLKView
        glkView.context = EAGLContext(api: .openGLES2)!
        glkView.drawableDepthFormat = .format16
        EAGLContext.setCurrent(glkView.context)
        let aspectRatio: Float = GLfloat(glkView.bounds.size.width / glkView.bounds.size.height)
        self.behaviourDictionary = behaviourDictionary
        self.camera = GLES2Camera.getInstance()
        self.camera.setPosition(position: position)
        self.camera.setAspectRatio(aspectRatio: aspectRatio)
        self.camera.setFov(fov: fov)
        self.camera.setClippingPLane(near: near, far: far)
        self.camera.update()
        for id in self.behaviourDictionary.keys {
            let behaviour: BaseBehaviour = behaviourDictionary[id]!
            behaviour.onCreate()
        }
        return
    }
    open func onDrawFrame(delta: TimeInterval) -> Void {
        self.camera.clear()
        self.camera.update()
        for id in self.behaviourDictionary.keys {
            let behaviour: BaseBehaviour = behaviourDictionary[id]!
            if (false != behaviour.destroy) {
                self.behaviourDictionary.removeValue(forKey: id)
                continue
            }
            if (nil != behaviour.collider) {
                for otherBehaviourId in self.behaviourDictionary.keys {
                    let otherBehaviour: BaseBehaviour = behaviourDictionary[otherBehaviourId]!
                    if (behaviour.id == otherBehaviour.id || nil == otherBehaviour.collider) {
                        continue
                    }
                    let intersect: Bool = behaviour.collider!.isIntersected(renderAsset: otherBehaviour.renderAsset)
                    if (false == intersect) {
                        if (false != behaviour.intersect && otherBehaviour.id == behaviour.hitBehaviourId) {
                            behaviour.onCollisionExit(behaviour: otherBehaviour)
                            behaviour.intersect = false
                            behaviour.hitBehaviourId = -1
                        }
                        continue
                    }
                    if (false == behaviour.intersect) {
                        behaviour.onCollisionEnter(behaviour: otherBehaviour)
                        behaviour.intersect = true
                        behaviour.hitBehaviourId = otherBehaviour.id
                    } else {
                        behaviour.onCollisionStay(behaviour: otherBehaviour)
                    }
                }
            }
            behaviour.onUpdate(delta: delta)
            behaviour.onRender()
        }
        return
    }
}
