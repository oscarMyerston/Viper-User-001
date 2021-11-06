//
//  Router.swift
//  VIPER
//
//  Created by Oscar David Myerston Vega on 6/11/21.
//

import Foundation
import UIKit


// Object
// Entry point

typealias EntryPoint = AnyView & UIViewController
protocol AnyRouter {
    
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    // func stop()
    // func route(to destination)
    
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router =  UserRouter()
        
        // Asign VIP
        var view: AnyView = UserViewController()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        return router
    }
    
    
}
