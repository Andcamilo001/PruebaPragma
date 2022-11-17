//
//  CatsViewModel.swift
//  PruebaPragma
//
//  Created by Andres Camilo Lezcano on 17/11/22.
//

import Foundation


@MainActor
class CatsViewModel: ObservableObject {
    
    @Published var catsInfos: [CatsListViewModel] = []
    
    
    func getCats() async {
        
      
        
        do{
            
            let catsList = try await Webservice().get(url: Constans.urls.catsURL) { data in
                return try? JSONDecoder().decode([Cats].self, from: data)
                
               
            }
            
            self.catsInfos = catsList.map(CatsListViewModel.init)
            
            
        } catch {
            print(error)
            
        }
        
        
        
    }
    
    
    
}

struct CatsListViewModel {
    
    
    
    private let cats: Cats
    
    init(_ cats: Cats) {
        self.cats = cats
        
    }    
   
    var name: String {
        cats.name
    }
    
    var origin: String {
        cats.origin
    }
    
    var intelligence: String {
        cats.intelligence
    }
    
    var url: String {
        cats.url
    }
}
