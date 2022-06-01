
import Foundation


protocol BuscarViewModelDelegate: AnyObject {
    func Failure(_ error: Error?)
    func resultadoBuscaPiadas(_ piadas: ResultModel)
}


protocol BuscarModelCoordinatorDelegate: AnyObject {
    func BuscarViewModel_IrParaDetalhes(_ viewModel: BuscarViewModel)
}


class BuscarViewModel {
    
    
    // MARK: - Variáveis
    
    
    weak var viewModelDelegate: BuscarViewModelDelegate?
    weak var viewNavigationDelegate: BuscarModelCoordinatorDelegate?
    var service: BuscarService
    
    
    // MARK: - init
    
    
    init(service: BuscarService = .init()) {
        self.service = service
    }
    
    
    
    // MARK: - Métodos
    
    func buscarPiadas(palavra: String){
        service.pegarPiadaAleatoria(keyPalavra: palavra) { Result in
            switch Result {
            case .failure(let error):
                self.viewModelDelegate?.Failure(error)
            case .success(let piadas):
                print("ViewModel ----")
                self.viewModelDelegate?.resultadoBuscaPiadas(piadas)
            }
        }
    }
    
    func irParaDetailhesBusca(){
        viewNavigationDelegate?.BuscarViewModel_IrParaDetalhes(self)
    }
}
