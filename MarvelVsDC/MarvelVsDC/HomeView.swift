//
//  HomeView.swift
//  RP
//
//  Created by Salih Çakmak on 9.01.2022.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive : Bool = true
    @State private var isAnimating : Bool = false
    
    
    var body: some View {
        
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack(spacing:20){

                
                ZStack{
                    ZStack{
                     
                        CircleGroupView(ShapeColor: .black, ShapeOpacity: 0.2)
                            .frame(width: 400, height: 400)
                        
                    }
                    Image("Joker")
                        .resizable()
                        .scaledToFit()
                        .offset(x:isAnimating ? 30 : -30)
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
                
                
                Text("Joker")
                    .font(.system(size: 80, weight: .thin, design: .rounded))
                   // .offset(x: 65, y: 10)

                Spacer()

                
                
                Button(action: {
                    isOnboardingViewActive = true
                }) {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.black)
                    Text("Spider-Man")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .shadow(radius: 30)
                
                

                

                
            }
        }
        
        
        
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
