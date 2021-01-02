//
//  Food.swift
//  Scroll Animation
//
//  Created by 中筋淳朗 on 2020/11/13.
//

import SwiftUI

struct Food: Identifiable {
    
    var id = UUID().uuidString
    var imageName: String
    var title: String
    var rate: Int
}
