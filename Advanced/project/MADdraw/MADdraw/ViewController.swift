//
//  ViewController.swift
//  MADdraw
//
//  Created by Melanie Chavez on 2/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    // Global declaration, to keep the subscription alive.
//    var cancellable: AnyCancellable?

    @IBAction func colorSelect(_ sender: Any) {
//        // Initializing Color Picker
//        let picker = UIColorPickerViewController()
//
//        // Setting the Initial Color of the Picker
//        picker.selectedColor = self.view.backgroundColor!
//
////        // Setting Delegate
////        picker.delegate = self
////
////        // Presenting the Color Picker
////        self.present(picker, animated: true, completion: nil)
//
//        //  Subscribing selectedColor property changes.
//            self.cancellable = picker.publisher(for: \.selectedColor)
//                .sink { color in
//
//                    //  Changing view color on main thread.
//                    DispatchQueue.main.async {
//                        self.view.backgroundColor = color
//                    }
//                }
//
//            self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {}
    
    @IBAction func newButton(_ sender: Any) {}
    
    @IBOutlet weak var topImageView: UIImageView!
    
    //CGFLoat data types used to measure distances
    var xOrigin:CGFloat = 0
    var yOrigin:CGFloat = 0
    
//    private var selectedColor = UIColor.systemTeal
//    private var colorPicker = UIColorPickerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        xOrigin = topImageView.center.x
        yOrigin = topImageView.center.y
    }
    
    //captures the translation distance that the user's fingertip moved
    //then adds these distances to the image view's center
    @IBAction func panDetected(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        topImageView.center = CGPoint(x: xOrigin + translation.x, y: yOrigin + translation.y)
    }
    
//    private func selectColor(){
//        colorPicker.supportsAlpha = true
//        colorPicker.selectedColor = selectedColor
//        present(colorPicker, animated: true)
//    }
    
//    extension ViewController: UIColorPickerViewControllerDelegate {
//
//        //  Called once you have finished picking the color.
//        func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
//            self.view.backgroundColor = viewController.selectedColor
//
//        }
//
//        //  Called on every color selection done in the picker.
//        func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
//                self.view.backgroundColor = viewController.selectedColor
//        }
//    }
}

