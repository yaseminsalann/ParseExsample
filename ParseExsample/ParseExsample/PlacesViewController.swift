//
//  PlacesViewController.swift
//  ParseExsample
//
//  Created by Yasemin salan on 15.02.2025.
//

import UIKit

class PlacesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonCliced))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action:  #selector(logoutButtonCliced))
    }

    @objc func addButtonCliced() {
        //seque
        self.performSegue(withIdentifier: "toAddPlaceVC", sender: nil)
    }
    @objc func logoutButtonCliced() {
        // Kullanıcı çıkışı
        User.logout { result in
            switch result {
            case .success:
                print("Başarıyla çıkış yapıldı.")
                self.performSegue(withIdentifier: "toSignUpVC", sender: nil)
                
            case .failure(let error):
                print("Çıkış hatası: \(error.localizedDescription)")
                self.makeAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
    func makeAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            alertController.dismiss(animated: true)
        }
        alertController.addAction(okAction)
    }
}
