//
//  ViewController.swift
//  PrimeNumber
//
//  Created by Julianti Cahyadi on 07/04/21.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    

    @IBAction func tapNewNumber(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? AddNumberVC else {
            return
        }
        vc.title = "Add New Data"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.navigationItem.backBarButtonItem?.title = ""
        vc.navigationItem.backBarButtonItem?.tintColor = .black
        vc.completion = { number in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append(String(number))
            self.noDataLabel.isHidden = true
            self.tableView.isHidden = false

            self.tableView.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noDataLabel: UILabel!
    
    var models = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    
}

