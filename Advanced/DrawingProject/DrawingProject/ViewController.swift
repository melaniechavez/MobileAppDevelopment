//
//  ViewController.swift
//  DrawingProject
//
//  Created by Melanie Chavez on 3/18/21.
//

import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate{
    
    var canvas = Canvas()

    @IBAction func changeColorButton(_ sender: Any) {
        //https://www.youtube.com/watch?v=Cw01pkK89_w
        let colorPickerVC = UIColorPickerViewController()
        
        //gets selected color out:
        colorPickerVC.delegate = self
        present(colorPickerVC, animated: true)
        
        //setNeedsDisplay()
   
    }
    
    @IBAction func shareButton(_ sender: Any) {
        //share:
//        guard let image = mainImageView.image else {
//          return
//        }
//        let activity = UIActivityViewController(activityItems: [image],
//                                                applicationActivities: nil)
//        present(activity, animated: true)
        
        
//        let image = UIGraphicsImageRenderer(bounds: view.bounds).image { _ in
//            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
//        }
//
//        do {
//            let fileURL = try FileManager.default
//                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                .appendingPathComponent("test.png")
//
//            try data.write(to: fileURL, options: .atomicWrite)
//        } catch {
//            print(error)
//        }
        
    }
    
    
    @IBAction func newCanvasButton(_ sender: Any) {
        canvas.newCanvas()
    }
    
    //only called if user presses the x(close) button
//    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
//        //get current selected color:
//        let color = viewController.selectedColor
//        canvas.setStrokeColor(color: color)
//    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        canvas.setStrokeColor(color: color)
    }
    
    //share:
    //    guard let image = mainImageView.image else {
//      return
//    }
//    let activity = UIActivityViewController(activityItems: [image],
//                                            applicationActivities: nil)
//    present(activity, animated: true)
    
    
    override func loadView(){
        //set background to be the canvas
        self.view = canvas
    }
    
    override func viewDidLoad() {
        canvas.backgroundColor = .white
        
        //changeColorButton.delegate = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //canvas.backgroundColor = .white
        
        //changeColorButton.setNeedsDisplay()
    }

}

