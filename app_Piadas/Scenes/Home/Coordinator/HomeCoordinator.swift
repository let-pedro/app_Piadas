
import UIKit


class HomeCoordinator: HomeViewModelCoordinatorDelegate {
    
    
    // MARK: - Atributos self
    
    
    var window: UIWindow
    var viewModel: HomeViewModel?
    var controller: HomeViewController?
    
    
    // MARK: - Atributos para coneção com outras Scenes
        
    var ScenesBuscarViewModel: BuscarViewModel?
    var ScenesBuscarCoordinator: BuscarCoordinator?
    
    
    
    // MARK: - init
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Métodos do Coordinator Onboarding
    
    func start() {
        viewModel = HomeViewModel()
        viewModel?.viewNavigationDelegate = self
        
        if let viewModel = viewModel {
            controller = HomeViewController(viewModel: viewModel)
            guard let controller = controller else { return }

            window.rootViewController = controller
        }
    }
    
    
    // MARK: - Navegação
    
    func HomeViewModel_IrParaBusca(_ viewModel: HomeViewModel) {
        ScenesBuscarCoordinator = BuscarCoordinator(window: window)
        ScenesBuscarViewModel = BuscarViewModel()
        ScenesBuscarViewModel?.deleteTodasPesquisar()
        guard let BuscarCoordinator = self.ScenesBuscarCoordinator else { return }
        BuscarCoordinator.start(true)
    }
}
