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
    
    var cartasLoteria = [Loteria]()

    override func viewDidLoad() {
        super.viewDidLoad()
        cartasLoteria.removeAll()

        guard let cartasTmp = retrieveCartas() else { return }

        cartasLoteria = cartasTmp
        
        for card in cartasLoteria {
            print(card.card)
            print("\n")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func retrieveCartas() -> [Loteria]? {
        do {
            let data = try Data.init(contentsOf: Loteria.archiveURL)
            let cartasTmp = try PropertyListDecoder().decode([Loteria].self, from: data)
            return cartasTmp
        }
        catch {
            return []
        }
    }
    
}

