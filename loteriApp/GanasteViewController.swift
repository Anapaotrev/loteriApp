//
//  GanasteViewController.swift
//  loteriApp
//
//  Created by Marcela Leal on 5/2/19.
//  Copyright © 2019 Ana Paola Treviño. All rights reserved.
//

import UIKit

class GanasteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(_ sender: Any) {
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goBackOne(_ sender: RoundButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
