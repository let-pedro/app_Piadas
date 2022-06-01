
import UIKit


class BuscarCoordinator {
    
    // MARK: - Atributos self
    
    
    var window: UIWindow
    var viewModel: BuscarViewModel?
    var controller: BuscarViewController?
    var navigationController: UINavigationController?
    
    
    
    
    // MARK: - Atributos para coneção com outras Scenes
    
    
    
    
    // MARK: - init
    
    
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    
    
    func start() {
        viewModel = BuscarViewModel()
        viewModel?.viewNavigationDelegate = self
        guard let viewModel = viewModel else { return }
        
        controller = BuscarViewController(viewModel: viewModel)
        controller?.title = "Buscar Piadas"
        controller?.navigationItem.largeTitleDisplayMode = .always
        //ResultBuscarController()
        
        guard let controller = controller else { return }
        
        navigationController = UINavigationController(rootViewController: controller)
        navigationController?.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
    }
    
    
    
    
    // MARK: - Métodos do Coordinator Onboarding
    
    
    
}

extension BuscarCoordinator: BuscarModelCoordinatorDelegate {
    func BuscarViewModel_IrParaDetalhes(_ viewModel: BuscarViewModel) {
//        let viewResultadoBuscar = ResultadoBuscarViewController()
//        guard let viewModel = viewModel else { return }
//
//        viewResultadoBuscar.viewModel = viewModel
        
        print("Ir detalhes ")
    }
}
