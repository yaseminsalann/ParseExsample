//
//  PlacesViewController.swift
//  ParseExsample
//
//  Created by Yasemin salan on 15.02.2025.
//

import UIKit

class PlacesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var placeNameArray = [String]()
       var placeIdArray = [String]()
       var selectedPlaceId = ""
   
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonCliced))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action:  #selector(logoutButtonCliced))
        tableView.delegate = self
                tableView.dataSource = self
                
                getDataFromParse()
    }
    func getDataFromParse() {
        let query = Places.query()
        query.find { result in
            switch result {
            case .success(let place):
                self.placeNameArray.removeAll(keepingCapacity: false)
                self.placeIdArray.removeAll(keepingCapacity: false)
                for places in place {
               if let placeName = places.name {
                   if let placeID = places.objectId {
                        self.placeIdArray.append(placeID)
                       self.placeNameArray.append(placeName)
                    }
                    }
                }
                self.tableView.reloadData()
            case .failure(let error):
                print("Hata oluştu: \(error.localizedDescription)")
                self.makeAlert(title: "Error", message: error.localizedDescription)
            }
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.choosenPlaceId = selectedPlaceId
               }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlaceId = placeIdArray[indexPath.row]
              self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = UITableViewCell()
           cell.textLabel?.text = placeNameArray[indexPath.row]
           return cell
       }
    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return placeNameArray.count
       }
}
