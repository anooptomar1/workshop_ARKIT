//
//  ListExercicesController.swift
//  arkitDev
//
//  Created by ibrahim on 06/12/2017.
//  Copyright © 2017 arkitWorkshop. All rights reserved.
//

import UIKit
import ARKit

class ListExercicesController: UIViewController {
    
    @IBOutlet weak var Exo1Label: UILabel!
    @IBAction func startButton(_ sender: Any) {
    }
    
    @IBAction func pauseButton(_ sender: Any) {
  
    }
    @IBAction func refreshButton(_ sender: Any) {
   
    }
    @IBOutlet weak var Exo2Label: UILabel!
    @IBOutlet weak var Exo3Label: UILabel!
    @IBAction func Button1Exo1(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        
        //Exo1Label.text = String(counter)
        //timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
        
        /*func updateCounter()
        {
            SwiftCounter++
            Exo1Label.text = String(SwiftCounter)
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
