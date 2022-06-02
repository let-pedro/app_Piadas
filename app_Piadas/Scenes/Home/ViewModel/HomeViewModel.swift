
import Foundation
import UIKit


struct HomeViewModel {
    
    // MARK: - Variáveis
    
    
    var viewModelDelegate: HomeViewModelDelegate?
    var viewNavigationDelegate: HomeViewModelCoordinatorDelegate?
    var service: HomeService
    
    
    // MARK: - init
    
    
    init(service: HomeService = .init()) {
        self.service = service
    }
    
    
    // MARK: - Métodos
    
    func piadaAleatoria(){
        service.pegarPiadaAleatoria(){ Result in
            switch Result {
            case .failure(let error):
                self.viewModelDelegate?.Failure(error)
            case .success(let piada):
                self.viewModelDelegate?.resultadoBuscarPiada(piada)
            }
        }
    }
    
    func irParaBusca(){
        viewNavigationDelegate?.HomeViewModel_IrParaBusca(self)
    }
}

