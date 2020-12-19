//
//  GlobalHelpers.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation
import UIKit

func showAlert(title: String, message: String, on vc: UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Okay", style: .default, handler: {
        _ in
        vc.dismiss(animated: true, completion: nil)
    })
    alert.addAction(okAction)
    vc.present(alert, animated: true, completion: nil)
}
