//
//  ModelCats.swift
//  PruebaPragma
//
//  Created by Andres Camilo Lezcano on 17/11/22.
//

import Foundation



struct Cat: Codable, Identifiable {
    let id: String
    let name: String
    let origin: String
    let intelligence: Int
    let image: CatImage?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case origin
        case intelligence
        case image
        
    }
    
    init(from decoder: Decoder) throws {
        
        let modelValues = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try modelValues.decode(String.self, forKey: .id)
        name = try modelValues.decode(String.self, forKey: .name)
        origin = try modelValues.decode(String.self, forKey: .origin)
        intelligence = try modelValues.decode(Int.self, forKey: .intelligence)
        image = try modelValues.decodeIfPresent(CatImage.self, forKey: .image)
    }
    
    
    struct CatImage: Codable {
        let id: String?
        let width, height: Int?
        let url: String?
    }
    
    init(name: String, id: String, origin: String, intelligence: Int, image: CatImage?){
        self.name = name
        self.id = id
        self.origin = origin
        self.intelligence = intelligence 
        self.image = image
        
    }
    


static func example1() -> Cat {
    return Cat(name: "Abyssinian",
                 id: "abys",
                 origin: "Colombia",
                 intelligence: 5,
                 image: CatImage(id: "i", width: 100, height: 100, url: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg"))
}


}


