//
//  ErrorView.swift
//  PruebaPragma
//
//  Created by Andres Camilo Lezcano on 30/11/22.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var catfetch: CatFetch
    var body: some View {
        VStack {
            
            Text("Not found")
                .font(.system(size: 80))
            
            Text(catfetch.errorMessage ?? "")
            
            Button {
                catfetch.getAllCats()
            } label: {
                Text("Try again")
            }

            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(catfetch: CatFetch())
    }
}
