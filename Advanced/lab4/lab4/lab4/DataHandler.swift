//
//  DataHandler.swift
//  lab4
//
//  Created by Melanie Chavez on 3/3/21.
//

import Foundation

class DataHandler{
    var allData = [Character]()
    
    func loadData(filename: String){
        if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the property list
                allData = try plistdecoder.decode([Character].self, from: data)
            } catch {
                //print error
                print(error)
            }
        }
    }
    
    func getCharacters() -> [String]{
        var characters = [String]()
        for character in allData{
            characters.append(character.name)
        }
            return characters
    }
    
    func getURL(index:Int) -> String{
        return allData[index].url
    }
}
        
