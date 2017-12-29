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
open class GLES2Camera {
    fileprivate var viewMatrix: GLKMatrix4!
    fileprivate var projectionMatrix: GLKMatrix4!
    fileprivate static var instance: GLES2Camera? = nil
    fileprivate var aspectRatio: Float!
    fileprivate var fov: Float!
    fileprivate var near: Float!
    fileprivate var far: Float!
    fileprivate var color: GLESColor!
    var transform: Transform!
    fileprivate init() {
        self.transform = Transform()
        self.color = GLESColor(r: 0.0, g: 0.0, b: 0.0, a: 1.0)
        self.viewMatrix = GLKMatrix4Identity
        self.projectionMatrix = GLKMatrix4Identity
        self.aspectRatio = 0
        self.fov = 0
        self.near = 0
        self.far = 0
    }
    open static func getInstance() -> GLES2Camera {
        if (nil == GLES2Camera.instance) {
            GLES2Camera.instance = GLES2Camera()
        }
        return GLES2Camera.instance!
    }
    open func update() -> Void {
        self.projectionMatrix = GLKMatrix4MakePerspective(self.fov, self.aspectRatio, self.near, self.far)
        self.viewMatrix = GLKMatrix4MakeTranslation(self.transform.position.x, self.transform.position.y, self.transform.position.z)
        return
    }
    open func clear() -> Void {
        glClearColor(self.color.r, self.color.g, self.color.b, self.color.a)
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT))
        return
    }
    open func getProjectionMatrix() -> GLKMatrix4 {
        return self.projectionMatrix
    }
    open func getViewMatrix() -> GLKMatrix4 {
        return self.viewMatrix
    }
    open func setPosition(position: GLKVector3) -> Void {
        self.transform.position = position
        return
    }
    open func setPosition(x: Float, y: Float, z: Float) -> Void {
        self.transform.position = GLKVector3(v: (x, y, z))
        return
    }
    open func setAspectRatio(aspectRatio: Float) -> Void {
        self.aspectRatio = aspectRatio
        return
    }
    open func setFov(fov: Float) -> Void {
        self.fov = GLKMathDegreesToRadians(fov)
        return
    }
    open func setClippingPLane(near: Float, far: Float) -> Void {
        self.near = near
        self.far = far
        return
    }
}
