//
//  AddArtistViewController.swift
//  lab3
//
//  Created by Melanie Chavez on 2/16/21.
//

import UIKit

class AddArtistViewController: UIViewController {

    @IBOutlet weak var artistTextField: UITextField!
    
    var addedArtist = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue"{
            //only add a country if there is text in the textfield
            if artistTextField.text?.isEmpty == false{
                addedArtist=artistTextField.text!
            }
        }
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
