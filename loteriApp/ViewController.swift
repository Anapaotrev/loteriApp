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

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}

