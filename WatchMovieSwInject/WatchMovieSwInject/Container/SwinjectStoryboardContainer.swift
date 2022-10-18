//
//  AppDelegate.swift
//  WatchMovieSwInject
//
//  Created by Khalil Mhelheli on 27/9/2022.
//

import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

extension SwinjectStoryboard {
    @objc class func setup() {
        let mainContainer = MainContainer.sharedContainer.container
        
        defaultContainer.storyboardInitCompleted(HomeViewController.self) { _, controller in
            controller.manager = mainContainer.resolve(AppManagerProtocol.self)
        }
    }
}
