//
//  NewsPresenter.swift
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

protocol INewsPresenter {
  func present(response: News.Response)
}

final class NewsPresenter: INewsPresenter {
  weak var viewController: INewsViewController?
	
	init(viewController: INewsViewController?) {
		self.viewController = viewController
	}
	
  func present(response: News.Response) {
	  switch response.result {
	  case .success(let articles):
		  let viewModel: News.ViewModel = .success(articles)
		  viewController?.render(viewModel: viewModel)
	  case .failure(let error):
		  let viewModel: News.ViewModel = .failure(error.localizedDescription)
		  viewController?.render(viewModel: viewModel)
	  }
  }
}
