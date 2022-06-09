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
  
  init() {
    let data = model.readLocalFile()
    categories = data?.data ?? []
  }
  
  var body: some View {
    List {
      ForEach(0..<categories.count) { index in
        Section(header: Text("\(kCategory) \(index + 1)")
                  .font(.system(size: 24).weight(.bold))
                  .foregroundColor(.white)) {
          ForEach(0..<categories[index].category.count) { i in
            let category = categories[index].category
            let categoryData = category[i]
            
            if (categoryData.type == ContentType.text.rawValue) {
              Text(category[i].description ?? "")
                .padding(.top, 4)
                .padding(.bottom, 4)
            } else if (categoryData.type == ContentType.image.rawValue) {
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
            } else {
              Text(category[i].description ?? "")
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
