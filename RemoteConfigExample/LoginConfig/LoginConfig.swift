//
//	LoginConfig.swift
//
//	Create by Ahmed Tawfik on 15/1/2019
//	Copyright © 2019. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct LoginConfig : Codable {

	let showButton : Bool?
	let showLabel : Bool?


	enum CodingKeys: String, CodingKey {
		case showButton = "show_button"
		case showLabel = "show_label"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		showButton = try values.decodeIfPresent(Bool.self, forKey: .showButton)
		showLabel = try values.decodeIfPresent(Bool.self, forKey: .showLabel)
	}


}