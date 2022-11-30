//
//  CatListView.swift
//  PruebaPragma
//
//  Created by Andres Camilo Lezcano on 30/11/22.
//

import SwiftUI

struct CatListView: View {
    let cats: [Cat]
    
    @State private var searchText: String = ""
    
    var filteredCats: [Cat] {
        if searchText.count == 0 {
            return cats
        } else {
            return cats.filter { $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredCats) { cat in
                    
                    CatCellView(cat: cat)
                    
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Find Your Cat")
            .searchable(text: $searchText)
            
        }
    }
}

struct CatListView_Previews: PreviewProvider {
    static var previews: some View {
        CatListView(cats: CatFetch.successState().cats)
    }
}
