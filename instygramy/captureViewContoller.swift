//
//  captureViewContoller.swift
//  instygramy
//
//  Created by Andrew Rivera on 3/20/16.
//  Copyright © 2016 Andrew Rivera. All rights reserved.
//

import UIKit
import Parse

class captureViewContoller: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

   //UIImagePickerController
    //
   
    @IBOutlet weak var captionImage: UILabel!
    @IBOutlet weak var postedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionImage.text = ""
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo image: UIImage, info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            //let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            //let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            // Do something with the images (based on your use case)
            
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func camera(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
       vc.allowsEditing = false
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func photoLib(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = false
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
   
   
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
