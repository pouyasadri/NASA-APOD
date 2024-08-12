//
//  APODViewModel.swift
//  NasaAPOD
//
//  Created by Pouya Sadri on 10/08/2024.
//

import SwiftUI

@MainActor
class APODViewModel : ObservableObject{
	
	@Published var apodData: [APODModel] = []
	
	func fetchData(){
		guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=IXAQIHGA4pslf6RuVwS8HK3lCyYKC2Yu6K6ALPOw&count=1") else {
			print("invalid URL")
			return
		}
		
		Task{
			do{
				let (data,_) = try await URLSession.shared.data(from: url)
				
				let decoder = JSONDecoder()
				if let data = try? decoder.decode([APODModel].self, from: data){
					self.apodData = data
				}
			}catch{
				print("Error:\(error.localizedDescription)")
			}
		}
	}
}
