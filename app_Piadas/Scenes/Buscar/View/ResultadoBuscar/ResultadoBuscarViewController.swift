
import UIKit

class ResultadoBuscarViewController: UIViewController {
    
    
    // MARK: - Variáveis
    
    var listaDePiadas: ResultModel?
    var viewModel: BuscarViewModel?
    var View: ResultadoBuscarView!
    
    
    
    // MARK: - life cycle e configuração
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configuraLayoutView()
        viewModel?.viewModelDelegate = self
    }
    
    
    override func loadView() {
        super.loadView()
        view = View
    }
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.View = ResultadoBuscarView()
        self.viewModel = BuscarViewModel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func configuraLayoutView(){
        
        View.tableView.dataSource = self
        viewModel?.viewModelDelegate = self
    }
    
    // MARK: - Métodos
    
    func efetuarBuscar(palavra: String){
        viewModel?.buscarPiadas(palavra: palavra)
    }
    


}
    // MARK: - extensions


extension ResultadoBuscarViewController: BuscarViewModelDelegate {
    func Failure(_ error: Error?) {
        self.present(Alerta.Alert(Title: "Error", messageAlert: "Ocorreu um problema ao efetuar a buscar \(String(describing: error?.localizedDescription))"), animated: true)
    }
    
    func resultadoBuscaPiadas(_ piadas: ResultModel) {
        listaDePiadas = piadas
        print("Saiu --\(listaDePiadas)")
    
        DispatchQueue.main.async {
            self.View.tableView.reloadData()
        }
    }
}


extension ResultadoBuscarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDePiadas?.total ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = View.tableView.dequeueReusableCell(withIdentifier: PiadaTableViewCell.identifier, for: indexPath) as? PiadaTableViewCell else { return  UITableViewCell()}

        
        cell.configureCell(piadaTexto: (listaDePiadas?.result[indexPath.row].value)!)
        return cell
    }
}
    
    
