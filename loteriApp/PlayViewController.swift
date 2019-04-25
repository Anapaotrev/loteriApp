/*
  PlayViewController.swift
  loteriApp
 
  Ana Paola Treviño
  Eduardo Aguilar
  Luis Gerardo Bravo
*/

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet var cardCollection: [UIButton]!
    
    var cardNames: NSArray!
    var formaGanar: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateCards()
        print(formaGanar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateCards() {
        var cardsGenerated : Set = [-1]
        //for every button
        for card in cardCollection {
            //generate a unique number
            var number = Int(arc4random_uniform(54))
            var generatedCopy = true
            while(generatedCopy){
                if(!cardsGenerated.contains(number)) {
                    cardsGenerated.insert(number)
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
    }
    
    @IBAction func selectCard(_ sender: UIButton) {
        let overlay = UIView(frame: CGRect(x: 0, y: 0, width: sender.frame.width, height: sender.frame.height))
        overlay.backgroundColor = UIColor.black
        overlay.sizeToFit()
        overlay.alpha = CGFloat(floatLiteral: 0.5)
        sender.addSubview(overlay)
//        sender.bringSubview(toFront: overlay)
    }
    
    @IBAction func unselectCard( sender: UIView) {
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
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
