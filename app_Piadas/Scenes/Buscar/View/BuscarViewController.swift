
import UIKit

class BuscarViewController: UIViewController {
    
    var viewModel: BuscarViewModel!
    var buscarView: BuscarView

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = buscarView.buscarSearchController
        
        //buscarView.buscarController.searchResultsUpdater = self
        buscarView.buscarSearchController.searchBar.delegate = self
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

extension BuscarViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let resultadoBuscar = buscarView.buscarSearchController.searchResultsController as? ResultadoBuscarViewController,
              let query = buscarView.buscarSearchController.searchBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        resultadoBuscar.viewModel = viewModel
        resultadoBuscar.efetuarBuscar(palavra: query)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
//        guard let resultadoBuscar = searchController.searchResultsController as? ResultadoBuscarViewController,
//              let query = searchController.searchBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty else {
//            return
//        }
//
//        print(query)
        
        
    }
}
