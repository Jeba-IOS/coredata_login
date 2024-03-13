//
//  DetailView.swift
//  localtask
//
//  Created by trioangle on 13/03/24.
//

import Foundation

import UIKit
import Alamofire
import CoreData

class DetailView: BaseView, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DetailDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Detailcell", for: indexPath) as! Detailcell
        cell.Editbtn.setTitle("", for: .normal)
        cell.Editbtn.layer.cornerRadius = 10
      //  cell.Editbtn.addTarget(self, action: hello, for: .allTouchEvents)
        cell.Editbtn.tag = indexPath.row
        cell.Editbtn.addTarget(self, action: #selector(movewelcomescreen), for: .touchUpInside)
       
        cell.Namelbl.text = DetailDict[indexPath.row].name
        cell.Emaillbl.text = DetailDict[indexPath.row].email
        cell.Numberlbl.text = DetailDict[indexPath.row].mobile
        cell.Genderlbl.text = DetailDict[indexPath.row].gender
        return cell
        
    }

    @objc public func movewelcomescreen(_sender: UIButton) {
print("tappeddddddddd")
        print(_sender.tag)
        
        self.movetodetailscreen(Detailmodel: DetailDict[_sender.tag])
        
        
    }
    var detailvc: DetailVc!
    
    @IBOutlet weak var Showlocationbtn: UIButton!
    var DetailDict = Welcome()
    @IBOutlet weak var Detailtableview: UITableView!
    override func didLoad(baseVC: BaseViewController) {
        self.detailvc = baseVC as? DetailVc
       // self.initView()
    }
    
    func initView() {

        self.Detailtableview.delegate = self
        self.Detailtableview.dataSource = self
        self.Detailtableview.reloadData()
    }

    func movetodetailscreen(Detailmodel: WelcomeElement){
        let ContactusVC = ViewController.initWithStory()
        ContactusVC.DetailDict = Detailmodel
        dump(ContactusVC.DetailDict)
        ContactusVC.fromdetail = false
       // ContactusVC.modalPresentationStyle = .fullScreen
        self.detailvc.present(ContactusVC, animated: true)
    }

    @IBAction func showlocationbtnAction(_ sender: Any) {
        
        let ContactusVC = Mapvc.initWithStory()
  
        self.detailvc.present(ContactusVC, animated: true)
        
        
    }
    


    override func darkModeChange() {
        super.darkModeChange()
      
    }
    

}



class Detailcell: UITableViewCell {

    @IBOutlet weak var Namelbl: UILabel!
    
    @IBOutlet weak var Editbtn: UIButton!
    @IBOutlet weak var Emaillbl: UILabel!
    
    @IBOutlet weak var Numberlbl: UILabel!
    
    @IBOutlet weak var Genderlbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }


    
}
