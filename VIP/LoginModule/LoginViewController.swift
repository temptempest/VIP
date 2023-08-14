//
//  LoginViewController.swift
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
	static let padding: CGFloat = 16
	static let radius: CGFloat = 8
	static let topOffset: CGFloat = 40
	static let vStackHeight: CGFloat = 44*2 + L12.padding
	static let enterButtonFont = UIFont.systemFont(ofSize: 16, weight: .medium)
	static let login = "Input Admin"
	static let enter = "Enter"
	static let success = "Success"
	static let failure = "Failure"
	static let accentColor = UIColor.systemBlue
	static let white = UIColor.white
}

protocol ILoginViewController: AnyObject {
	func render(viewModel: LoginModels.ViewModel)
}

final class LoginViewController: UIViewController, ILoginViewController {
	var interactor: ILoginInteractor?
	var alertBuilder: IAlertsBuilder?
	
	private lazy var loginTextField = makeTextField(placeholder: L12.login)
	private lazy var enterButton = makeEnterButton()
	private lazy var vStackView = makeVStackView([loginTextField, enterButton])	
	
	override func loadView() {
		super.loadView()
		setupUI()
		setupConstraints()
		bindEnterButton()
	}
}

//MARK: - ILoginViewController
extension LoginViewController {
	func render(viewModel: LoginModels.ViewModel) {
		switch viewModel {
		case .success:
			if let alert = alertBuilder?.buildOkAlert(with: L12.success, message: "", completion: {
				print(L12.success)
			}) {
				present(alert, animated: true)
			}
		case .failure(let message):
			if let alert = alertBuilder?.buildOkAlert(with: L12.failure, message: message, completion: {
				print(L12.failure,":" , message)
			}) {
				present(alert, animated: true)
			}
		}
	}
}

//MARK: - Actions
private extension LoginViewController {
	func bindEnterButton() {
		enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
	}
	@objc func enterButtonTapped() {
		if let login = loginTextField.text {
			let request = LoginModels.Request(login: login)
			interactor?.login(request: request)
		}
	}
}

//MARK: - UI *****************************
private extension LoginViewController {
	func setupUI() {
		title = L12.login
		view.backgroundColor = L12.white
		view.addSubview(vStackView)
	}
	func setupConstraints() {
		vStackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			vStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: L12.topOffset),
			vStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: L12.padding),
			vStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -L12.padding),
			vStackView.heightAnchor.constraint(equalToConstant: L12.vStackHeight),
		])
	}
	func makeTextField(placeholder: String) -> UITextField {
		let textField = UITextField()
		textField.borderStyle = .roundedRect
		textField.placeholder = placeholder
		return textField
	}
	func makeEnterButton() -> UIButton {
		let button = UIButton(type: .system)
		button.layer.cornerRadius = L12.radius
		button.layer.cornerCurve = .continuous
		button.backgroundColor = L12.accentColor
		button.setTitle(L12.enter, for: .normal)
		button.titleLabel?.font = L12.enterButtonFont
		button.setTitleColor(L12.white, for: .normal)
		return button
	}
	func makeVStackView(_ arrangedSubviews: [UIView]) -> UIStackView {
		let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
		stackView.spacing = L12.padding
		stackView.axis = .vertical
		stackView.distribution = .fillEqually
		return stackView
	}
}