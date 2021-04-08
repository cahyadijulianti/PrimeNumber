//
//  ProfilVC.swift
//  PrimeNumber
//
//  Created by Julianti Cahyadi on 07/04/21.
//

import UIKit
import MessageUI

class ProfilVC: UIViewController , MFMailComposeViewControllerDelegate{

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.cornerRadius = image.frame.width / 2
        image.layer.shadowColor = UIColor.gray.cgColor
        image.layer.shadowOpacity = 1.0
        image.layer.masksToBounds = false
        image.layer.shadowRadius = 2.0
    }
   
    @IBAction func linkedInTapped(_ sender: Any) {
        if let url = URL(string: "https://www.linkedin.com/in/julianticahyadi/") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func githubTapped(_ sender: Any) {
        if let url = URL(string: "https://github.com/cahyadijulianti/PrimeNumber") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func mailClicked(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["cahyadijulianti@gmail.com"])
            mail.setSubject("")
            mail.setMessageBody("", isHTML: true)
            present(mail, animated: true)
          } else {
            print("Application is not able to send an email")
        }
    }
    
}
