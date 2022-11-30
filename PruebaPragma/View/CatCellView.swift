

import SwiftUI

struct CatCellView: View {
    let cat: Cat
    let imageSize: CGFloat = 100
    var body: some View {
        HStack {
            
            if cat.image?.url != nil {
                AsyncImage(url: URL(string: cat.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                        
                     } else if phase.error != nil {
                         
                         Text(phase.error?.localizedDescription ?? "error")
                             .foregroundColor(Color.pink)
                             .frame(width: imageSize, height: imageSize)
                     } else {
                        ProgressView()
                             .frame(width: imageSize, height: imageSize)
                     }
                    
                }
            }else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(cat.name)
                    .font(.headline)
                Text(cat.origin)
                
            }
        }
     
    }
}

struct CatCellView_Previews: PreviewProvider {
    static var previews: some View {
        CatCellView(cat: Cat.example1())
            .previewLayout(.fixed(width: 400, height: 200))
    }
}

