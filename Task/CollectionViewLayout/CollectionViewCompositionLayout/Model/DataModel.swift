//
//  DataModel.swift
//  CollectionViewCompositionLayout
//
//  Created by Shyamala's MacBook Pro on 15/08/22.
//

import Foundation

struct DataModel : Codable{
    var data : [DataArray]?
}

struct DataArray : Codable{
    var date : String?
    var teams : [teamsArray]?
}
struct teamsArray : Codable{
    var name : String?
    var totalPoints : Int?
    var points : [pointsArray]?
}
struct pointsArray : Codable{
    var name : String?
    var color : String?
    var point : Int?
}
