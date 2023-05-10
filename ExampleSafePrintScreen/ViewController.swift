//
//  ViewController.swift
//  ExampleSafePrintScreen
//
//  Created by Raphael Torquato on 09/05/23.
//

import UIKit
import SafePrintScreenSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SafePrintScreenManager.shared._screenRecordDelegate = self
        SafePrintScreenManager.shared.listenerForScreenReports()
    }
    
    @IBAction func spCompleteWindow(_ sender: Any) {
        guard let window = UIApplication.shared.windows.last else { return }
        SafePrintScreenManager.shared.sPrintScreenShot(for: window)
    }
    
    @IBAction func spCompleteView(_ sender: Any) {
        SafePrintScreenManager.shared.sPrintScreenShot(for: self.view)
    }
    
    @IBAction func spThisButtonAction(_ sender: Any) {
        guard let button = sender as? UIView else {
            return
        }
        SafePrintScreenManager.shared.sPrintScreenShot(for: button)
    }
}

extension ViewController: SafePrintScreenDelegate {
    func screen(_ screen: UIScreen, didRecordStarted isRecording: Bool) {
        showAlert(with: "Recording Started", title: "Recording")
    }
    
    func screen(_ screen: UIScreen, didRecordEnded isRecording: Bool) {
        showAlert(with: "Recording Ended", title: "Recording")
    }
}

extension ViewController {
    func showAlert(with message: String, title: String) {
        let alController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            alController.dismiss(animated: true)
        }
        alController.addAction(okAction)
        present(alController, animated: true)
    }
}
