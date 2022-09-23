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
            setRootViewController(ViewController())
        } else {
            setRootViewController(ViewController())
        }
    }

    
    
    
    
}
