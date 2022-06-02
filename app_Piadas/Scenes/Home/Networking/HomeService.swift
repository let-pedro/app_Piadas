
import Foundation
import Alamofire

class HomeService {
    
    private let urlApi: String = "https://api.chucknorris.io/jokes/random"
    
    func pegarPiadaAleatoria(completion: @escaping (Result<Piada,Error>) -> Void){
        guard let url = URL(string: "\(urlApi)") else {
            print ("Not found url")
            return
        }
        
        AF.request(url, method: .get).response{ Result in
            guard let data = Result.data else { return }
            
            do {
                let piadaResult = try JSONDecoder().decode(Piada.self, from: data)
                completion(.success(piadaResult))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
