//
//  DTO.swift
//  WatchMovie
//
//  Created by Khalil Mhelheli on 23/9/2022.
//

import Foundation
import Foundation

public protocol DTO: Codable, CustomStringConvertible, Hashable {
    
}

extension Array: DTO where Element: DTO
{
    
}
