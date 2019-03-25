//
//  Loteria.swift
//  loteriApp
//
//  Created by Ana Paola Treviño on 3/24/19.
//  Copyright © 2019 Ana Paola Treviño. All rights reserved.
//

import UIKit

class Loteria: Codable {
    
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let archiveURL = documentsDirectory.appendingPathComponent("Loteria")
    
    var card : String
    var image : UIImage?
    
    init(card : String, image : UIImage?) {
        self.card = card
        self.image = image
    }
    
    enum CodingKeys : String, CodingKey {
        case card
        case image
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(card, forKey: .card)
        
        var imageData : Data?
        if let imageAvailable = image {
            imageData = UIImagePNGRepresentation(imageAvailable)
        }
        else {
            imageData = nil
        }
        try container.encode(imageData, forKey: .image)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        card = try container.decode(String.self, forKey: .card)
        
        let imageData = try container.decode(Data?.self, forKey: .image)
        if let imageAvailable = imageData {
            image = UIImage(data: imageAvailable)
        }
        else {
            image = nil
        }
    }
}
    
    // Loteria Array
    /* [Loteria(card: "El Gallo", image: UIImage(named: "1gallo")),
    Loteria(card: "El Diablito", image: UIImage(named: "2diablito")),
    Loteria(card: "La Dama", image: UIImage(named: "3dama")),
    Loteria(card: "El Catrin", image: UIImage(named: "4catrin")),
    Loteria(card: "El Paraguas", image: UIImage(named: "5paraguas")),
    Loteria(card: "La Sirena", image: UIImage(named: "6sirena")),
    Loteria(card: "La Escalera", image: UIImage(named: "7escalera")),
    Loteria(card: "La Botella", image: UIImage(named: "8botella")),
    Loteria(card: "El Barril", image: UIImage(named: "9barril")),
    Loteria(card: "El Arbol", image: UIImage(named: "10arbol")),
    Loteria(card: "El Melon", image: UIImage(named: "11melon")),
    Loteria(card: "El Valiente", image: UIImage(named: "12valiente")),
    Loteria(card: "El Gorrito", image: UIImage(named: "13gorrito")),
    Loteria(card: "La Muerte", image: UIImage(named: "14muerte")),
    Loteria(card: "La Pera", image: UIImage(named: "15pera")),
    Loteria(card: "La Bandera", image: UIImage(named: "16bandera")),
    Loteria(card: "El Bandolon", image: UIImage(named: "17bandolon")),
    Loteria(card: "El Violoncello", image: UIImage(named: "18violoncello")),
    Loteria(card: "La Garza", image: UIImage(named: "19garza")),
    Loteria(card: "El Pajaro", image: UIImage(named: "20pajaro")),
    Loteria(card: "La Mano", image: UIImage(named: "21mano")),
    Loteria(card: "La Bota", image: UIImage(named: "22bota")),
    Loteria(card: "La Luna", image: UIImage(named: "23luna")),
    Loteria(card: "El Cotorro", image: UIImage(named: "24cotorro")),
    Loteria(card: "El Borracho", image: UIImage(named: "25borracho")),
    Loteria(card: "El Negrito", image: UIImage(named: "26negrito")),
    Loteria(card: "EL Corazón", image: UIImage(named: "27corazon")),
    Loteria(card: "La Sandía", image: UIImage(named: "28sandia")),
    Loteria(card: "El Tambor", image: UIImage(named: "29tambor")),
    Loteria(card: "El Camarón", image: UIImage(named: "30camaron")),
    Loteria(card: "Las Jaras", image: UIImage(named: "31jaras")),
    Loteria(card: "El Músico", image: UIImage(named: "32musico")),
    Loteria(card: "La Araña", image: UIImage(named: "33araña")),
    Loteria(card: "El Soldado", image: UIImage(named: "34soldado")),
    Loteria(card: "La Estrella", image: UIImage(named: "35estrella")),
    Loteria(card: "El Cazo", image: UIImage(named: "36cazo")),
    Loteria(card: "El Mundo", image: UIImage(named: "37mundo")),
    Loteria(card: "El Apache", image: UIImage(named: "38apache")),
    Loteria(card: "El Nopal", image: UIImage(named: "39nopal")),
    Loteria(card: "El Alacrán", image: UIImage(named: "40alacran")),
    Loteria(card: "La Rosa", image: UIImage(named: "41rosa")),
    Loteria(card: "La Calavera", image: UIImage(named: "42calavera")),
    Loteria(card: "La Campana", image: UIImage(named: "43campana")),
    Loteria(card: "El Cantarito", image: UIImage(named: "44cantarito")),
    Loteria(card: "El Venado", image: UIImage(named: "45venado")),
    Loteria(card: "El Sol", image: UIImage(named: "46sol")),
    Loteria(card: "La Corona", image: UIImage(named: "47corona")),
    Loteria(card: "La Chalupa", image: UIImage(named: "48chalupa")),
    Loteria(card: "El Pino", image: UIImage(named: "49pino")),
    Loteria(card: "El Pescado", image: UIImage(named: "50pescado")),
    Loteria(card: "La Palma", image: UIImage(named: "51palma")),
    Loteria(card: "La Maceta", image: UIImage(named: "52maceta")),
    Loteria(card: "El Arpa", image: UIImage(named: "53arpa")),
    Loteria(card: "La Rana", image: UIImage(named: "54rana"))] */
