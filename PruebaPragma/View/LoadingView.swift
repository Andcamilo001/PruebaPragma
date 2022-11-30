//
//  LoadingView.swift
//  PruebaPragma
//
//  Created by Andres Camilo Lezcano on 30/11/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            Text("Cat is loading")
                .font(.system(size: 80))
            ProgressView()
            Text("Getting the cats ...")
                .foregroundColor(.gray)
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
