//
//  ScoresController.swift
//  CatchKenny
//
//  Created by Batuhan Akdemir on 24.10.2023.
//

import UIKit
import CoreData

class ScoresController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
   
    var nameArray  = [String]()
    var scoreArray = [String]()
    
    @IBAction func goToHome(_ sender: Any) {
        performSegue(withIdentifier: SegueKeys.toHomeVC2.rawValue, sender: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    
    
    func getData () {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest  = NSFetchRequest<NSFetchRequestResult>(entityName: "Scores")
        fetchRequest.returnsObjectsAsFaults = false
        do {
           let results =  try context.fetch(fetchRequest)
              if !results.isEmpty  {
                  for result in results as! [NSManagedObject] {
                      if let name = result.value(forKey: ScoreKeys.name.rawValue) as? String {
                          self.nameArray.append(name)
                      }
                      
                      if let score = result.value(forKey: ScoreKeys.score.rawValue) as? Int {
                          self.scoreArray.append( String (score) )
                      }
                      
                      tableView.reloadData()
                  }
              }
              
          } catch {
              print("Error")
          }
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = UITableViewCell()
         cell.textLabel?.text = "\(nameArray[indexPath.row]) :  \(scoreArray[indexPath.row])"
         return cell
    }
    
   
    
}
