
import Foundation
import RealmSwift



    // MARK: - Model para  Alamofire

struct ResultModel: Decodable {
    let total: Int
    let result: [Piada]
}


    // MARK: - Model para  Realm

class KeyPesquisar: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var palavra: String
    
    convenience init(palavraKey: String){
        self.init()
        self.palavra = palavraKey
    }
}
