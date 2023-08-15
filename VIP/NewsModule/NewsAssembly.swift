//
//  NewsAssembly.swift
//  VIP
//
//  Created by temptempest on 15.08.2023.
//

import UIKit

final class NewsAssembly {
	static func configure() -> UIViewController {
		let viewController = NewsViewController()
		let presenter = NewsPresenter(viewController: viewController)
		let netService: IArticleService = ArticleService()
		let worker = NewsWorker(netService: netService)
		let interactor = NewsInteractor(presenter: presenter, worker: worker)
		viewController.interactor = interactor
		return viewController
	}
}
