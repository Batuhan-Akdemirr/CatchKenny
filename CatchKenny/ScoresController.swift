//
//  ScoresController.swift
//  CatchKenny
//
//  Created by Batuhan Akdemir on 24.10.2023.
//

import UIKit

class ScoresController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBAction func goToHome(_ sender: Any) {
        performSegue(withIdentifier: SegueKeys.toHomeVC2.rawValue, sender: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
               let cell = UITableViewCell()
               var content = cell.defaultContentConfiguration()
               content.text = "Test"
               cell.contentConfiguration = content
               return cell
    }
    
   
    
}
