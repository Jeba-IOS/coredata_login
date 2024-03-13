//
//  File.swift
//  localtask
//
//  Created by trioangle on 11/03/24.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    fileprivate var _baseView : BaseView? {
        return self.view as? BaseView
    }
    fileprivate var onExit : (()->())? = nil
    
    var stopSwipeExitFromThisScreen : Bool? {
        return nil
    }
    //MARK:- life cycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self._baseView?.didLoad(baseVC: self)
        // Do any additional setup after loading the view.
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self._baseView?.darkModeChange()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self._baseView?.willAppear(baseVC: self)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self._baseView?.didAppear(baseVC: self)
     
   
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self._baseView?.willDisappear(baseVC: self)
        
      
    }
    
    override
    var preferredStatusBarStyle: UIStatusBarStyle {
        return self.traitCollection.userInterfaceStyle == .dark ? .lightContent : .darkContent
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self._baseView?.didDisappear(baseVC: self)
        
   
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self._baseView?.didLayoutSubviews(baseVC: self)
    }


  

}
