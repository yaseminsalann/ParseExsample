//
//  ViewController.swift
//  ParseExsample
//
//  Created by Yasemin salan on 15.02.2025.
//

import UIKit
import ParseSwift

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       /*
        //veri kaydetme
        var fruits = Fruits()
        fruits.name = "strawberry"
        fruits.calories = 150

        fruits.save { result in
            switch result {
            case .success(let savedFruits):
                print("Başarıyla kaydedildi: \(savedFruits)")
            case .failure(let error):
                print("Hata oluştu: \(error.localizedDescription)")
            }
        }
        */
       /*
        //veriyi okuma
        let query = Fruits.query()
        query.find { result in
            switch result {
            case .success(let fruit):
                for fruits in fruit {
                    print("Meyve: \(fruits.name ?? "Bilinmiyor"), Calories: \(fruits.calories ?? 0)")
                }
            case .failure(let error):
                print("Hata oluştu: \(error.localizedDescription)")
            }
        }*/
        /*
         //VERİ GÜNCELLEME
        let query = Fruits.query("objectId" == "5iREpYFvCY")
        query.first { result in
            switch result {
            case .success(var fruitsToUpdate):
                fruitsToUpdate.calories = 30  // Güncelleme yap
                fruitsToUpdate.save { saveResult in
                    switch saveResult {
                    case .success(let updatedFruits):
                        print("Başarıyla güncellendi: \(updatedFruits)")
                    case .failure(let error):
                        print("Hata oluştu: \(error.localizedDescription)")
                    }
                }
            case .failure(let error):
                print("Hata: \(error.localizedDescription)")
            }
        }
         */
        /*
         //veri güncelleme
         let query = Fruits.query("name" == "Banana") // İsme göre sorgu
        query.first { result in
            switch result {
            case .success(var fruits):
                fruits.delete { deleteResult in
                    switch deleteResult {
                    case .success:
                        print("Meyve başarıyla silindi!")
                    case .failure(let error):
                        print("Hata oluştu: \(error.localizedDescription)")
                    }
                }
            case .failure(let error):
                print("Veri çekme hatası: \(error.localizedDescription)")
            }
        }
        */


    }
    
    
    @IBAction func signInClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" {
            // Kullanıcı girişi
            User.login(username: usernameText.text!, password: passwordText.text!) { result in
                switch result {
                case .success(let loggedInUser):
                    print("Başarıyla giriş yapıldı: \(loggedInUser.username ?? "Bilinmeyen Kullanıcı")")
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                case .failure(let error):
                    print("Giriş hatası: \(error.localizedDescription)")
                    self.makeAlert(title: "Error", message: error.localizedDescription)
                }
            }

        }
        else{
            makeAlert(title: "Error", message: "Username/Password cannot be empty")
        }
        
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if usernameText.text != "" && passwordText.text != "" {
            
            var user = User()
            user.username = usernameText.text!
            user.password = passwordText.text!

            user.save { result in
                switch result {
                case .success(let savedUser):
                    print("Kullanıcı başarıyla kaydedildi: \(savedUser)")
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                case .failure(let error):
                    print("Kullanıcı kaydı hatası: \(error.localizedDescription)")
                    self.makeAlert(title: "Error", message: error.localizedDescription)
                }
            }
            
        }
        else{
            makeAlert(title: "Errors!", message: "Username/Password cannot be empty")
        }
    }
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

