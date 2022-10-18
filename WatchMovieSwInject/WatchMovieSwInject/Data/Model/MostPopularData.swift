//
//  MostPopularData.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 23/9/2022.
//

import Foundation

public struct MostPopularData: DTO {
    public var items: [MostPopularDataDetail]

    public var errorMessage: String
    
    public var description: String {
        return """
        ------------
        items = \(items)
        errorMessage = \(errorMessage)
        ------------
        """
    }
}
