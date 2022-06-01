

import Foundation


protocol DetailsViewModelCoordinatorDelegate {
    func HomeViewModel_IrParaResultado(_ viewModel: DetailsViewModel)
    func HomeViewModel_IrParaBusca(_ viewModel: DetailsViewModel)
}

class  DetailsViewModel {
    
    // MARK: - Variáveis
    
    var viewNavigationDelegate: DetailsViewModelCoordinatorDelegate?
    var piada: String?
    
    
    // MARK: - init
    
    
    init(piada: String) {
        self.piada = piada
    }
    
    
    
    // MARK: - Métodos
    
    
    func navegacao(tag: Int){
        if tag == 0 {
            viewNavigationDelegate?.HomeViewModel_IrParaList(self)
        } else {
            viewNavigationDelegate?.HomeViewModel_IrParaBusca(self)
        }
    }
}
