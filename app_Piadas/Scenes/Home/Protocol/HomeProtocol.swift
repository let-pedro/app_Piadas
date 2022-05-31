
import Foundation



protocol HomeViewModelDelegate {
    func Failure(_ error: Error?)
    func resultadoBuscarPiada(_ piada: Piada)
}


protocol HomeViewModelCoordinatorDelegate {
    func HomeViewModel_IrParaBusca(_ viewModel: HomeViewModel)
}

