//
//  FactDataHandler.swift
//  lab5
//
//  Created by Melanie Chavez on 3/11/21.
//

import Foundation

class FactDataHandler {
    var factData = [Fact]()
    
    //property w a closure as its value
    //closure takes an array of Fact as its parameter & Void as its return type
    var onDataUpdate: ((_ data: [Fact]) -> Void)?
    
    func loadjson(){
        //based on API documentation
        //https://rapidapi.com/brianiswu/api/cat-facts
        let headers = [
            "x-rapidapi-key": "99f71e8935mshb7f7ee4d2d4a4c5p1481afjsnf9ce55e38087",
            "x-rapidapi-host": "brianiswu-cat-facts-v1.p.rapidapi.com"
        ]
        let urlPath = "https://brianiswu-cat-facts-v1.p.rapidapi.com/facts"
        guard let url = URL(string: urlPath)
        else {
            print("url error")
            return
        }
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            print(statusCode)
            guard statusCode == 200
            else {
                print("file download error")
                return
            }
            //download successful
            print("download complete")
            DispatchQueue.main.async {self.parsejson(data!)}
        })
        //must call resume to run session
        session.resume()
    }
    
    
    func parsejson(_ data: Data){
        do{
            let apiData = try JSONDecoder().decode([Fact].self, from: data)
            for fact in apiData{
                factData.append(fact)
                print(fact)
            }
            print(factData.count)
        }
        catch let jsonErr {
            print("json error")
            print(jsonErr.localizedDescription)
            return
        }
        print("parsejson done")
        
        //onDataUpdate?(factData.body)
        onDataUpdate?(factData)
    }
    
    func getFacts() -> [Fact] {
        return factData
    }
}

