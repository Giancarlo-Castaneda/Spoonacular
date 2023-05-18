import UIKit

final class ConcreteRouteService: RouteService {

    // MARK: - Private Properties

    private var handlers: [Any] = []

    // MARK: - Initialization

    init() { }

    // MARK: - Internal Methods

    func navigate<RouteType>(to route: RouteType,
                                    from presentingViewController: UIViewController,
                                    presentationStyle: UIModalPresentationStyle?) where RouteType: Route {

        for handler in handlers {
            if let handler = (handler as? AnyRouteHandler<RouteType>) {
                handler.navigate(to: route, from: presentingViewController, presentationStyle: presentationStyle)
            }
        }
    }

    func register<RouteHandlerType>(_ handler: RouteHandlerType) where RouteHandlerType: RouteHandler {
        handlers.append(AnyRouteHandler(handler))
    }
}
