//
//  ViewController.swift
//  lab5
//
//  Created by Melanie Chavez on 3/10/21.
//

import UIKit

class ViewController: UIViewController{
    
    var facts = [Fact]()
    var factDataHandler = FactDataHandler()
    
    @IBOutlet weak var factLabel: UILabel!
    
    @IBAction func factButton(_ sender: UIButton) {
        //change Label
        //factLabel.text = ...
        let randomFact = facts.randomElement()!
        factLabel.text = "\(randomFact)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //loadtestdata()
        
        //assign the closure with the method we want called to the onDataUpdate closure
        factDataHandler.onDataUpdate = {[weak self] (data:[Fact]) in self?.render()}
        
        factDataHandler.loadjson()
        print(facts.count)
    }
    
    func loadtestdata() { //test data
        let fact1 = Fact(text:"cat fact 1")
        let fact2 = Fact(text:"cat fact 2")
        let fact3 = Fact(text:"cat fact 3")
        facts.append(fact1)
        facts.append(fact2)
        facts.append(fact3)
    }
    
    func render() {
        facts = factDataHandler.getFacts()
        tableView.reloadData()
    }



}

