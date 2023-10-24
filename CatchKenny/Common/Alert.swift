//
//  Alert.swift
//  CatchKenny
//
//  Created by Batuhan Akdemir on 24.10.2023.
//

import Foundation
import UIKit


struct  Alert {
    
    
    static func okAlert(title: String ,message: String ) -> UIAlertController{
        
        let alert = UIAlertController(title: title, message: message,  preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: TextConstants.ok, style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        
        return alert
      
    }
    
    
}
