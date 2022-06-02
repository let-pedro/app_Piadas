
import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    
    // MARK: - Outlet
    
    @IBOutlet weak var TextoPiadaLabel: UILabel!
    @IBOutlet weak var gifImage: UIImageView!
    
    
    // MARK: - Variáveis
    
    
    var viewModel: DetailsViewModel!
    
    
    // MARK: - life cycle e configuração

    override func viewDidLoad() {
        super.viewDidLoad()
        ApresentaPiada()
    }
    
    
    
    init(viewModel: DetailsViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
    }
    
    
    func ApresentaPiada(){
        guard let piada = viewModel.piada else {
            self.present(Alerta.Alert(Title: "Error", messageAlert: "Ocorreu um problema ao apresentar a piada selecionada"), animated: true)
            return
        }
        
        TextoPiadaLabel.text = piada
    }
    
    
    
    // MARK: - IBActions
    
    @IBAction func navigationButton(_ sender: UIButton) {
        viewModel.navegacao(tag: sender.tag)
    }
}
