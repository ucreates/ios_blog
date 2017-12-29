// ======================================================================
// Project Name    : cube
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
    fileprivate var behaviourList: [BaseBehaviour]!
    open func create(behaviourList: [BaseBehaviour], position: GLKVector3, fov: Float, near: Float, far: Float) -> Void {
        if (nil == self.parentViewController) {
            TraceUtility.log(val: "invalid parentViewController")
            return
        }
        let glkView: GLKView = self.parentViewController.view as! GLKView
        glkView.context = EAGLContext(api: .openGLES2)!
        glkView.drawableDepthFormat = .format16
        EAGLContext.setCurrent(glkView.context)
        let aspectRatio: Float = GLfloat(glkView.bounds.size.width / glkView.bounds.size.height)
        self.behaviourList = behaviourList
        self.camera = GLES2Camera.getInstance()
        self.camera.setPosition(position: position)
        self.camera.setAspectRatio(aspectRatio: aspectRatio)
        self.camera.setFov(fov: fov)
        self.camera.setClippingPLane(near: near, far: far)
        self.camera.update()
        for behaviour in self.behaviourList {
            behaviour.onCreate()
        }
        return
    }
    open func onDrawFrame(delta: TimeInterval) -> Void {
        self.camera.clear()
        self.camera.update()
        for behaviour in self.behaviourList {
            behaviour.onUpdate(delta: delta)
            behaviour.onRender()
        }
        return
    }
}
