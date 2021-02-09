//
//  SecondViewController.swift
//  lab2
//
//  Created by Melanie Chavez on 1/26/21.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker2: UIPickerView!
    @IBOutlet weak var choiceLabel2: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let genre = ["Country", "Pop", "Rock", "Classical", "Alternative", "Hip Hop", "Jazz"]
    
    let decade = ["1950s", "1960s", "1970s", "1980s", "1990s", "2000s", "2010s", "2020s"]
    
    //Methods to implement the picker
    //Required for the UIPickeriewDataSource protocol
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component==0{
            return genre.count
        } else {
            return decade.count
        }
    }
    
    //Picker Delegate Methods
    //Returns the title for a given row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component==0{
            return genre[row]
        } else {
            return decade[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let genreRow = pickerView.selectedRow(inComponent: 0)
        let decadeRow = pickerView.selectedRow(inComponent: 1)
        choiceLabel2.text = "You like \(genre[genreRow]) from the \(decade[decadeRow])"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //from https://www.swiftpal.io/articles/new-uidatepicker-in-ios-14
        if #available(iOS 14, *) {
                datePicker.preferredDatePickerStyle = .compact
            }
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
