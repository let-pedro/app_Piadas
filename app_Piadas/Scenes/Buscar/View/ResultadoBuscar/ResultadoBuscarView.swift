
import UIKit

class ResultadoBuscarView: UIView {

    
    // MARK: - Elementos View
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PiadaTableViewCell.self, forCellReuseIdentifier: PiadaTableViewCell.identifier)
        tableView.rowHeight = 121
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

    // MARK: - Extensions

extension ResultadoBuscarView: ViewCode {
    
    func builHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 40.0),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
    
    func applyAdditionalChanges(){
        backgroundColor = .white
    }
}
