//
//  ArticleService.swift
//  VIP
//
//  Created by temptempest on 15.08.2023.
//

import Foundation

protocol IArticleService {
	func fetchNews() -> ArticlesList
}

struct ArticleService: IArticleService {
	func fetchNews() -> ArticlesList {
		let result = loadJson(bundle: .main, fileName: "articles", type: ArticlesList.self)
		return result
	}
}

