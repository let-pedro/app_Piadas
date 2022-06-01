
import Foundation
import Alamofire


class BuscarService {
    
    private let urlApi: String = "https://api.chucknorris.io/jokes/"
    
    func pegarPiadaAleatoria(keyPalavra: String,completion: @escaping (Result<ResultModel,Error>) -> Void){
        guard let url = URL(string: "\(urlApi)search?query=\(keyPalavra)") else {
            print ("Not found url")
            return
        }
        
        AF.request(url, method: .get).response{ Result in
            guard let data = Result.data else { return }
            
            do {
                let piadaResult = try JSONDecoder().decode(ResultModel.self, from: data)
                completion(.success(piadaResult))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
