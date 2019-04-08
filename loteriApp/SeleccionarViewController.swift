//
//  SeleccionarViewController.swift
//  loteriApp
//
//  Created by Luis Bravo on 4/7/19.
//  Copyright © 2019 Ana Paola Treviño. All rights reserved.
//

import UIKit

class SeleccionarViewController: UIViewController {
    
    @IBOutlet var botonesCollection: [UIButton]!
    var formaGanar: String!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func seleccionarBoton(_ sender: UIButton) {
        formaGanar = sender.currentTitle
        for index in 0 ..< botonesCollection.count {
            botonesCollection[index].setImage(UIImage(named: botonesCollection[index].currentTitle!), for: .normal)
        }
        sender.setImage(UIImage(named: formaGanar + "Selec"), for: .normal)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaPlay = segue.destination as! PlayViewController
        vistaPlay.formaGanar = formaGanar
    }

}