
import UIKit

class PiadaTableViewCell: UITableViewCell {
    static let identifier = "PiadaTableViewCell"
    
    
    // MARK: - Elementos View

    lazy var piadaValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.tintColor = .gray
        label.font = UIFont(name: "Inter-Regular", size: 18)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Init e configuração
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configureCell(piadaTexto: String){
        self.piadaValueLabel.text = piadaTexto
    }
}


    // MARK: - extensions

extension PiadaTableViewCell: ViewCode {
    
    func builHierarchy() {
        contentView.addSubview(piadaValueLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            piadaValueLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            piadaValueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            piadaValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        
    }
    
    func applyAdditionalChanges(){
        backgroundColor = .clear
    }
}
