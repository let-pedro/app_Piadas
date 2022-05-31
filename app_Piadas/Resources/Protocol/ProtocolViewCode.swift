
import Foundation



protocol ViewCode {
    func builHierarchy()
    func setupConstraints()
    func applyAdditionalChanges()
}


extension ViewCode {
    
    func  setupView(){
        builHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
    
    func builHierarchy() {}
    
    func setupConstraints() {}
    
    func applyAdditionalChanges(){}
}
