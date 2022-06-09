//
//  CategoriesView.swift
//  AssignmentProject
//
//  Created by Deepak Sharma on 08/06/22.
//

import SwiftUI
import UIKit

struct CategoriesListView: View {
  var categories: [Category] = []
  var model = CategoriesViewModel()
  var viewCategoryModel: [Result] = []
  
  init() {
    let data = model.readLocalFile()
    categories = data?.data ?? []
    manageModel()
  }
  
  mutating func manageModel() {
    var categoriesArray: [CategoryData] = []
    
    for value in categories {
      var viewdata: [ViewCategoryModel] = []
      for (index, category) in value.category.enumerated() {
        if ((index + 1) % 3 == 0 || value.category.count == 1) {
          viewdata.append(ViewCategoryModel(data: [category]))
        } else {
          categoriesArray.append(category)
          if categoriesArray.count  == 2 || (value.category.count == (index + 1) ){
            viewdata.append(ViewCategoryModel(data: categoriesArray))
            categoriesArray = []
          }
        }
      }
      viewCategoryModel.append(Result(result: viewdata))
    }
  }
  
  var body: some View {
    List {
      ForEach(0..<viewCategoryModel.count) { outerIndex in
        Section(header: Text("\(kCategory) \(outerIndex + 1)")
                  .font(.system(size: 24).weight(.bold))
                  .foregroundColor(.white)) {
          
          ForEach(0..<viewCategoryModel[outerIndex].result.count) { row in
            
            if viewCategoryModel[outerIndex].result[row].data.count  == 2 {
              HStack {
                Image("TreeImage")
                  .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.4)
                  .cornerRadius(12)
                Spacer()
                Image("TreeImage")
                  .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.4)
                  .cornerRadius(12)
              }
              .padding(.top, 4)
              .padding(.bottom, 4)
            } else  {
              if row % 2 == 0 && viewCategoryModel[outerIndex].result.count != 1 {
                HStack {
                  Image("TreeImage")
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.4)
                    .cornerRadius(12)
                  Spacer()
                }
                .padding(.top, 4)
                .padding(.bottom, 4)
              } else  {
                HStack {
//                  Spacer()
                  Image("TreeImage")
                    .frame(width: UIScreen.main.bounds.width * 0.88, height: UIScreen.main.bounds.width * 0.4)
                    .cornerRadius(12)
                  Spacer()
                }
                .padding(.top, 4)
                .padding(.bottom, 4)
              }
            }
          }
        }
      }
    }
    .listSeparatorStyle(style: .none)
    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    .listStyle(.plain)
    .navigationBarHidden(false)
    .navigationBarTitle(kAssignmentProject, displayMode: .inline)
    .navigationBarBackButtonHidden(true)
  }
}
