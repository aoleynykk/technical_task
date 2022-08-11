

import UIKit

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    func requstInfo<T: Decodable>(model: T.Type, completion: @escaping (T) -> ()) {
        guard let url = URL(string: Constants.shared.urlString) else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            if let error = error {
                print(error)
            }
            do {
                let response = try JSONDecoder().decode(model.self, from: data!)
                completion(response)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
