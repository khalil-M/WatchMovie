//
//  WatchMovieSwInjectTests.swift
//  WatchMovieSwInjectTests
//
//  Created by Khalil Mhelheli on 27/9/2022.
//

import XCTest
import Swinject
import SwinjectAutoregistration

@testable import WatchMovieSwInject

extension MostPopularDataDetail {
    init(id: String) {
        self.init(id: id, rank: "22", rankUpDown: "2", title: "Titanic", fullTitle: "TitanicD", year: "2000", image: "image", crew: "ile", imDbRating: "5", imDbRatingCount: "7")
    }
}

class ModelsTests: XCTestCase {
    
    private let container = Container()
    
    override func setUp() {
        super.setUp()
        container.autoregister(MostPopularDataDetail.self,
                               argument: String.self,
                               initializer: MostPopularDataDetail.init(id: ))
    }
    
    override func tearDown() {
        super.tearDown()
        container.removeAll()
    }
    
    func testMostPopularDataDetail() {
        let movie = container.resolve(MostPopularDataDetail.self, argument:"999456" )
        XCTAssertEqual(movie!.id, "999456")
    }
    
}
