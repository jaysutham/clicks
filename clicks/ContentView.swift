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
    @State private var demand = 1
    @State private var price = 1
    @State private var money = 0
    @State var seconds = 1
    @State private var machinePrice = 50
    @State private var totalClips = 0
    
    func sales(){
        Timer.scheduledTimer(withTimeInterval: Double(demand), repeats: true){ timer in seconds -= 1
            
            let randomChance = Int.random(in: 0...10)
            
            if randomChance > 1{
            if count > 0 {
                count -= 1
                money += price
             }
           }
        }
    }
    
    func machine(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ timer in seconds -= 1
            count += 1
            totalClips += 1
     }
    }
    
    var body: some View {
        VStack(alignment: .center){
            Text("Total Clips: \(totalClips)")
                .font(.title)
            Spacer()
            ///Money
            HStack{
                Text("Money: $")
                    .font(.title)
                    .fontWeight(.bold)
                Text(String(money))
                    .font(.title)
            }
            //Stock Amt
            HStack{
                Text("Stock:")
                    .font(.title)
                    .fontWeight(.bold).padding()
                Text("\(count)").font(.title)
            }
            //Paperclip machines
            Spacer()
            if self.money > 10 {
                HStack{
                    Text("Paperclip Machine:").padding()
                    Text("\(machineCount)")
                    Button(action: {
                        if (self.money - self.machinePrice) > 0 {
                            self.money = self.money - self.machinePrice
                            self.machineCount += 1
                            machine()
                        } else{
                            Text("Not enough Money!")
                        }
                    }) {
                        Text("Buy Clip Machine")
                    }
                }
            }
            
            //Ultimate click button
         Spacer()
            Button(action: {
                    self.count += 10
                    self.totalClips += 1
                
            }) {
                    Text("Buy Paperclip")
             }
            Button (action: self.sales, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
       
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
