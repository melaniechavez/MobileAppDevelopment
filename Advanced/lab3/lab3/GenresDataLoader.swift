//
//  GenresDataLoader.swift
//  lab3
//
//  Created by Melanie Chavez on 2/16/21.
//

import Foundation

class GenresDataLoader{
    
    var allData = [GenresData]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                
                //decodes the property list
                allData = try plistdecoder.decode([GenresData].self, from: data)
            } catch {
                // handle error
                print(error)
            }
        }
    }
    
    func getGenres() -> [String]{
        var genres = [String]()
        for item in allData{genres.append(item.genre)}
            return genres
    }
    
    func getArtists(index:Int) -> [String] {
        return allData[index].artists
    }
    
    func addArtist(index:Int, newArtist:String, newIndex: Int){
        allData[index].artists.insert(newArtist, at: newIndex)
    }
    
    func deleteArtist(index:Int, artistIndex: Int){
        allData[index].artists.remove(at: artistIndex)
    }
    
}
