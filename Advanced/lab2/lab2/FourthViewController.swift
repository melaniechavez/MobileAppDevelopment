//
//  FourthViewController.swift
//  lab2
//
//  Created by Melanie Chavez on 2/8/21.
//

import UIKit

class FourthViewController: UIViewController {

    @IBAction func goTo(_ sender: Any) {
        //check to see if there's an app installed to handle this URL scheme
        if(UIApplication.shared.canOpenURL(URL(string: "goodreads://")!)) {
            //open the app with this URL scheme
            UIApplication.shared.open(URL(string: "goodreads://")!, options: [:], completionHandler: nil)
        } else {
            if(UIApplication.shared.canOpenURL(URL(string: "ibooks://")!)){ UIApplication.shared.open(URL(string: "ibooks://")!, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.open(URL(string: "https://www.goodreads.com/")!, options: [:], completionHandler: nil)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
