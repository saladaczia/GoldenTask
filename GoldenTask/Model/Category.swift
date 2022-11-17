//
//  Category.swift
//  GoldenTask
//
//  Created by Maciej Sołoducha on 16/11/2022.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
