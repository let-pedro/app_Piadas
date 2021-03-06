
import UIKit

class DetailsCoordinator: DetailsViewModelCoordinatorDelegate {

    
    // MARK: - Atributos self

    var window: UIWindow
    var viewModel: DetailsViewModel?
    var controller: DetailsViewController?



    // MARK: - Atributos para coneção com outras Scenes
    

    var ScenesBuscarCoordinator: BuscarCoordinator?
    



    // MARK: - init

    required init(window: UIWindow) {
        self.window = window
    }

    // MARK: - Métodos do Coordinator Onboarding

    func start(piadaTexto: String) {
        viewModel = DetailsViewModel(piada: piadaTexto)
        viewModel?.viewNavigationDelegate = self
        
        guard let viewModel = viewModel else { return }
        controller = DetailsViewController(viewModel: viewModel)
        window.rootViewController = controller
    }


    // MARK: - Navegação

    func HomeViewModel_IrParaResultado(_ viewModel: DetailsViewModel) {
        
        print("Hello")
    }
    
    func HomeViewModel_IrParaBusca(_ viewModel: DetailsViewModel, estadoInicial: Bool) {
        ScenesBuscarCoordinator = BuscarCoordinator(window: window)
        guard let BuscarCoordinator = self.ScenesBuscarCoordinator else { return }
        BuscarCoordinator.start(estadoInicial)
    }
}
