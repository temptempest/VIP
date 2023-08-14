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
		let viewController = LoginAssembly.configure()
		let navController = UINavigationController(rootViewController: viewController)
		window?.rootViewController = navController
		window?.overrideUserInterfaceStyle = .light
		window?.makeKeyAndVisible()
	}
}

