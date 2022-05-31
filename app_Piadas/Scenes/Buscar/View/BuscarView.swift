
import UIKit

class BuscarView: UIView {

    var buscarController: UISearchController = {
        let vc = UISearchController(searchResultsController: ResultadoBuscarViewController())
        vc.searchBar.placeholder = "Buscar por palavra"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true
        return vc
        
    }()
    
    
    private lazy var imagePerson: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Mask Group 2"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension BuscarView: ViewCode {
    func builHierarchy() {
        addSubview(imagePerson)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imagePerson.centerXAnchor.constraint(equalTo: centerXAnchor),
            imagePerson.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
    }
    
    func applyAdditionalChanges(){
        backgroundColor = .white
    }
}
