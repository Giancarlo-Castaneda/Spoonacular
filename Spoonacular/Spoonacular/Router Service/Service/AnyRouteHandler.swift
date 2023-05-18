import UIKit

struct AnyRouteHandler<RouteType: Route>: RouteHandler {

    // MARK: - Private Properties

    private let destinationClosure: (RouteType) -> UIViewController
    private let navigateClosure: (RouteType, UIViewController, UIModalPresentationStyle?) -> Void

    // MARK: - Initialization

    init<RouteHandlerType: RouteHandler>(_ handler: RouteHandlerType) where RouteHandlerType.RouteType == RouteType {
        destinationClosure = handler.destination
        navigateClosure = handler.navigate
    }

    // MARK: - Internal Methods

    func destination(of route: RouteType) -> UIViewController {
        destinationClosure(route)
    }

    func navigate(to route: RouteType,
                  from presentingViewController: UIViewController,
                  presentationStyle: UIModalPresentationStyle?) {

        navigateClosure(route, presentingViewController, presentationStyle)
    }
}
