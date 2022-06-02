
import UIKit

class BuscarViewController: UIViewController {
    
    
    // MARK: - Variáveis
    
    var viewModel: BuscarViewModel!
    var View: BuscarView!
    var listaDePiadas: ResultModel?
    var estadoInicial: Bool?
    
    
    // MARK: - life cycle e configuração

    override func viewDidLoad() {
        super.viewDidLoad()
        configuraLayout()
        acaoTextFields()
    }
    
    
    override func loadView() {
        super.loadView()
        view = View
    }

    init(viewModel: BuscarViewModel, viewBuscar: BuscarView, estado: Bool) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.View = viewBuscar
        self.estadoInicial = estado
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func configuraLayout(){
        View.tableView.dataSource = self
        View.tableView.delegate = self
        viewModel?.viewModelDelegate = self
        
        if estadoInicial != true {
            recuperaPesquisarAntiga()
        }
    }

    
    
    // MARK: - Actions
    
    
    func acaoTextFields(){
        View.BuscarTextField.addAction(UIAction { [weak self] _ in
            self!.efetuarBuscar()
        }, for: .editingDidEndOnExit)
        
        
        View.closekButton.addAction(UIAction { [weak self] _ in
            self!.botaoFechar()
        }, for: .touchUpInside)
        
        
        View.backButton.addAction(UIAction { [weak self] _ in
            self!.botaoVoltar()
        }, for: .touchUpInside)
    }
    
    
    
    // MARK: - Métodos
    
    
    func efetuarBuscar(){
        listaDePiadas = nil
        let value = View.BuscarTextField.text
        guard let palavra = value else {
            self.present(Alerta.Alert(Title: "Error", messageAlert: "Para pesquisar precisar digitar uma palavra"), animated: true)
            return
        }
        self.salvadoPalavraPesquisar(palavraKey: palavra)
        viewModel?.buscarPiadas(palavra: palavra)
    }
    
    
    func botaoFechar() {
        listaDePiadas = nil
        View.BuscarTextField.text = ""
        DispatchQueue.main.async {
            self.View.tableView.reloadData()
        }
    }
    
    
    func botaoVoltar() {
        viewModel.irParaHome()
    }
    
    
    func salvadoPalavraPesquisar(palavraKey: String){
        viewModel.salvaUltimaPesquisar(key: palavraKey)
    }
    
    func recuperaPesquisarAntiga(){
        viewModel.recuperarUltimaPesquisar()
    }
}

    // MARK: - Extension


    // UITableView DataSource

extension BuscarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDePiadas?.total ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = View.tableView.dequeueReusableCell(withIdentifier: PiadaTableViewCell.identifier, for: indexPath) as? PiadaTableViewCell,
              let DadoPiada = listaDePiadas?.result
        else { return  UITableViewCell()}

        cell.configureCell(piadaTexto: DadoPiada[indexPath.row].value)
        return cell
    }
}

    // UITableView Delegate

extension BuscarViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if listaDePiadas?.total != nil{
            return 0
        } else {
            View.closekButton.isEnabled = false
            View.tableView.isScrollEnabled = false
            return View.tableView.bounds.height
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = View.tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifir)
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let piadaSelecionada = listaDePiadas?.result[indexPath.row].value
        guard let piada = piadaSelecionada else { return }
        viewModel.irParaDetailhesBusca(piadaValue: piada)
    }
    
}


        // ViewModeDelegate


extension BuscarViewController: BuscarViewModelDelegate {
    func Failure(_ error: Error?) {
        self.present(Alerta.Alert(Title: "Error", messageAlert: "Ocorreu um problema ao efetuar a buscar \(String(describing: error?.localizedDescription))"), animated: true)
    }
    
    func resultadoBuscaPiadas(_ piadas: ResultModel) {
        listaDePiadas = piadas
        View.closekButton.isEnabled = true
        View.tableView.isScrollEnabled = true
        DispatchQueue.main.async {
            self.View.tableView.reloadData()
        }
    }
}
