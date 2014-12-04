//
//  ViewController.swift
//  Tap Me
//
//  Created by ZopperMAC on 11/29/14.
//  Copyright (c) 2014 ZopperMAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var count = 0;
    var seconds = 0;
    var timer = NSTimer()
    func setupGame(){
        seconds = 30
        count = 0
        timerLabel.text = "Time: \(seconds)"
        scoreLabel.text = "Score: \(count)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
    }
    func subtractTime(){
        seconds--
        timerLabel.text = "Time: \(seconds)"
        
        if(seconds == 0){
            timer.invalidate()
            let alert = UIAlertController(title: "Time is up!", message: "You scored \(count) points", preferredStyle:UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {action in self.setupGame()
            }))
            presentViewController(alert, animated: true, completion: nil)
            
        }
    }
    @IBAction func buttonPressed(sender: UIButton) {
        
        count += 1
        scoreLabel.text="Score \n\(count)"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

