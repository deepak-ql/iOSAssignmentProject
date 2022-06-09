//
//  CategoriesResponseModel.swift
//  AssignmentProject
//
//  Created by Deepak Sharma on 08/06/22.
//

import Foundation

struct CategoriesResponseModel: Codable {
  let data: [Category]
}

struct Category: Codable {
  let category: [CategoryData]
}

struct CategoryData: Codable {
  let name, type: String
  let imageCount: Int?
  let description: String?
}
