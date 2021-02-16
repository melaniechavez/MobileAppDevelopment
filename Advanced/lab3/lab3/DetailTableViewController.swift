//
//  DetailTableViewController.swift
//  lab3
//
//  Created by Melanie Chavez on 2/16/21.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var genresData = GenresDataLoader()
    var selectedGenre = 0
    var artistList = [String]()
    var allwords = [String]()
    var filteredWords = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        artistList = genresData.getArtists(index: selectedGenre)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //register our table cell identifier
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "artistIdentifier")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return artistList.count 
//        return filteredWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artistIdentifier", for: indexPath)

        cell.textLabel?.text = artistList[indexPath.row]
        return cell
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "artistIdentifier", for: indexPath)
//        cell.textLabel?.text = filteredWords[indexPath.row]
//        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //Delete the country from the array
            artistList.remove(at: indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            //Delete from the data model instance
            genresData.deleteArtist(index: selectedGenre, artistIndex: indexPath.row)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let fromRow = fromIndexPath.row //row being moved from
        let toRow = to.row //row being moved to
        let moveArtist = artistList[fromRow] //country being moved
        //swap positions in array
        artistList.swapAt(fromRow, toRow)
        //move in data model instance
        genresData.deleteArtist(index: selectedGenre, artistIndex:
        fromRow)
        genresData.addArtist(index: selectedGenre, newArtist:
        moveArtist, newIndex: toRow)
    }


    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let alert = UIAlertController(title: "Row selected", message: "You selected \(filteredWords[indexPath.row])", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(okAction)
//        present(alert, animated: true, completion: nil)
//        tableView.deselectRow(at: indexPath, animated: true) //deselects the row that had been chosen
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        if segue.identifier=="doneSegue"{
            if let source = segue.source as? AddArtistViewController {
                //only add a country if there is text in the textfield
                if source.addedArtist.isEmpty == false{
                //add country to our data model instance
                    genresData.addArtist(index: selectedGenre, newArtist: source.addedArtist, newIndex: artistList.count)
                    //add country to the array
                    artistList.append(source.addedArtist)
                    tableView.reloadData()
                }
            }
        }
    }
    
}
