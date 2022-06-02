
import Foundation


protocol BuscarViewModelDelegate: AnyObject {
    func Failure(_ error: Error?)
    func resultadoBuscaPiadas(_ piadas: ResultModel)
}


protocol BuscarModelCoordinatorDelegate: AnyObject {
    func BuscarViewModel_IrParaHome(_ viewModel: BuscarViewModel)
    func BuscarViewModel_IrParaDetalhes(_ viewModel: BuscarViewModel,piada: String)
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
                self.viewModelDelegate?.resultadoBuscaPiadas(piadas)
            }
        }
    }
    
    
    func salvaUltimaPesquisar(key: String){
        let palavraSalvar = KeyPesquisar(palavraKey: key)
        service.backup(palavraSalvar){ result in
            if result != nil {
                print("Erro ao salvar")
            }
        }
    }
    
    
    func recuperarUltimaPesquisar(){
        service.pegarBackup(){ result in
            guard let palavraKey = result?.palavra else { return }
            self.buscarPiadas(palavra: String(palavraKey))
        }
    }
    
    
    func deleteTodasPesquisar(){
        service.excluirTodosBackup()
    }
    
    
    func irParaDetailhesBusca(piadaValue: String){
        viewNavigationDelegate?.BuscarViewModel_IrParaDetalhes(self, piada: piadaValue)
    }
    
    
    func irParaHome(){
        viewNavigationDelegate?.BuscarViewModel_IrParaHome(self)
    }
}
