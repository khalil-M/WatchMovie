//
//  TitleData.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 17/10/2022.
//

import Foundation

public struct TitleData: DTO
{
    public var id:                       String
    public var title:                    String
    public var originalTitle:            String
    public var fullTitle:                String
    public var year:                     String
    public var image:                    String
    public var imDbRating:               String
    
    public var description: String {
        return """
        ------------
        id = \(id)
        originalTitle = \(originalTitle)
        title = \(title)
        fullTitle = \(fullTitle)
        year = \(year)
        image = \(image)
        imDbRating = \(imDbRating)
        ------------
        """
    }
}
