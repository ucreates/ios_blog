// ======================================================================
// Project Name    : texture
//
// Copyright © 2017 U-CREATES. All rights reserved.
//
// This source code is the property of U-CREATES.
// If such findings are accepted at any time.
// We hope the tips and helpful in developing.
// ======================================================================
import UIKit
import GLKit
open class MainViewController: GLKViewController, GLKViewControllerDelegate {
    fileprivate var glview: GLES2View!
    open override func viewDidLoad() -> Void {
        super.viewDidLoad()
        var behaviourList: [BaseBehaviour]! = [BaseBehaviour]()
        behaviourList.append(TextureBehaviour())
        self.glview = GLES2View()
        self.glview.setViewController(viewController: self)
        self.glview.create(behaviourList: behaviourList, position: GLKVector3(v: (0.0, 0.0, -5.0)), fov: 100, near: 1.0, far: 150.0)
        self.delegate = self
        return
    }
    open override func didReceiveMemoryWarning() -> Void {
        super.didReceiveMemoryWarning()
        return
    }
    open override func glkView(_ view: GLKView, drawIn rect: CGRect) -> Void {
        self.glview.onDrawFrame(delta: self.timeSinceLastUpdate)
        return
    }
    public func glkViewControllerUpdate(_ controller: GLKViewController) -> Void {
        return
    }
}
