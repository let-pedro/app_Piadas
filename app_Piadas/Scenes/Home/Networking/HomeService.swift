
import Foundation
import Alamofire
import AlamofireImage

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
                //self.pegarImage(urlImage: piadaResult.icon_url)
                completion(.success(piadaResult))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    
//    func pegarImage(urlImage: String){
//        AF.request(urlImage).responseImage { Result in
//
//            let piadaResult = try JSONDecoder().decode([String].self, from: data)
//            print("Image --\(Result.data)")
//                print("Image --\(Result.result)")
//        }
//    }
    
}
