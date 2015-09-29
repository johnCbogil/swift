//
//  ViewController.swift
//  TapMe
//
//  Created by John Bogil on 9/29/15.
//  Copyright © 2015 John Bogil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tapMeButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var count = 0
    var seconds = 0
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapMeButtonDidPress(sender: AnyObject) {
        count++
        
        scoreLabel.text = "Score: \(count)"
        
    }
    
    func setupGame() {
        seconds = 10
        count = 0
        timeLabel.text = "Time: \(seconds)"
        scoreLabel.text = "Score: \(count)"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
    }
    
    func subtractTime() {
        seconds--
        timeLabel.text = "Time: \(seconds)"
        
        if seconds == 0 {
            timer.invalidate()
            let alert = UIAlertController(title: "Time is up fool!", message: "You scored \(count)", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: { action in self.setupGame()}))
            presentViewController(alert, animated: true, completion: nil)
        }
    }

}

