//
//  ModelData.swift
//  lab2
//
//  Created by Melanie Chavez on 2/2/21.
//

import Foundation

struct ModelData: Decodable {
    //named the same thing as plist
    let name: String
    let albums:[String]
}
