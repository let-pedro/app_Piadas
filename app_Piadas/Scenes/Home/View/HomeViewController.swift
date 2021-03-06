
import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var chucknorrisImage: UIImageView!
    @IBOutlet weak var piadaLabel: UILabel!
    @IBOutlet weak var buscarButton: UIButton!
    
    
    // MARK: - Variáveis
    
    var viewModel: HomeViewModel!

    
    
    // MARK: - life cycle e configuração

    override func viewDidLoad() {
        super.viewDidLoad()
        configuraLayout()
    }
    
    
    init(viewModel: HomeViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func configuraLayout(){
        buscarButton.layer.cornerRadius = 4
        buscarButton.layer.backgroundColor = UIColor(red: 0.08, green: 0.52, blue: 0.99, alpha: 1).cgColor
        
        viewModel.viewModelDelegate = self
    }
    
    
    
    // MARK: - IBActions
    
    @IBAction func buscaPiadaAleatoriaButton(_ sender: UIButton) {
        viewModel.piadaAleatoria()
    }
    
    
    
    @IBAction func BuscarPiadaButton(_ sender: UIButton) {
        viewModel.irParaBusca()
    }
    
    
    
}

    // MARK: - extension


extension HomeViewController: HomeViewModelDelegate {
    func Failure(_ error: Error?) {
        self.present(Alerta.Alert(Title: "Error", messageAlert: "Ocorreu um problema ao buscar um piada"), animated: true)
    }
    
    func resultadoBuscarPiada(_ piada: Piada) {
        guard let urlImage = URL(string: piada.icon_url) else { return }
        //chucknorrisImage.kf.setImage(with: urlImage)
        piadaLabel.text = piada.value
    }
}
