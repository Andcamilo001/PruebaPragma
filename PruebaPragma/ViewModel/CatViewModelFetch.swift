

import Foundation

class CatFetch: ObservableObject {
    
    @Published var cats = [Cat]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let catApiService: CatServiceProtocol
    
    init(catApiService: CatServiceProtocol = CatService()) {
        self.catApiService = catApiService
        getAllCats()
    }
    
    func getAllCats() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        catApiService.getCats(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                case .success(let cats):
                    print("\(cats.count)")
                    self.cats = cats
                }
            }
        }
        
    }
    
    static func errorState() -> CatFetch {
    let fetcher = CatFetch()
    fetcher.errorMessage = ErrorCatApi.url(URLError.init(.notConnectedToInternet)).localizedDescription
    return fetcher
    }
    
    static func successState() -> CatFetch {
    let fetcher = CatFetch()
        fetcher.cats = [ Cat.example1()]
    
    return fetcher
    }
    
}


 
 
 
