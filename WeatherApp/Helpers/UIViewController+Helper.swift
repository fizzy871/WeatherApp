// UIViewController+Helper.swift

import UIKit

extension UIViewController {
    public func show(error: Swift.Error) {
        self.show(message: error.localizedDescription, title: "Error")
    }
    public func show(message: String, title: String? = nil) {
        DispatchQueue.onMain {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
