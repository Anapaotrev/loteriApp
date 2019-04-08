//
//  GiveViewController.swift
//  loteriApp
//
//  Created by Ana Paola Treviño on 4/7/19.
//  Copyright © 2019 Ana Paola Treviño. All rights reserved.
//

import UIKit
import AVFoundation

class GiveViewController: UIViewController {

    var cards : NSArray!
    var shuffledCards : NSArray!
    var dict : NSDictionary!
    var counter : Int!
    @IBOutlet weak var cardImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffledCards = cards.shuffled() as NSArray// shuffle deck
        
        dict = shuffledCards[0] as? NSDictionary
        cardImage.image = UIImage(named: dict.value(forKey: "image") as! String)
        counter = 0 // card counter
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: Any) {
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextCard(_ sender: Any) {
        counter = counter + 1
        dict = shuffledCards[counter] as? NSDictionary
        cardImage.image = UIImage(named: dict.value(forKey: "image") as! String)
        let utterance = AVSpeechUtterance(string: dict.value(forKey: "name") as! String)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
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
