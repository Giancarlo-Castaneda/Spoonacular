import UIKit

public protocol RouteHandler {

    associatedtype RouteType: Route

    func destination(of route: RouteType) -> UIViewController
    func navigate(to route: RouteType,
                  from presentingViewController: UIViewController,
                  presentationStyle: UIModalPresentationStyle?)
}
