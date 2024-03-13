//
//  ViewControllerView.swift
//  localtask
//
//  Created by trioangle on 11/03/24.
//


import Foundation
import UIKit
import Alamofire
import CoreData

class ViewControllerView: BaseView {
    
    var viewController: ViewController!
    
    @IBOutlet weak var nameview: UIView!
    @IBOutlet weak var nametxtfld: UITextField!
 
    @IBOutlet weak var emailview: UIView!
    @IBOutlet weak var emailtxtfld: UITextField!
    
    @IBOutlet weak var numberview: UIView!
    @IBOutlet weak var numbertxtfld: UITextField!
    
    @IBOutlet weak var genderview: UIView!
    @IBOutlet weak var gendertxtfld: UITextField!
    
    @IBOutlet weak var continuebtn: UIButton!

    @IBOutlet weak var closebtn: UIButton!
    override func didLoad(baseVC: BaseViewController) {
        self.viewController = baseVC as? ViewController
        self.initView()
    }
    
    func initView() {
        self.nameview.layer.cornerRadius =  self.nameview.frame.height / 2
        self.nameview.layer.borderColor = UIColor.lightGray.cgColor
        self.nameview.layer.borderWidth = 0.5
        self.nametxtfld.borderStyle = .none
        self.nametxtfld.delegate = self
        
        self.emailview.layer.cornerRadius =  self.emailview.frame.height / 2
        self.emailview.layer.borderColor = UIColor.lightGray.cgColor
        self.emailview.layer.borderWidth = 0.5
        self.emailtxtfld.borderStyle = .none
        self.emailtxtfld.delegate = self
        
        self.numberview.layer.cornerRadius =  self.numberview.frame.height / 2
        self.numberview.layer.borderColor = UIColor.lightGray.cgColor
        self.numberview.layer.borderWidth = 0.5
        self.numbertxtfld.borderStyle = .none
        self.numbertxtfld.delegate = self
        
        
        self.genderview.layer.cornerRadius =  self.genderview.frame.height / 2
        self.genderview.layer.borderColor = UIColor.lightGray.cgColor
        self.genderview.layer.borderWidth = 0.5
        self.gendertxtfld.borderStyle = .none
        self.gendertxtfld.delegate = self
        
        self.continuebtn.layer.cornerRadius =  self.continuebtn.frame.height / 2
        
        if !self.viewController.fromdetail{
            print("Check")
            self.closebtn.isHidden = false
            self.nametxtfld.text = self.viewController.DetailDict.name
            self.emailtxtfld.text =  self.viewController.DetailDict.email
            self.gendertxtfld.text = self.viewController.DetailDict.gender
            self.numbertxtfld.text = self.viewController.DetailDict.mobile
        }else{
            self.closebtn.isHidden = true
        }
         
       
        self.closebtn.setTitle("", for: .normal)
      //  self.postAPICall()
    }

    @IBAction func closebtnAction(_ sender: Any) {
        
        self.viewController.dismiss(animated: true)
        
    }
    @IBAction func ContinueAction(_ sender: Any) {
        if !self.viewController.fromdetail{
            self.viewController.PUTAPICall(name: nametxtfld.text ?? "", email: emailtxtfld.text ?? "", mobile: numbertxtfld.text ?? "", gender: gendertxtfld.text ?? "")
            
        }else{
            
            self.viewController.postAPICall(name: nametxtfld.text ?? "", email: emailtxtfld.text ?? "", mobile: numbertxtfld.text ?? "", gender: gendertxtfld.text ?? "")
            
        }
        
        
        
        
    }

//    func callAPi() {
//            let url = "https://crudcrud.com/api/a1a85116ac734a98865d1cc2b488b88d/jeba"
//        AF.request(url, method: .get) .responseDecodable(of: WelcomeElement.self) { [self]
//                responce in
//                switch responce.result {
//                case .success(let value):
//                    print("Response JSON: \(value)")
//                
//                case .failure(let error):
//                    print("Error: \(error)")
//                }
//            }
//        }
    func createData() {
  
        UserDefaults.standard.setValue(false, forKey: "I_Login")
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let managedContext = appDelegate.persistentContainer.viewContext
            guard let userEntity = NSEntityDescription.entity(forEntityName: "LocalData", in: managedContext) else { return }
            let user =  NSManagedObject(entity: userEntity, insertInto: managedContext)
            user.setValue(nametxtfld.text, forKey: "name")
            user.setValue(emailtxtfld.text, forKey: "email")
            user.setValue(numbertxtfld.text, forKey: "number")
            user.setValue(gendertxtfld.text, forKey: "gender")
            print(user)
            do {
                try managedContext.save()
                debugPrint("Data saved")
            } catch let error as NSError {
                debugPrint(error)
            }
        }


    override func darkModeChange() {
        super.darkModeChange()
      
    }
    

}



extension ViewControllerView: UITextFieldDelegate {
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
   }
}
