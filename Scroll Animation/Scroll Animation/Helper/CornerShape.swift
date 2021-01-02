//
//  CornerShape.swift
//  Scroll Animation
//
//  Created by 中筋淳朗 on 2020/11/13.
//

import SwiftUI


struct CornerShape: Shape {
    
    var corner: UIRectCorner
    var size: CGSize
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: size)
        
        return Path(path.cgPath)
    }
}
