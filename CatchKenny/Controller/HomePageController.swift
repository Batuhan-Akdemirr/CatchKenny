//
//  HomePageController.swift
//  CatchKenny
//
//  Created by Batuhan Akdemir on 24.10.2023.
//

import UIKit

class HomePageController: UIViewController {
    
    @IBOutlet weak var userInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func startClicked(_ sender: Any) {
        
        if userInput.text  == "" {
            
         let alert =  Alert.okAlert(title: TextConstants.warning, message: TextConstants.enterName)
         self.present(alert, animated: true)
            
        }
        else {
            performSegue(withIdentifier: SegueKeys.toGamesVC.rawValue, sender: nil)
        }
       
    }
    
    
    @IBAction func allScoresClicked(_ sender: Any) {
       performSegue(withIdentifier: SegueKeys.toAllScoresVC.rawValue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SegueKeys.toGamesVC.rawValue {
            let destination = segue.destination as! GamesController
            destination.userName = userInput.text
        }
    }
    
}
