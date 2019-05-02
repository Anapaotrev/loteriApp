/*
  PlayViewController.swift
  loteriApp
 
  Ana Paola Treviño
  Eduardo Aguilar
  Luis Gerardo Bravo
*/

import UIKit

class PlayViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var cardCollection: [UIButton]!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var cardsView: UIView!
    
    var cardNames: NSArray!
    var formaGanar: String!
    
    var cardsGenerated : Set = [-1]
    var cardsSelected = [Int]()
    
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
    
    func generateCards() {
        //for every button
        for card in cardCollection {
            //generate a unique number
            var number = Int(arc4random_uniform(54))
            var generatedCopy = true
            while(generatedCopy){
                if(!cardsGenerated.contains(number)) {
                    cardsGenerated.insert(number)
                    cardsSelected.append(number)
                    generatedCopy = false
                    //set button image according ot number
                    let dict = cardNames[number] as! NSDictionary
                    let image = UIImage(named: dict.value(forKey: "image") as! String)
                    card.setBackgroundImage(image, for: .normal)
                    card.setTitle(String(number), for: .normal)
                    print(card.tag)
                } else{
                    number = Int(arc4random_uniform(54))
                }
            }
        }
        //set corners as equals
        cardCollection[12].setBackgroundImage(cardCollection[3].backgroundImage(for: .normal) , for: .normal)
        cardsSelected[12] = cardsSelected[3]
    }
    
    @IBAction func selectCard(_ sender: UIButton) {
        let num = cardsSelected[sender.tag]
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
    }
    
    @IBAction func goBack(_ sender: Any) {
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    // Des Select all of the cards
    @IBAction func eraseSelected(_ sender: Any) {
        for card in cardCollection {
            if card.isSelected {
                let dict = cardNames[cardsSelected[card.tag]] as! NSDictionary
                let image = UIImage(named: dict.value(forKey: "image") as! String)
                card.setBackgroundImage(image, for: .normal)
                card.isSelected = false
            }
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
