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
        cell.separateview.layer.cornerRadius = 15
        cell.separateview.elevate(4)
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
    
    }
    
    func initView() {

        self.Detailtableview.delegate = self
        self.Detailtableview.dataSource = self
        self.Detailtableview.reloadData()
        self.Showlocationbtn.layer.cornerRadius = 17.5
    }

    
    func movetodetailscreen(Detailmodel: WelcomeElement){
        let VC = ViewController.initWithStory()
        VC.DetailDict = Detailmodel
        dump(VC.DetailDict)
        VC.modalPresentationStyle = .fullScreen
        VC.fromdetail = false
     
        self.detailvc.present(VC, animated: true)
    }

    @IBAction func showlocationbtnAction(_ sender: Any) {
        
        let vc = Mapvc.initWithStory()
        vc.modalPresentationStyle = .fullScreen
        self.detailvc.present(vc, animated: true)
        
        
    }
    


    override func darkModeChange() {
        super.darkModeChange()
      
    }
    

}



class Detailcell: UITableViewCell {

    @IBOutlet weak var Namelbl: UILabel!
    
    @IBOutlet weak var Editbtn: UIButton!
    @IBOutlet weak var Emaillbl: UILabel!
    @IBOutlet weak var separateview: UIView!
    
    @IBOutlet weak var Numberlbl: UILabel!
    
    @IBOutlet weak var Genderlbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }


    
}


public extension UIView{
    func elevate(_ elevation: Double,
                 shadowColor : UIColor = .gray,
                 opacity : Float = 0.3) {
        self.layer.masksToBounds = false
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: elevation)
        self.layer.shadowRadius = abs(elevation > 0 ? CGFloat(elevation) : -CGFloat(elevation))
        self.layer.shadowOpacity = opacity
    }
}
