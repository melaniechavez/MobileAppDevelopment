//
//  ThirdViewController.swift
//  lab2
//
//  Created by Melanie Chavez on 2/1/21.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker2: UIPickerView!
    @IBOutlet weak var choiceLabel2: UILabel!
    
    var musicData = DataLoader()
    var artists = [String]()
    var albums = [String]()
    let artistsComponent = 0
    let albumComponent = 1
    let filename = "artistalbums2"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //gets called right away to draw the picker
    //the artists data needs to be already loaded
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == artistsComponent {
            return artists.count
        } else {
            return albums.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == artistsComponent {
            return artists[row]
        } else {
            return albums[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //check which component was picked
        if component == artistsComponent{
            albums = musicData.getAlbums(index: row) //gets the albums for the selected artist
            picker2.reloadComponent(albumComponent) //reload the album
            picker2.selectRow(0, inComponent: albumComponent, animated: true) //set the album component back to 0
        }
        //gets the selected row for the artist
        let artistrow = pickerView.selectedRow(inComponent: artistsComponent)
        //gets the selected row for the album
        let albumrow = pickerView.selectedRow(inComponent: albumComponent)
        choiceLabel2.text = "You like the \(artists[artistrow]) book \(albums[albumrow])."
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        musicData.loadData(fileName: filename)
        artists = musicData.getArtists()
        albums = musicData.getAlbums(index: 0)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
