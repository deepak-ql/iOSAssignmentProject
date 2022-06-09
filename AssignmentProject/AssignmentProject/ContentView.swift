//
//  ContentView.swift
//  AssignmentProject
//
//  Created by Deepak Sharma on 08/06/22.
//

import SwiftUI

struct ContentView: View {
  @State private var isActive = false
  
  var body: some View {
    NavigationView {
      VStack {
        Button(kMoveToCategoriesScreen) {
          isActive = true
        }
        NavigationLink(destination: CategoriesListView(), isActive: $isActive) { }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
