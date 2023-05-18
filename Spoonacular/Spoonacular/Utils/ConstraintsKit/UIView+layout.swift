import UIKit

public extension UIView {

    var layout: LayoutDSL {
        LayoutDSL(self)
    }
}
