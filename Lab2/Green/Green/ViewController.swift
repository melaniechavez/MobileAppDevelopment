//
//  ViewController.swift
//  Green
//
//  Created by Melanie Chavez on 9/21/20.
//  Copyright © 2020 Melanie Chavez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var colorImage: UIImageView!
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    @IBOutlet weak var imageControl: UISegmentedControl!
    
    @IBOutlet weak var capitalSwitch: UISwitch!
    
    func updateImage(){
        if imageControl.selectedSegmentIndex == 0{
            titleLabel.text = "Pistachio"
            colorImage.image = UIImage(named: "pistachio")
        } else if imageControl.selectedSegmentIndex == 1{
            titleLabel.text = "Emerald"
            colorImage.image = UIImage(named: "emerald")
        } else if imageControl.selectedSegmentIndex == 2{
            titleLabel.text = "Hunter"
            colorImage.image = UIImage(named: "hunter")
        }
    }
    
    func updateCaps(){
        if capitalSwitch.isOn{
            //uppercase
            titleLabel.text = titleLabel.text?.uppercased()
        } else {
            //lowercase
            titleLabel.text = titleLabel.text?.lowercased()
            
        }
    }
    
    @IBAction func changeInfo(_ sender: UISegmentedControl){
        updateImage()
        updateCaps()
    }
    
    @IBAction func updateFont(_ sender: UISwitch){
        updateCaps()
        if sender.isOn{
            titleLabel.textColor = UIColor.systemGreen
        } else{
            titleLabel.textColor = UIColor.black
        }
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        //get new value
        let fontSize = sender.value //float
        
        //update slider label text
        fontSizeLabel.text = String(format: "%.0f", fontSize)
        
        //convert float to CGFloat
        let fontSizeCGFloat = CGFloat(fontSize)
        //create a UIFont object and assign to the font property
        titleLabel.font = UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

