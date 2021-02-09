//
//  DataLoader.swift
//  lab2
//
//  Created by Melanie Chavez on 2/2/21.
//

import Foundation

class DataLoader{
    var allData = [ModelData]()
    func loadData(fileName: String){
        if let pathURL = Bundle.main.url(forResource: fileName, withExtension: "plist"){
            //initialize a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                allData = try plistdecoder.decode([ModelData].self, from: data)
            } catch {
                // handle error
                print("Cannot Load Data")
            }
        }
    }

    func getArtists() -> [String]{
        var artists = [String]()
        for artist in allData {
            artists.append(artist.name)
        }
        return artists
    }
    func getAlbums(index:Int) -> [String] {
        return allData[index].albums
    }
}
