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
                
                
            //MARK: - Symmetric Transition
                /**
                 Below is the examples of symmetrical transition. Uncomment one by one to see the result
                 */
                
                //Scale Transition with anchor set to bottom
                    //.transition(.scale(scale: 0, anchor: .bottom))
                
                
                //Combine 2 transition
                    //.transition(.offset(x: -600, y: 0).combined(with: .scale))
                
                //Combine 3 transition
                    //.transition(.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity))
                
                //Reusable Animation
                    //.transition(.offsetScaleOpacity)
                
            //MARK: - Symmetric Transition
                    /**
                     Below is the examples of Asymmetrical transition. Uncomment to see the result
                     */
//                    .transition(.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600,y: 0)))
                //Reusable Animation
                    .transition(.scaleAndOffset)
                
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
    
    static var scaleAndOffset: AnyTransition{
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0))
    }
}
