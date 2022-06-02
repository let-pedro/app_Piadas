
import Foundation
import Alamofire
import RealmSwift


class BuscarService {
    
    // MARK: - Variáveis
    
    private let urlApi: String = "https://api.chucknorris.io/jokes/"
    private(set) var localRealm: Realm?
    
    
    
    // MARK: - Métodos Alamofire
    
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
    
    
    // MARK: - Métodos Realm
    
    
    init() {
        iniciaRealm()
    }
    
    
    func iniciaRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            localRealm = try! Realm()

        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    
    func backup(_ chavePesquisar: KeyPesquisar,completion: @escaping(Error?) -> Void){
        guard let localRealm = localRealm  else { return } // coloca alerta caso de erro
        
        do {
            try! localRealm.write {
                localRealm.add(chavePesquisar)
                completion(nil)
            }
            
        } catch {
            completion(error)
            print("Erro ao adicionar no relam \(error)")
        }
    }
    
    
    func pegarBackup(completion: @escaping(KeyPesquisar?) -> Void){
        guard let localRealm = localRealm  else { return }
        let result = localRealm.objects(KeyPesquisar.self)
        
        if result.count > 1 {
            completion(result.first)
        } else {
            completion(result.last)
        }
    }
    
    
   func excluirTodosBackup(){
        guard let localRealm = localRealm  else { return }
    
        do {
            try! localRealm.write {
                localRealm.deleteAll()
            }
            
        } catch {
            print("Erro ao adicionar no relam \(error)")
        }
    }
}
