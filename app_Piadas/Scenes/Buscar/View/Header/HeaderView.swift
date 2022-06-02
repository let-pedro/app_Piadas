
import UIKit

class HeaderView: UITableViewHeaderFooterView {
    static let identifir = "HeaderView"

    
    // MARK: - Elementos View
    
    private lazy var ilutracaoSerchImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Mask Group 2"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    

    // MARK: - Init
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

       setupView()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

    // MARK: - Extensions

extension HeaderView: ViewCode {

    func builHierarchy() {
        contentView.addSubview(ilutracaoSerchImage)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            ilutracaoSerchImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            ilutracaoSerchImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }

    func applyAdditionalChanges(){
        contentView.backgroundColor = .white
    }
}
