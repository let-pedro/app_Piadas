
import UIKit


class HomeCoordinator: HomeViewModelCoordinatorDelegate {
    
    
    // MARK: - Atributos self
    
    
    var window: UIWindow
    var viewModel: HomeViewModel?
    var controller: HomeViewController?
    
    
    
    // MARK: - Atributos para coneção com outras Scenes
        

    var ScenesBuscarCoordinator: BuscarCoordinator?
    
    
    
    // MARK: - init
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Métodos do Coordinator Onboarding
    
    func start() {
        viewModel = HomeViewModel()
        viewModel?.viewNavigationDelegate = self
        
        guard let viewModel = viewModel else { return }
        controller = HomeViewController(viewModel: viewModel)
        window.rootViewController = controller
    }
    
    
    // MARK: - Navegação
    
    func HomeViewModel_IrParaBusca(_ viewModel: HomeViewModel) {
        ScenesBuscarCoordinator = BuscarCoordinator(window: window)
        guard let BuscarCoordinator = self.ScenesBuscarCoordinator else { return }
        BuscarCoordinator.start()
    }
}
