//
//  ContentView.swift
//  Tut5_SwiftUI_ViewTransitionAnimation
//
//  Created by ZEUS on 26/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
                .overlay(
                    Text("Show Details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                )
                .onTapGesture {
                    withAnimation(.spring()){
                        self.show.toggle()
                    }
                }
            
            
            
            if show{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.purple)
                    .overlay(
                        Text("Well here is the details")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                    )
                //Scale Transition with anchor set to bottom
                    //.transition(.scale(scale: 0, anchor: .bottom))
                
                
                //Combine 2 transition
                    //.transition(.offset(x: -600, y: 0).combined(with: .scale))
                
                //Combine 3 transition
                    //.transition(.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity))
                
                //Reusable Animation
                    .transition(.offsetScaleOpacity)
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//ReusableAnimation
extension AnyTransition{
    static var offsetScaleOpacity: AnyTransition{
        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
}
