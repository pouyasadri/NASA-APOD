//
//  APODModel.swift
//  NasaAPOD
//
//  Created by Pouya Sadri on 10/08/2024.
//

import Foundation

struct APODModel : Codable,Hashable{
	let title : String
	let explanation : String
	let url : String
	let copyright : String
	let date : String
	let hdurl : String
}
