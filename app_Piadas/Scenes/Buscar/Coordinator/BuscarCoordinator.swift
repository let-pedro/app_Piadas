
import UIKit


class BuscarCoordinator: BuscarModelCoordinatorDelegate {
    
    // MARK: - Atributos self
    
    
    var window: UIWindow
    var viewModel: BuscarViewModel?
    var controller: BuscarViewController?
    var View: BuscarView?

    
    
    // MARK: - Atributos para coneção com outras Scenes
    
    var ScenesHomeCoordinator: HomeCoordinator?
    var ScenesDetailsCoordinator: DetailsCoordinator?
    
    
    
    // MARK: - init
    
    
    
    required init(window: UIWindow) {
        self.window = window
    }
    

    // MARK: - Métodos do Coordinator Onboarding
    
    func start(_ emEstadoInicial: Bool) {
        View = BuscarView()
        viewModel = BuscarViewModel()
        viewModel?.viewNavigationDelegate = self
        guard let viewModel = viewModel,
              let view = View else { return }
        
        controller = BuscarViewController(viewModel: viewModel, viewBuscar: view, estado: emEstadoInicial)
        guard let controller = controller else { return }
        window.rootViewController = controller
    }
    
    
    // MARK: - Navegacao
    
    
    func BuscarViewModel_IrParaHome(_ viewModel: BuscarViewModel) {
        ScenesHomeCoordinator = HomeCoordinator(window: window)
        guard let BuscarCoordinator = self.ScenesHomeCoordinator else { return }
        BuscarCoordinator.start()
    }
    
    func BuscarViewModel_IrParaDetalhes(_ viewModel: BuscarViewModel, piada: String) {
        ScenesDetailsCoordinator = DetailsCoordinator(window: window)
        guard let BuscarCoordinator = self.ScenesDetailsCoordinator else { return }
        BuscarCoordinator.start(piadaTexto: piada)
    }
}
