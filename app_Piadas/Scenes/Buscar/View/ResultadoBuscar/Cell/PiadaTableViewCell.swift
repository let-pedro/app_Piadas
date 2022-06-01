
import UIKit

class PiadaTableViewCell: UITableViewCell {
    static let identifier = "PiadaTableViewCell"
    
    
    
    // MARK: - Elementos View

    lazy var piadaValueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.tintColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Init e configuração
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
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
            piadaValueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            piadaValueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            piadaValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            piadaValueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
        ])
        
    }
    
    func applyAdditionalChanges(){
        backgroundColor = .white
    }
}
