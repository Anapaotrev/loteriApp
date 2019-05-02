/*
  GiveViewController.swift
  loteriApp

  Ana Paola Treviño
  Eduardo Aguilar
  Luis Gerardo Bravo
*/

import UIKit
import AVFoundation

class GiveViewController: UIViewController {

    var cards : NSArray!
    var shuffledCards : NSArray!
    var dict : NSDictionary!
    var counter : Int!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var card: UIView!
    
    var divisor : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffledCards = cards.shuffled() as NSArray// shuffle deck
//        shuffledCards = cards
        dict = shuffledCards[0] as? NSDictionary
        cardImage.image = UIImage(named: dict.value(forKey: "image") as! String)
        voiceCard(cardName: dict.value(forKey: "name") as! String)
        counter = 0 // card counter
        
        divisor = (view.frame.width / 2) / 0.61
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: Any) {
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextCard(_ sender: UIButton) {
        if sender.titleLabel?.text == "SIGUIENTE" && counter < 53 {
            counter = counter + 1
        } else if sender.titleLabel?.text == "ANTERIOR" && counter > 0{
            counter = counter - 1
        }
        if counter < 54 || counter > 0 {
            dict = shuffledCards[counter] as? NSDictionary
            cardImage.image = UIImage(named: dict.value(forKey: "image") as! String)
            voiceCard(cardName: dict.value(forKey: "name") as! String)
        }
    }
    
    func nextCards(next:Bool) {
        if next && counter < 53 {
            counter = counter + 1
        } else if !next && counter > 0{
            counter = counter - 1
        }
        if counter < 54 || counter > 0 {
            dict = shuffledCards[counter] as? NSDictionary
            cardImage.image = UIImage(named: dict.value(forKey: "image") as! String)
            let utterance = AVSpeechUtterance(string: dict.value(forKey: "name") as! String)
            utterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
            utterance.rate = 0.5
            
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        }
    }

    func voiceCard(cardName: String) {
        let utterance = AVSpeechUtterance(string: cardName)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
        utterance.rate = 0.5
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
        
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor)
        
        if sender.state == UIGestureRecognizerState.ended {
            if card.center.x < 75 {
                /*UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                })*/
                nextCards(next: false)
                resetCard()
                return
            } else if card.center.x > (view.frame.width - 75) {
                /*UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                })*/
                nextCards(next: true)
                resetCard()
                return
            }
            resetCard()
        }
    }
    
    func resetCard() {
        UIView.animate(withDuration: 0.2, animations: {
            self.card.center = self.view.center
            self.card.alpha = 1
            self.card.transform = .identity
        })
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
      
    override var shouldAutorotate: Bool {
        return false
    }
}
