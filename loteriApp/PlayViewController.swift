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
    
    @IBOutlet weak var lbForma: UILabel!
    
    let cardNames: [Int: String] = [
        1:"1gallo",2:"2diablito",3:"3dama",4:"4catrin",5:"5paraguas",
        6:"6sirena",7:"7escalera",8:"8botella",9:"9barril",10:"10arbol",
        11:"11melon",12:"12valiente",13:"13gorrito",14:"14muerte",15:"15pera",
        16:"16bandera",17:"17bandolon",18:"18violoncello",19:"19garza",20:"20pajaro",
        21:"21mano",22:"22bota",23:"23luna",24:"24cotorro",25:"25borracho",
        26:"26negrito",27:"27corazon",28:"28sandia",29:"29tambor",30:"30camaron",
        31:"31jaras",32:"32musico",33:"33araña",34:"34soldado",35:"35estrella",
        36:"36cazo",37:"37mundo",38:"38apache",39:"39nopal",40:"40alacran",
        41:"41rosa",42:"42calavera",43:"43campana",44:"44cantarito",45:"45venado",
        46:"46sol",47:"47corona",48:"48chalupa",49:"49pino",50:"50pescado",
        51:"51palma",52:"52maceta",53:"arpa",54:"54ranas"]
    
    var formaGanar: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateCards()
        lbForma.text = formaGanar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: Any) {
        
    }
    
    func generateCards(){
        for card in cardCollection {
            let number = Int.random(in: 1 ..< 54)
            let image = UIImage(named: cardNames[number]!)
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
