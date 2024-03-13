//
//  ViewController.swift
//  localtask
//
//  Created by trioangle on 11/03/24.
//

import UIKit
import Alamofire
class ViewController: BaseViewController {
    var DetailDict = WelcomeElement()
    
    
    var fromdetail = true
    @IBOutlet var viewcontrollerview: ViewControllerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    class func initWithStory() -> ViewController {
        let view: ViewController = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController)!
     
     //   view.profileVM = ProfilesViewModel()
        return view
    }
    func postAPICall(name:String,email:String,mobile:String,gender:String) {
 //   let parameters = ["firstName":"Rohit", "lastName":"Tamkhane"]
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        alert.view.tintColor = UIColor.black
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(10, 5, 50, 50)) as UIActivityIndicatorView
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        let headers: HTTPHeaders = [
            "Content-Type": "application/json", // "application/json" should be lowercase
            "Accept-Charset": "utf-8"
        ]

        // Assuming `some` is your parameters dictionary
        let parameters: [String: Any] = [
            "name": name,
            "email": email,
            "mobile": mobile,
            "gender": gender
        ]

        AF.request("https://crudcrud.com/api/027ca3edadc04690907efe1613d0d176/jeba",
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.default, // Encode parameters as JSON
                   headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    self.dismiss(animated: false, completion: nil)
                    print("Response JSON: \(value)")
                    self.viewcontrollerview.createData()
                    self.movetodetailscreen()
                case .failure(let error):
                    print("Error: \(error)")
                }
            }

//        let headers: HTTPHeaders = ["content-type": "Application/json","Accept-Charset": "utf-8"]
//        AF.request("https://crudcrud.com/api/a1a85116ac734a98865d1cc2b488b88d/jeba", method: .post, parameters: some, headers: headers).response(completionHandler: { respons in
//                        switch respons.result {
//                        case .success(let value):
//                            print("Response JSON: \(String(describing: value))")
//                        dump(respons)
//                        case .failure(let error):
//                            print("Error: \(error)")
//                        }
//        })
//        { response in
//            switch response.result {
//            case .success(let value):
//                print("Response JSON: \(String(describing: value))")
//            dump(response)
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//    }
    }
    
    
    func movetodetailscreen(){
        let ContactusVC = DetailVc.initWithStory()
        ContactusVC.modalPresentationStyle = .fullScreen
        self.present(ContactusVC, animated: true)
    }
}

