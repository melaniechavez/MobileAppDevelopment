//
//  ViewController.swift
//  4lab
//
//  Created by Melanie Chavez on 10/5/20.
//  Copyright © 2020 Melanie Chavez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var rentAmount: UITextField!
    
    @IBOutlet weak var peopleLabel: UILabel!
    
    @IBOutlet weak var peopleStepper: UIStepper!
    
    @IBAction func updatePeople(_ sender: UIStepper) {
        if peopleStepper.value == 1{
            peopleLabel.text = "1 Person"
        } else {
            peopleLabel.text = String(format: "%.0f", peopleStepper.value) + " People"
        }
        updateTotals()
    }
    
    
    @IBOutlet weak var TotalDuePerPerson: UILabel!
    
    func updateTotals(){
        var amount: Float //rent amount
        
        if rentAmount.text!.isEmpty {
            amount = 0.0
        } else {
            amount = Float(rentAmount.text!)!
        }
        
        
        let numberOfPeople = peopleStepper.value
        var personTotal: Float = 0.0 //specify Float so its not a Double
        
        if numberOfPeople > 0{
            personTotal = amount / Float(numberOfPeople)
        } else {
            let alert = UIAlertController(title: "Warning", message: "The number of people must be greater than 0", preferredStyle: UIAlertController.Style.alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancelAction)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
                self.peopleStepper.value = 1
                self.peopleLabel.text? = "1 Person"
                self.updateTotals()
            })
            alert.addAction(okAction)
            present(alert,animated: true, completion: nil)
        }
        //format results as currency
        let currencyFormatter = NumberFormatter()
        
        //set the number style
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        
        TotalDuePerPerson.text = currencyFormatter.string(from: NSNumber(value: personTotal))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateTotals()
    }
    override func viewDidLoad() {
        rentAmount.delegate=self
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer =
        UITapGestureRecognizer(target: self, action:
        #selector(self.dismissKeyboard))
         view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
    view.endEditing(true)
    }


}

