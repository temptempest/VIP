//
//  LoginRouter.swift
//  VIP
//
//  Created by temptempest on 15.08.2023.
//

import UIKit

private enum L12 {
	static let failure = "Failure "
}

protocol ILoginRouter {
	func routeToNews()
	func showError(message: String)
}

final class LoginRouter: ILoginRouter {
	
	private weak var loginViewController: UIViewController?
	private let newsViewController: UIViewController
	var alertBuilder: IAlertsBuilder?
	
	internal init(loginViewController: UIViewController, newsViewController: UIViewController, alertBuilder: IAlertsBuilder?) {
		self.loginViewController = loginViewController
		self.newsViewController = newsViewController
		self.alertBuilder = alertBuilder
	}
	
	func routeToNews() {
		newsViewController.modalPresentationStyle = .fullScreen
		loginViewController?.show(newsViewController, sender: self)
	}
	
	func showError(message: String) {
		if let alert = alertBuilder?.buildOkAlert(with: L12.failure, message: message, completion: {
			print(L12.failure, message)
		}) {
			loginViewController?.present(alert, animated: true)
		}
	}
}
