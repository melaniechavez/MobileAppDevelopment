//
//  ViewController.swift
//  DrawingApp
//
//

import UIKit
import PencilKit
import PhotosUI

class ViewController: UIViewController, PKCanvasViewDelegate, PKToolPickerObserver {

    @IBAction func saveDrawing(_ sender: Any) {
        //saving drawing by taking a screenshot of the view
        
        //https://stackoverflow.com/questions/31582222/how-to-take-screenshot-of-a-uiview-in-swift/52857151
        //begins context
        //(size, opaque, scale)
        UIGraphicsBeginImageContextWithOptions(canvasView.bounds.size, false, UIScreen.main.scale)
        
        //draw view in context
        //(in, afterScreenUpdates)
        canvasView.drawHierarchy(in: canvasView.bounds, afterScreenUpdates: true)
        
        //get the screen as an image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //Save to photos
        //https://developer.apple.com/documentation/photokit/phphotolibrary/requesting_changes_to_the_photo_library
        //https://stackoverflow.com/questions/50262819/unable-to-save-remote-photo-to-camera-roll-in-swift
        if image != nil{
            //use photos UI library to store image
            //make an image an asset
            PHPhotoLibrary.shared().performChanges({
                //make an image an asset & save to album
                //unwrap image bc checking that its not nil in if statement
                PHAssetChangeRequest.creationRequestForAsset(from: image!)
            }, completionHandler: {success, error in
                if let err = error { print(err) }
            })
        }
        
        //https://developer.apple.com/documentation/bundleresources/information_property_list/nsphotolibraryusagedescription
        //in p list to resolve error of NSPhotoLibraryUsage
        //a pop up to tell user why app is requesting
    }
    
    //https://developer.apple.com/documentation/pencilkit/pkcanvasview
    @IBOutlet weak var canvasView: PKCanvasView!
    
    //https://ios-resolution.com/
    let canvasWidth: CGFloat = 390
    let canvasOverscrollHeight: CGFloat = 500
    
    //place to save drawing
    var drawing = PKDrawing()
    
    var toolPicker: PKToolPicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup Canvas view
        canvasView.delegate = self
        canvasView.drawing = drawing
        
        canvasView.alwaysBounceVertical = true
        
        //https://stackoverflow.com/questions/59781914/ios-pencilkit-not-drawing
        //Allows for any input finger, mouse cursor not just apple pencil
        canvasView.drawingPolicy = .anyInput
        
        //initialize PKToolPicker: https://developer.apple.com/forums/thread/653768
        //https://developer.apple.com/documentation/pencilkit/drawing_with_pencilkit
        toolPicker = PKToolPicker()
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        toolPicker.addObserver(self)
        canvasView.becomeFirstResponder()
    }

}

