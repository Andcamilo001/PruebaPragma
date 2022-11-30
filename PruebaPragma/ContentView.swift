//
//  ContentView.swift
//  PruebaPragma
//
//  Created by Andres Camilo Lezcano on 17/11/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var catFetch = CatFetch()
    var body: some View {
      
        if catFetch.isLoading {
            LoadingView()
        }else if catFetch.errorMessage != nil  {
            ErrorView(catfetch: catFetch)
        }else {
            CatListView(cats: catFetch.cats)
        }
      
          
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
