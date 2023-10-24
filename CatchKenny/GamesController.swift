//
//  GamesController.swift
//  CatchKenny
//
//  Created by Batuhan Akdemir on 24.10.2023.
//

import UIKit
import CoreData

class GamesController: UIViewController {
    
   
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    var score = 0
    var timer = Timer()
    var counter = 10
    var kennyArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    var userName : String?
   
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewDidLoad()
        
    }
    
    func initViewDidLoad() {
      
        scoreLabel.text = "\(TextConstants.score) \(score)"
        enableUserInteractionForKennyImages()
        setupTapRecognizersForKennyImages()
        kennyArray = [kenny1,kenny2,kenny3,kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
        counter = 10
        timeLabel.text = String (counter)
        startTimers()
        hideKenny()
    }
    

    func startTimers() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showRandomKenny), userInfo: nil, repeats: true)
    }
    
    func hideKenny() {
           
          for kenny in kennyArray {
              kenny.isHidden = true
          }
      }
      
      @objc func showRandomKenny() {
          
          hideKenny()
          let random = Int (arc4random_uniform(UInt32(kennyArray.count - 1)))
          kennyArray[random].isHidden = false
      }
    
    
    @IBAction func resetClicked(_ sender: Any) {
        replayGame()
    }
    
    
    @IBAction func backClicked(_ sender: Any) {
        performSegue(withIdentifier: SegueKeys.toHomeVC1.rawValue, sender: nil)
    }
    
    
    @objc func  countDown() {
        
        counter -= 1
        timeLabel.text = String (counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            hideKenny()
            saveScore()
            let alert = Alert.okAlert(title: TextConstants.timesUp, message:  "\(TextConstants.scoreAlert) \(self.score)" )
            self.present(alert, animated: true)
            
        }
    }
    
    func saveScore() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newGame = NSEntityDescription.insertNewObject(forEntityName: "Scores", into: context)
        newGame.setValue(userName, forKey: ScoreKeys.name.rawValue)
        newGame.setValue(self.score, forKey: ScoreKeys.score.rawValue)
        newGame.setValue(UUID(), forKey: ScoreKeys.id.rawValue)
        
        do {
            try context.save()
        } catch {
            print("Error")
        }
        
        
    }
    
    func replayGame(){
        self.score = 0
        self.scoreLabel.text = "\(TextConstants.score) \(self.score)"
        self.counter = 10
        self.timeLabel.text = String (self.counter)
        startTimers()
    }
    
    
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "\(TextConstants.score) \(score)"
    }
    
    
    
    func enableUserInteractionForKennyImages() {
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
    }
    
    func setupTapRecognizersForKennyImages() {
        
            let recognizers: [UITapGestureRecognizer] = [
            UITapGestureRecognizer(target: self, action: #selector(increaseScore)),
            UITapGestureRecognizer(target: self, action: #selector(increaseScore)),
            UITapGestureRecognizer(target: self, action: #selector(increaseScore)),
            UITapGestureRecognizer(target: self, action: #selector(increaseScore)),
            UITapGestureRecognizer(target: self, action: #selector(increaseScore)),
            UITapGestureRecognizer(target: self, action: #selector(increaseScore)),
            UITapGestureRecognizer(target: self, action: #selector(increaseScore)),
            UITapGestureRecognizer(target: self, action: #selector(increaseScore)),
            UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        ]
        
        let kennyImages: [UIImageView] = [kenny1, kenny2, kenny3, kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
        
        for (index, recognizer) in recognizers.enumerated() {
            kennyImages[index].addGestureRecognizer(recognizer)
        }
    }
    
}
