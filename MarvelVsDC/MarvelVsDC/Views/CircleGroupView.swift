//
//  CircleGroupView.swift
//  RP
//
//  Created by Salih Çakmak on 10.01.2022.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var ShapeColor : Color
    @State var ShapeOpacity : Double
    @State private var isAnimating : Bool = false
    
    var body: some View {
        
        ZStack{
            ZStack{
             
                Circle()
                    .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth : 40)
                    .frame(width: 260, height: 260, alignment: .center)
                Circle()
                    .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth : 80)
                    .frame(width: 260, height: 260, alignment: .center)
                
            }
            .blur(radius: isAnimating ? 0 : 10)
            .opacity(isAnimating ? 1 : 0)
            .scaleEffect(isAnimating ? 1 : 0.5)
            .animation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever()
                ,value: isAnimating
            )
            .onAppear(perform: {
                isAnimating = true
                    
            })
            
        }
    }
}
struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroupView(ShapeColor: .black, ShapeOpacity: 0.2)
    }
}
