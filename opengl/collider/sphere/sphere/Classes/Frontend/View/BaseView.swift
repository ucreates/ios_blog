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
import UIKit
open class BaseView: NSObject {
    var parentViewController: UIViewController!
    open func setViewController(viewController: UIViewController) -> Void {
        self.parentViewController = viewController
        return
    }
}
