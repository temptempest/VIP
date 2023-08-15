//
//  SceneDelegate.swift
//  VIP
//
//  Created by temptempest on 15.08.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }
		assembly(scene)
	}
}

private extension SceneDelegate {
	func assembly(_ scene: UIWindowScene) {
		window = UIWindow(windowScene: scene)
		
		
		let loginViewController = LoginAssembly.configure()
		let newsViewController = NewsAssembly.configure()
		let alertBuilder: IAlertsBuilder = AlertsBuilder()
		let router = LoginRouter(
			loginViewController: loginViewController,
			newsViewController: newsViewController,
			alertBuilder: alertBuilder
		)
		
		
		if let loginViewController = loginViewController as? LoginViewController {
			loginViewController.router = router
		}
		

		let navController = UINavigationController(rootViewController: loginViewController)
		window?.rootViewController = navController
		window?.overrideUserInterfaceStyle = .light
		window?.makeKeyAndVisible()
	}
}

