
import UIKit

class BuscarView: UIView {
    
    
    // MARK: - Elementos View
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 40.0, height: 40.0)
        button.layer.masksToBounds = true
        button.backgroundColor = .none
        button.setImage(UIImage(named: "back"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var closekButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 40.0, height: 40.0)
        button.layer.masksToBounds = true
        button.backgroundColor = .none
        button.setImage(UIImage(named: "close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private lazy var BuscarLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Buscar piadas"
        label.textAlignment = .center
        label.font = (UIFont.boldSystemFont(ofSize: 30))
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    lazy var BuscarTextField: UITextField = {
        let Field = UITextField()
        Field.placeholder = "Buscar por palavra"
        Field.textColor = UIColor(red: 0.08, green: 0.52, blue: 0.99, alpha: 1)
        Field.keyboardType = .default
        Field.layer.borderWidth = 2
        Field.layer.borderColor = UIColor(red: 0.08, green: 0.52, blue: 0.99, alpha: 1).cgColor
        Field.layer.cornerRadius = 4
        Field.layer.masksToBounds = true
        Field.leftViewMode = .always
        Field.leftView = UIImageView(image: UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .medium)))
        Field.tintColor = .gray
        Field.translatesAutoresizingMaskIntoConstraints = false
        return Field
    }()
    
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PiadaTableViewCell.self, forCellReuseIdentifier: PiadaTableViewCell.identifier)
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.identifir)
        tableView.rowHeight = 121
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        addSubview(backButton)
        addSubview(closekButton)
        addSubview(BuscarLabel)
        addSubview(BuscarTextField)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([            
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            
            
            closekButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            closekButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            closekButton.heightAnchor.constraint(equalToConstant: 40),
            closekButton.widthAnchor.constraint(equalToConstant: 40),
            
            
            BuscarLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            BuscarLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            BuscarLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            BuscarLabel.heightAnchor.constraint(equalToConstant: 38),
            //BuscarLabel.widthAnchor.constraint(equalToConstant: 40),
            
            BuscarTextField.topAnchor.constraint(equalTo: BuscarLabel.bottomAnchor, constant: 20),
            BuscarTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            BuscarTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            BuscarTextField.heightAnchor.constraint(equalToConstant: 56),
            
            
            tableView.topAnchor.constraint(equalTo: BuscarTextField.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    func applyAdditionalChanges(){
        backgroundColor = .white
    }
}
