//
//  Extensions.swift
//  AssignmentProject
//
//  Created by Deepak Sharma on 08/06/22.
//

import SwiftUI
import UIKit

extension View {
  func listSeparatorStyle(style: UITableViewCell.SeparatorStyle) -> some View {
    ModifiedContent(content: self, modifier: ListSeparatorStyle(style: style))
  }
}
