//
//  AddPlaceViewController.swift
//  ParseExsample
//
//  Created by Yasemin salan on 15.02.2025.
//

import UIKit

class AddPlaceViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var placeNameText: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var placeAtmosphereText: UITextField!
    @IBOutlet weak var placeImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //görsele tıklanabilabilecek demek
        placeImageView.isUserInteractionEnabled = true
     let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        view.addGestureRecognizer(gestureRecognizer)
    }
    @objc func chooseImage() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true,completion: nil)
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
        performSegue(withIdentifier: "toMapVC", sender: nil)
    }

}
