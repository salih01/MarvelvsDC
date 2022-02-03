//
//  ContentView.swift
//  RP
//
//  Created by Salih Çakmak on 7.01.2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
      
        ZStack{
            if isOnboardingViewActive {
                OnboardingView()
            }else {
                HomeView()
            }
        }   
      }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

