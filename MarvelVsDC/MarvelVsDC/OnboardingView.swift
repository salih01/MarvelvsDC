//
//  OnboardingView.swift
//  RP
//
//  Created by Salih Çakmak on 9.01.2022.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = true
    
    @State private var buttonWidth : Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating : Bool = false
    @State private var imageOffset : CGSize = .zero
    var body: some View {
        
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack (spacing: 20){
                Spacer()
                
                VStack {
                    Text("Spider")
                        .font(.system(size: 80))
                        .fontWeight(.thin)
                        .foregroundColor(.black)
             
                }
                
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                ZStack{
                    
                    CircleGroupView(ShapeColor: .black, ShapeOpacity: 0.2)
                    
                    Image("Spider")
                        .resizable()
                        .scaledToFit()
                        .offset(y: isAnimating ? 35 : -35)
                        
                        .animation(
                            Animation
                                .easeInOut(duration: 1)
                                .repeatForever()
                            ,value: isAnimating
                        )
                        
                }
                
                Spacer()
                
                ZStack{
                     Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Kaydır")
                        .font(.system(.title3 ,design: .rounded))
                        .fontWeight(.thin)
                        .foregroundColor(.black)
                        .offset(x: 20)
                    
                    
                    HStack{
                        Capsule()
                            .fill(Color.black.opacity(0.2))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    
                    HStack{
                        ZStack{
                            Circle()
                                .fill(Color.black.opacity(0.3))
                            Circle()
                                .fill(.black.opacity(0.3))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        
                                        if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                            buttonOffset = gesture.translation.width
                                        }
                                    }
                                    .onEnded { _ in
                                        withAnimation(Animation.easeOut(duration: 1)) {
                                            if buttonOffset > buttonWidth / 2 {
                                                buttonOffset = buttonWidth - 80
                                                isOnboardingViewActive = false
                                                buttonOffset = 0

                                            }
                                            else {
                                                buttonOffset = 0
                                            }
                                        }
                                    }
                        )
                        Spacer()
                        
                    }
                    
                    
                }
                .frame(width: buttonWidth ,height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
            }
        }
        .onAppear(perform: {
            isAnimating = true
        })
        
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
