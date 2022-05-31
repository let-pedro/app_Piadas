
import UIKit

class BuscarViewController: UIViewController {
    
    var viewModel: BuscarViewModel!
    var buscarView: BuscarView

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = buscarView.buscarController
    }
    
    
    override func loadView() {
        super.loadView()
        
        view = buscarView
    }

    init(viewModel: BuscarViewModel) {
        
        self.viewModel = viewModel
        self.buscarView = BuscarView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
