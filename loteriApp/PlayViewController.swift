/*
  PlayViewController.swift
  loteriApp
 
  Ana Paola Treviño
  Eduardo Aguilar
  Luis Gerardo Bravo
*/

import UIKit

class PlayViewController: UIViewController, UIScrollViewDelegate, UIPopoverPresentationControllerDelegate {
    
    // MARK: - Outlets, variables
    @IBOutlet var cardCollection: [UIButton]!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var cardsView: UIView!
    @IBOutlet weak var btnMismaTabla: RoundButton!
    
    var cardNames: NSArray!
    var formaGanar: String!
    
    var cardsGenerated : Set = [-1]
    var cardsSelectedForGameSetup = [Int]()
    
    // MARK: - QOL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateCards()
        print(formaGanar)
        
        scrollView.addSubview(cardsView)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return cardsView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Card Functionality
    
    func generateCards() {
        //for every button
        for card in cardCollection {
            //generate a unique number
            var number = Int(arc4random_uniform(54))
            var generatedCopy = true
            while(generatedCopy){
                if(!cardsGenerated.contains(number)) {
                    cardsGenerated.insert(number)
                    cardsSelectedForGameSetup.append(number)
                    generatedCopy = false
                    //set button image according ot number
                    let dict = cardNames[number] as! NSDictionary
                    let image = UIImage(named: dict.value(forKey: "image") as! String)
                    card.setBackgroundImage(image, for: .normal)
                    card.setTitle(String(number), for: .normal)
                } else{
                    number = Int(arc4random_uniform(54))
                }
            }
        }
        //set corners as equals
        cardCollection[12].setBackgroundImage(cardCollection[3].backgroundImage(for: .normal) , for: .normal)
        cardsSelectedForGameSetup[12] = cardsSelectedForGameSetup[3]
    }
    
    @IBAction func selectCard(_ sender: UIButton) {
        let num = cardsSelectedForGameSetup[sender.tag]
        let dict = cardNames[num] as! NSDictionary
        var image : UIImage!
        
        if sender.isSelected {
            // set deselected
            image = UIImage(named: dict.value(forKey: "image") as! String)
            sender.isSelected = false
        } else {
            // set selected
            image = UIImage(named: dict.value(forKey: "bw") as! String)
            sender.isSelected = true
        }
        sender.setBackgroundImage(image, for: .normal)
        checkWinState()
    }
    
    // MARK: - POP over
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popOver" {
            let popver = segue.destination as! PopOverViewController
            popver.popoverPresentationController!.delegate = self
        }
    }
    
    // reusar la misma tabla
    @IBAction func eraseSelected(_ sender: Any) {
        for card in cardCollection {
            if card.isSelected {
                let dict = cardNames[cardsSelectedForGameSetup[card.tag]] as! NSDictionary
                let image = UIImage(named: dict.value(forKey: "image") as! String)
                card.setBackgroundImage(image, for: .normal)
                card.isSelected = false
            }
        }
    }
  
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return false
    }
    
    /*
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
  
    // MARK: - Lotery Logic
    
    func checkCards(arr: [Int]) -> Bool {
        
        var allCardsOn = true
        //check that all indexes in "arr"
        for index in arr {
            allCardsOn = allCardsOn && cardCollection[index].isSelected
        }
        
        return allCardsOn
    }
    
    func checkWinState(){
        var won = false
        switch formaGanar{
        case "Vertical":
            for offset in 0...3 {
                won = won || checkCards(arr: [0+offset, 4+offset, 8+offset, 12+offset])
            }
        case "Horizontal":
            for offset in [0,4,8,12] {
                won = won || checkCards(arr: [0+offset, 1+offset, 2+offset, 3+offset])
            }
        case "Diagonal":
            won = won || checkCards(arr: [0, 5, 10, 15])
            won = won || checkCards(arr: [3, 6, 9, 12])
        case "CuadroChico":
            /*
             Borrar comentarios y logica dependiendo de decision en
                respecto a las reglas de loteria ()
             -Nose si cuadro chico, son todos los cuadros o nms el den medio-
            */
            //checar cuadro chico de en-centro
            won = won || checkCards(arr: [5, 6, 9, 10])
            
            //checar todos los cuadros (incluyendo el del centro)
            for offsetVerticalAxis in [0,4,8] {
                for offsetHorizontalAxis in 0...2 {
                    let offset = offsetVerticalAxis + offsetHorizontalAxis
                    won = won || checkCards(arr:[0+offset, 1+offset, 4+offset, 5+offset])
                }
            }
        case "CuadroGrande":
            won = checkCards(arr: [0, 3, 12, 15])
        case "Lleno":
            won = checkCards(arr: Array(0...15))
        default:
            print("Algo anda mal muchachos")
        }
        if(won){
            performSegue(withIdentifier: "winSegue", sender: nil)
        }
    }
    
    // MARK: - Navigation
    
    @IBAction func goBack(_ sender: Any) {
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindWinner(segue:UIStoryboardSegue) {
        btnMismaTabla.sendActions(for: .touchUpInside)
    }
//    let vista = presentingViewController as! PlayViewController
//    vista.btnMismaTabla.sendActions(for: .touchUpInside)
    
}
