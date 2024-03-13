//
//  DetailVc.swift
//  localtask
//
//  Created by trioangle on 13/03/24.
//

import Foundation
import UIKit
import Alamofire
class DetailVc: BaseViewController {
    @IBOutlet var detailview: DetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callAPi()
        // Do any additional setup after loading the view.
    }
    
    class func initWithStory() -> DetailVc {
        let view: DetailVc = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVc") as? DetailVc)!
     
     //   view.profileVM = ProfilesViewModel()
        return view
    }
    func callAPi() {
            let url = "https://crudcrud.com/api/c97ffe72651e49599a64872330ca344c/jeba"
        AF.request(url, method: .get) .responseDecodable(of: Welcome.self) { [self]
                responce in
                switch responce.result {
                case .success(let value):
                    self.detailview.DetailDict = value
                 dump(self.detailview.DetailDict)
                    self.detailview.initView()
                
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }

}
