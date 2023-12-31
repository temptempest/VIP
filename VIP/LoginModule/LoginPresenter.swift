//
//  LoginPresenter.swift
//  VIP
//
//  Created by temptempest on 15.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
private enum L12 {
	static let invalidLogon = "Uncorrect login"
}

protocol ILoginPresenter {
	func present(response: LoginModels.Response)
}

final class LoginPresenter: ILoginPresenter {
	private weak var viewController: ILoginViewController?
	
	init(viewController: ILoginViewController?) {
		self.viewController = viewController
	}
	
	func present(response: LoginModels.Response) {
		let viewModel: LoginModels.ViewModel = response.succes ? .success : .failure(L12.invalidLogon)
		viewController?.render(viewModel: viewModel)
	}
}
