//
//  PlayViewController.swift
//  loteriApp
//
//  Created by Ana Paola Treviño on 3/24/19.
//  Copyright © 2019 Ana Paola Treviño. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet var cardCollection: [UIButton]!
    
    var cardNames: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateCards()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: Any) {
        
    }
    
    func generateCards(){
        for card in cardCollection {
            let number = Int(arc4random_uniform(54))
//            let number = Int.random(in: 1 ..< 54)
            let dict = cardNames[number] as! NSDictionary
            let image = UIImage(named: dict.value(forKey: "image") as! String)
            card.setBackgroundImage(image, for: .normal)
            card.setTitle(String(number), for: .normal)
        }
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
