//
//  CatsCellView.swift
//  PruebaPragma
//
//  Created by Andres Camilo Lezcano on 17/11/22.
//

import SwiftUI

struct CatsCellView: View {
    
    //let catsList: CatsListViewModel
    
    var body: some View {
        VStack{
            Text("Nombre Raza")
            Image(systemName: "envelope.fill")
            
            HStack{
                Text("Pais de origen")
                Text("Inteligencia")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .padding(.horizontal, 6)
        .background(.white)
        .shadow(color: .gray, radius: 3, x: 0.0, y: 0.0)
    }
}

struct CatsCellView_Previews: PreviewProvider {
    static var previews: some View {
        CatsCellView()
    }
}
