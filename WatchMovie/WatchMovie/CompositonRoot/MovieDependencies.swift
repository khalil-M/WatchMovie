//
//  CompositionRoot.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 23/9/2022.
//

import Foundation
import UIKit


class MoieDependencies {
    var window: UIWindow?
    private init(){
        
    }
    
    static let shared = MoieDependencies()
    
  
    private var client: HTTPClient = {
        return URLSessionHTTPClient(session: URLSession.shared)
    }()
    
    private lazy var service: AppServiceProtocol = {
        let apiKey = "k_4olf5ls3" //"k_a1ew4rr2"//"k_4olf5ls3"
        return MovieApiService(baseURL: URL(string: "https://imdb-api.com")!, client: client, apiKey: apiKey)
    }()
    
    private lazy var manager: AppManagerProtocol = {
        return AppManager(service: service)
    }()
    
    public func setScene(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        window?.makeKeyAndVisible()
    }
    
    internal func setRootViewController(_ viewController: UIViewController) {
        window?.rootViewController = viewController
    }
    
    public func start() {
        
        let isLoggedIn:Bool = true
        
        if isLoggedIn {
            setRootViewController(makeMainTabBarController(manager: manager))
        } else {
            
        }
    }
    
    // MARK: - Tab Bar Controller
    
    private func makeMainTabBarController(manager: AppManagerProtocol) -> UIViewController {
        
        let homeVC = makeHomeViewController()
        
        let tabController = MainTabBarController(
            viewControllers: [homeVC])
        return tabController
    }

    func makeHomeViewController() -> UIViewController {
        let viewModel = HomeViewControllerViewModel(manager: manager)
        let viewController = HomViewController(viewModel: viewModel)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.title = "Home"
        navigationController.tabBarItem.image = UIImage(systemName: "house")
        

        return navigationController
    }
    
    
}
