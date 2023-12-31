//
//  ContentView.swift
//  LoadingAnimation1
//
//  Created by Berk Aksu on 16.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    //An array hold the status of each cirle respectively
    @State private var isCircleBig = [false, false, false]
    //Delay for the execution times for each circle
    @State private var delay = [0.0, 0.2, 0.4]
    
    var body: some View {
        HStack{
            //Iterate both arrays
            ForEach(0..<3){index in
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: isCircleBig[index] ? 15 : 0, height: isCircleBig[index] ? 15 : 0)
                    .animation(.easeIn(duration: 0.7).repeatForever(), value: isCircleBig[index])
                    .onAppear{
                        //Pospone the start time of animation respectively
                        DispatchQueue.main.asyncAfter(deadline: .now() + delay[index]) {
                            self.isCircleBig[index] = true
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
