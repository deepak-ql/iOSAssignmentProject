//
//  CategoriesViewModel.swift
//  AssignmentProject
//
//  Created by Deepak Sharma on 09/06/22.
//

import Foundation

struct CategoriesViewModel {
  func readLocalFile() -> CategoriesResponseModel? {
    if let url = Bundle.main.url(forResource: kCategories, withExtension: kJson) {
      do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode(CategoriesResponseModel.self, from: data)
        return jsonData.self
      } catch {
        print("error:\(error)")
      }
    }
    return nil
  }
}
