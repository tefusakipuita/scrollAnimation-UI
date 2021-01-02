//
//  ContentView.swift
//  Scroll Animation
//
//  Created by 中筋淳朗 on 2020/11/13.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (spacing: 0) {
            
            // MARK: - Top Bar
            HStack {
                Spacer()
                
                Text("たべものぐらむ")
                    .font(.system(size: 28))
                    .fontWeight(.regular)
                
                Spacer()
            } //: HStack
            .padding()
            .background(
                Color.white
                    .ignoresSafeArea()
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            )
            
            // MARK: - Scroll
            GeometryReader(content: { geometry1 in
                ScrollView (showsIndicators: false) {
                    VStack (spacing: 16) {
                        ForEach(foodData) { food in
                            GeometryReader(content: { geometry2 in
                                // 『geometry1.frame(in: .global).minY』はScrollViewの1番上のY座標
                                // 『geometry2.frame(in: .global).minY』は各FoodViewの1番上のY座標
                                FoodView(food: food)
                                    .opacity(
                                        opacityValue(
                                            mainFrame: geometry1.frame(in: .global).minY,
                                            minY: geometry2.frame(in: .global).minY
                                        )
                                    )
                                    .scaleEffect(
                                        scaleValue(
                                            mainFrame: geometry1.frame(in: .global).minY,
                                            minY: geometry2.frame(in: .global).minY
                                        ),
                                        anchor: .bottom
                                    )
                            }) //: GeometryReader
                            .frame(height: 100)
                        } //: ForEach
                    } //: VStack
                    .padding(.vertical, 25)
                } //: Scroll
            }) //: GeometryReader
            
            Spacer()
        } //: VStack
        .edgesIgnoringSafeArea(.bottom)
    }
    
    
    // MARK: - Function
    
    func scaleValue(mainFrame: CGFloat, minY: CGFloat) -> CGFloat {
        
        let value = (minY - 25) / (mainFrame)
        let scale = min(value, 1)
        
        return scale
    }
    
    func opacityValue(mainFrame: CGFloat, minY: CGFloat) -> Double {
        
        let value = (minY - 25) / (mainFrame)
        let scale = min(value, 1)
        
        return Double(scale)
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
