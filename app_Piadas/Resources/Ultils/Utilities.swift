
import UIKit



struct Alerta {
    
    static func Alert(Title: String,messageAlert: String) -> UIAlertController{
        let alerta = UIAlertController(title: Title, message: messageAlert, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alerta
    }
}
