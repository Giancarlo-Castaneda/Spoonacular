import UIKit

public protocol RouteService {

    func navigate<RouteType: Route>(to route: RouteType,
                                    from presentingViewController: UIViewController,
                                    presentationStyle: UIModalPresentationStyle?)
    func register<RouteHandlerType: RouteHandler>(_ handler: RouteHandlerType)
}
