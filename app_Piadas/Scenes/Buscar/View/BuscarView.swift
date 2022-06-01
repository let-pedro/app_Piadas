
import UIKit

class BuscarView: UIView {
    
    
    // MARK: - Elementos View

    var buscarSearchController: UISearchController = {
        let vc = UISearchController(searchResultsController: ResultadoBuscarViewController())
        vc.searchBar.placeholder = "Buscar por palavra"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        return vc
        
    }()
    
    
    private lazy var ilutracaoSerchImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Mask Group 2"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    
    // MARK: - Init
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    // MARK: - Extensions

extension BuscarView: ViewCode {
    
    
    func builHierarchy() {
        addSubview(ilutracaoSerchImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            ilutracaoSerchImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            ilutracaoSerchImage.centerYAnchor.constraint(equalTo: centerYAnchor),

        ])
    }
    
    func applyAdditionalChanges(){
        backgroundColor = .white
    }
}
