//
//  ContentView.swift
//  clicks
//
//  Created by Jay Suthamjaru on 2021-05-17.
//

import SwiftUI

struct ContentView: View {

    @State private var count = 0
    @State private var machineCount = 0
    
    var body: some View {
        VStack(alignment: .center){
         Spacer()
            HStack{
                Text("Stock:")
                    .font(.largeTitle)
                Text("\(count)").font(.largeTitle)
            }
            
            if self.count > 10 {
                HStack{
                    Text("Woo!")
                }
            }
            
            
         Spacer()
            Button(action: { self.count += 1 }) {
                    Text("Buy Paperclip")
             }
        }
       
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
