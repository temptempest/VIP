//
//  LoadJSON.swift
//  VIP
//
//  Created by temptempest on 15.08.2023.
//

import Foundation

public func loadJson<T: Decodable>(bundle: Bundle, fileName: String, type: T.Type) -> T {
		guard let path = bundle.path(forResource: fileName, ofType: "json") else { fatalError("Loading Error") }
		do {
			let data: Data = try .init(contentsOf: URL(fileURLWithPath: path))
				let object = try JSONDecoder().decode(type, from: data)
				return object
		} catch {
			fatalError("Decoding Error")
		}
	}
