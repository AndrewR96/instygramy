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
    

    var photoImageView = UIImageView(frame: CGRectMake(40, 120, 200, 200))
   
    
    @IBOutlet weak var captionText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionText.text = "caption"
        self.view.addSubview(photoImageView)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func photoLib(sender: AnyObject) {
        var photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .PhotoLibrary
        self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    

    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismissViewControllerAnimated(false, completion: nil)
    }


    
    

    @IBAction func submit(sender: AnyObject) {
        let resizeImage = Post.resize(photoImageView.image!, newSize: CGSize(width: 250, height: 250))
        
        Post.postUserImage(resizeImage, withCaption: captionText.text) { (success: Bool, error: NSError?) -> Void in
            if success {
                self.tabBarController?.selectedIndex = 0
            } else {
                print(error?.localizedDescription)
            }
        }
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