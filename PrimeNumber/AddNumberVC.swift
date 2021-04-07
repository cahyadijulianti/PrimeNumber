//
//  AddNumberVC.swift
//  PrimeNumber
//
//  Created by Julianti Cahyadi on 07/04/21.
//

import UIKit

class AddNumberVC: UIViewController {

    @IBOutlet weak var addTxtfield: UITextField!
    
    public var completion: ((Int) -> Void)?
    var number = 0
    var flag = false
    override func viewDidLoad() {
        super.viewDidLoad()
        addTxtfield.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
    }
    
    @objc func didTapSave() {
        if let text = addTxtfield.text, !text.isEmpty {
            number = Int(text)!
            if number == 2 || number == 3{
                flag = false
            }else
            {
                for i in 2...Int(sqrt(Double(number))){
                   if(number % i == 0){
                    flag = true
                    break;
                   }
                }
            }
            
            if flag == false {
                completion?(Int(text)!)
            } else {
                let alert = UIAlertController(title: "Upss...", message: "is not prime number", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { (success) in
                    self.addTxtfield.text = ""
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

}
