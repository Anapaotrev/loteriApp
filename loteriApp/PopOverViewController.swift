//
//  PopOverViewController.swift
//  loteriApp
//
//  Created by Ana Paola Treviño on 5/1/19.
//  Copyright © 2019 Ana Paola Treviño. All rights reserved.
//

import UIKit

class PopOverViewController: UIViewController {
    
    @IBOutlet var botonesCollection: [UIButton]!
    @IBOutlet weak var btnListo: RoundButton!
    
    var formaDeGanar: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferredContentSize = CGSize(width: 285, height: 300)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let vista = presentingViewController as! PlayViewController
        vista.formaGanar = formaDeGanar
    }
    
    @IBAction func seleccionarBoton(_ sender: UIButton) {
        btnListo.isEnabled = true
        formaDeGanar = sender.currentTitle
        for index in 0 ..< botonesCollection.count {
            botonesCollection[index].setImage(UIImage(named: botonesCollection[index].currentTitle!), for: .normal)
        }
        sender.setImage(UIImage(named: formaDeGanar + "Selec"), for: .normal)
    }

    @IBAction func dismissPopOver(_ sender: RoundButton) {
        self.dismiss(animated: true, completion: nil)
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
