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
        UIGraphicsBeginImageContextWithOptions(drawingView.bounds.size, false, UIScreen.main.scale)
        
        //draw view in context
        //(in, afterScreenUpdates)
        drawingView.drawHierarchy(in: drawingView.bounds, afterScreenUpdates: true)
        
        //get the screen as an image
        let drawingImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //Save to photos
        //https://developer.apple.com/documentation/photokit/phphotolibrary/requesting_changes_to_the_photo_library
        //https://stackoverflow.com/questions/50262819/unable-to-save-remote-photo-to-camera-roll-in-swift
        if drawingImage != nil{
            //use photos UI library to store image
            //make an image an asset
            PHPhotoLibrary.shared().performChanges({
                //make an image an asset & save to album
                //unwrap image bc checking that its not nil in if statement
                PHAssetChangeRequest.creationRequestForAsset(from: drawingImage!)
            }, completionHandler: {success, error in
                if let err = error { print(err) }
            })
        }
        
        //https://developer.apple.com/documentation/bundleresources/information_property_list/nsphotolibraryusagedescription
        //in p list to resolve error of NSPhotoLibraryUsage
        //a pop up to tell user why app is requesting
    }
    
    //https://developer.apple.com/documentation/pencilkit/pkcanvasview
    @IBOutlet weak var drawingView: PKCanvasView!
    
    //place to save drawing
    var drawing = PKDrawing()
    
    var toolPicker: PKToolPicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup Canvas view
        drawingView.delegate = self
        drawingView.drawing = drawing
        
        drawingView.alwaysBounceVertical = true
        
        //https://stackoverflow.com/questions/59781914/ios-pencilkit-not-drawing
        //Allows for any input finger, mouse cursor not just apple pencil
        drawingView.drawingPolicy = .anyInput
        
        //initialize PKToolPicker: https://developer.apple.com/forums/thread/653768
        //https://developer.apple.com/documentation/pencilkit/drawing_with_pencilkit
        toolPicker = PKToolPicker()
        toolPicker.setVisible(true, forFirstResponder: drawingView)
        toolPicker.addObserver(drawingView)
        toolPicker.addObserver(self)
        drawingView.becomeFirstResponder()
    }

}

