//
//  AlertBuilder.swift
//  VIP
//
//  Created by temptempest on 15.08.2023.
//

import UIKit

private enum L12 {
	static let ok = "OK"
	static let accentColor = UIColor.systemBlue
	static let emptyString = ""
}

protocol IAlertsBuilder {
	 func buildOkAlert(with title: String, message: String, completion: @escaping () -> Void) -> UIViewController
}
struct AlertsBuilder: IAlertsBuilder {
	func buildOkAlert(with title: String, message: String = L12.emptyString, completion: @escaping () -> Void) -> UIViewController {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: L12.ok, style: .default, handler: { _ in
			completion()
		}))
		 alertController.view.tintColor = L12.accentColor
		return alertController
	}
}
