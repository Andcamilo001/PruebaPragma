
import Foundation


protocol CatServiceProtocol {
    func getCats(url: URL?, completion: @escaping(Result<[Cat], ErrorCatApi>) -> Void)
}
