//
//  ViewController.swift
//  Lab1
//
//  Created by Melanie Chavez on 9/8/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageText: UILabel!
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 1{
            messageText.text = "FALL"
        } else if sender.tag == 2{
            messageText.text = "WINTER"
        }
    }
    @IBOutlet weak var imageChange: UIImageView!
    @IBAction func chooseFall(_ sender: UIButton) {
        if sender.tag == 1{
            imageChange.image = UIImage(named: "fall")
        } else if sender.tag == 2{
            imageChange.image = UIImage(named: "winter")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

