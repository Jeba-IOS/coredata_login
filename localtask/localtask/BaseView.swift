//
//  BaseView.swift
//  localtask
//
//  Created by trioangle on 11/03/24.
//

import Foundation
import UIKit
class BaseView: UIView {
    fileprivate var baseVC : BaseViewController?


    
    
    func didLoad(baseVC : BaseViewController){
    
    
        self.baseVC = baseVC
        self.darkModeChange()
        
    }
    
    func didLayoutsubviews(baseVC : BaseViewController){

        self.baseVC = baseVC
        self.darkModeChange()
        
    }
    
    
    func darkModeChange(){
        UIView.animate(withDuration: 0.3) {
            self.baseVC?.setNeedsStatusBarAppearanceUpdate()
        }
      
        

    }
    
    func willAppear(baseVC : BaseViewController){}
    func didAppear(baseVC : BaseViewController){}
    func willDisappear(baseVC : BaseViewController){}
    func didDisappear(baseVC : BaseViewController){}
    func didLayoutSubviews(baseVC: BaseViewController){}

    //MARK:- UDF

}
extension UIColor{
    public  convenience init(hex : String?) {
        guard let hex = hex else {
            self.init()
            return }
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 1, green: 1, blue: 1, alpha: 1)
            return
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
