//
//  ListSeparatorStyle.swift
//  AssignmentProject
//
//  Created by Deepak Sharma on 08/06/22.
//

import UIKit
import SwiftUI

struct ListSeparatorStyle: ViewModifier {
  let style: UITableViewCell.SeparatorStyle
  
  func body(content: Content) -> some View {
    content
      .onAppear() {
        UITableView.appearance().separatorStyle = self.style
      }
  }
}
