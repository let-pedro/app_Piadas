
import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var chucknorrisImage: UIImageView!
    @IBOutlet weak var piadaLabel: UILabel!
    @IBOutlet weak var buscarButton: UIButton!
    
    // MARK: - Variáveis
    
    var viewModel: HomeViewModel!
    let service = HomeService()
    
    
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
        print("Erro")
    }
    
    func resultadoBuscarPiada(_ piada: Piada) {
        
        print("-----Piadas \(piada)")
        
        guard let urlImage = URL(string: piada.icon_url) else { return }
        print("piada ---\(piada)")
        
      
        
        chucknorrisImage.UrlImage(url: piada.icon_url)
        piadaLabel.text = piada.value
    }
}
