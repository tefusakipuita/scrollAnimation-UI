//
//  FoodView.swift
//  Scroll Animation
//
//  Created by 中筋淳朗 on 2020/11/13.
//

import SwiftUI

struct FoodView: View {
    
    // MARK: - Property
    
    var food: Food
    
    
    // MARK: - Body
    
    var body: some View {
        HStack (spacing: 14) {
            
            // MARK: - Image
            Image(food.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(CornerShape(corner: [.topLeft, .bottomLeft], size: CGSize(width: 15, height: 15)))
            
            // MARK: - Detail
            VStack (alignment: .leading, spacing: 12) {
                Text(food.title)
                HStack (spacing: 4) {
                    ForEach(0..<food.rate) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 12))
                    } //: ForEach
                } //: HStack
            } //: VStack
            
            Spacer()
        } //: HStack
        .background(
            Color.white
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 2, y: 2)
        )
        .padding(.horizontal, 20)
    }
}

// MARK: - Preview

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
