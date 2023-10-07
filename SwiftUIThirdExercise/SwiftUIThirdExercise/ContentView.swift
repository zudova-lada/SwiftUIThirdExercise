//
//  ContentView.swift
//  SwiftUIThirdExercise
//
//  Created by Лада Зудова on 07.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetail = false
    @State private var isSecond = false
    
    var body: some View {
        ZStack {
        Button(action: {
            withAnimation(.spring(response: 0.5, blendDuration: 2)) {
                isSecond = false
                showDetail.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    isSecond = true
                    showDetail.toggle()
                }
            }
        }){
            ZStack {
                Circle()
                    .fill(.gray)
                    .opacity(showDetail ? 0.3 : 0)
                    .frame(width: 60)
                
                HStack(alignment: .center, spacing: -3) {
                    if showDetail {
                        Image(systemName: "play.fill")
                            .font(.system(size: 30))
                            .transition(
                                .scale(scale: showDetail ? 0 : 1)
                                .combined(with: .opacity)
                                .animation(isSecond ?.easeOut(duration: 0) :
                                        .easeOut(duration: 0.2))
                            )
                    }
                    Image(systemName: "play.fill")
                        .font(.system(size: 30))
                        .transition(
                            .opacity
                                .animation(isSecond ?.easeOut(duration: 0) :
                                        .easeOut(duration: 0.2))
                        )
                    if !showDetail {
                        Image(systemName: "play.fill")
                            .font(.system(size: 30))
                            .transition(
                                .scale(scale: showDetail ? 1 : 0)
                                .combined(with: .opacity)
                                .animation(.linear(duration: isSecond ? 0 : 0.2))
                            )
                    }
                }
            }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        AnyTransition.move(edge: .trailing)
    }
}

//
//HStack(alignment: .center, spacing: -3) {
//    if showDetail {
//        Image(systemName: "play.fill")
//            .font(.system(size: 30))
//            .transition(
//                .scale(scale: showDetail ? 0 : 1)
//                .combined(with: .opacity)
//                .animation(.easeOut(duration: 0.3))
//            )
//    }
//    Image(systemName: "play.fill")
//        .font(.system(size: 30))
//        .foregroundColor(.green)
//        .transition(
//            .opacity
//                .animation(.linear(duration: 0.3))
//        )
//    if !showDetail {
//        Image(systemName: "play.fill")
//            .font(.system(size: 30))
//            .foregroundColor(.red)
//            .transition(
//                .scale(scale: showDetail ? 1 : 0)
//                .combined(with: .opacity)
//                .animation(.linear(duration: 0.3))
//            )
//    }
//}
