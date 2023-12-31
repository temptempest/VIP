//
//  NewsWorker.swift
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

protocol INewsWorker {
	func getNews() -> Result<ArticlesList, Error>
}

final class NewsWorker {
	var netService: IArticleService
	
	init(netService: IArticleService) {
		self.netService = netService
	}
	
	func getNews() -> Result<ArticlesList, Error> {
		let result = netService.fetchNews()
		return .success(result)
	}
}
