//
//  ViewController.swift
//  loteriApp
//
//  Ana Paola Treviño
//  Luis Gerardo Bravo
//  Eduardo Aguilar
//

import UIKit

class ViewController: UIViewController {
    
    var loteriaCards : NSArray!
    @IBOutlet weak var dar: RoundButton!
    @IBOutlet weak var jugar: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dar.titleLabel?.minimumScaleFactor = 0.5 //set whatever you want here to scale
        dar.titleLabel?.adjustsFontSizeToFitWidth = true
        
        jugar.titleLabel?.minimumScaleFactor = 0.5 //set whatever you want here to scale
        jugar.titleLabel?.adjustsFontSizeToFitWidth = true
        
        let path = Bundle.main.path(forResource:
            "LoteriaCards", ofType: "plist")
        
        loteriaCards = NSArray(contentsOfFile: path!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dar" {
            let giveView = segue.destination as! GiveViewController
            giveView.cards = loteriaCards
        }
        else if segue.identifier == "selec" {
            let selecView = segue.destination as! SeleccionarViewController
            selecView.cardNames = loteriaCards
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    override var shouldAutorotate: Bool {
        return false
    }
}

