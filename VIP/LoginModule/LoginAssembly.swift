//
//  LoginAssembly.swift
//  VIP
//
//  Created by temptempest on 15.08.2023.
//

import UIKit

final class LoginAssembly {
	static func configure() -> UIViewController {
		let viewController = LoginViewController()
		let presenter = LoginPresenter(viewController: viewController)
		let worker = LoginWorker()
		let interactor = LoginInteractor(worker: worker, presenter: presenter)
		viewController.interactor = interactor
		
		let alertBuilder: IAlertsBuilder = AlertsBuilder()
		viewController.alertBuilder = alertBuilder
		return viewController
	}
}

// Assembly -> Models -> Interactor -> Presenter -> Worker -> ViewController
