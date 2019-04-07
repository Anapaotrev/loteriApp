//
//  GiveViewController.swift
//  loteriApp
//
//  Created by Ana Paola Treviño on 4/7/19.
//  Copyright © 2019 Ana Paola Treviño. All rights reserved.
//

import UIKit

class GiveViewController: UIViewController {

    var cards : NSArray!
    var dict : NSDictionary!
    @IBOutlet weak var cardImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cards.shuffle()
        
        dict = cards[0] as! NSDictionary
        cardImage.image = UIImage(named: dict.value(forKey: "image") as! String)
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
