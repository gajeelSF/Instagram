//
//  ComposorViewController.swift
//  Instagram
//
//  Created by SongYuda on 3/12/17.
//  Copyright © 2017 SongYuda. All rights reserved.
//

import UIKit

class ComposorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var captainTextField: UITextField!
    @IBOutlet weak var ChoosePictureButton: UIButton!
    @IBOutlet weak var previewImage: UIImageView!
    
    var picture : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickChoose(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(vc, animated: true, completion: nil)
        
    }
    @IBAction func onClickPost(_ sender: Any) {
        if(self.picture != nil) {
            print("not nil")
        }
        Post.postUserImage(image: self.picture, withCaption: captainTextField.text) { (success, error) in
            if(success) {
                print("posted")
                self.captainTextField.text = ""
                self.previewImage.backgroundColor = UIColor.white
                self.performSegue(withIdentifier: "PostSegue", sender: nil)
            }
            else {
                print(error?.localizedDescription)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        print("called")
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Do something with the images (based on your use case)
        
        self.picture = resize(image: editedImage)
        previewImage.image = self.picture
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    func resize(image: UIImage) -> UIImage {
        let resizeImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 340, height: 250))
        resizeImageView.contentMode = UIViewContentMode.scaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
