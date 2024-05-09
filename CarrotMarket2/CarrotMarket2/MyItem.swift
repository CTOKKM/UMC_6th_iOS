//
//  MyItem.swift
//  CarrotMarket2
//
//  Created by KKM on 5/9/24.
//

import Foundation
import UIKit

enum MyItem: Equatable {
  case vertical(UIImage?, String, String, String?, UIImage?, UIImage?, String?, String?) // thumbnailImage, title, subtitle, price, dibimg, chatimg, dib, chat
  case collection(String, [CollectionViewItem]) // title, collection
}

enum CollectionViewItem: Equatable {
  case horizontal(UIImage?, String, String)
}



