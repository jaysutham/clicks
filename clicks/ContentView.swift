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
    @State private var money = 1000
    @State var seconds = 1
    @State private var machinePrice = 50
    @State private var totalClips = 0
    @State private var marketingLevel = 0
    @State private var marketingPrice = 100
    
    //Sales function
    func sales(){
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true){ timer in seconds -= 1
            
            let randomChance = Int.random(in: 0...self.demand)
            
            if randomChance < 1 {
            if count > 0 {
                count -= 1
                money += price
             }
           }
        }
    }
    
    //Paper clip machines
    func machine(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ timer in seconds -= 1
            count += 1
            totalClips += 1
     }
    }
    
    //Actual View start
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
            //Paperclip machines/Price/Marketing
            VStack{
            Spacer()
            HStack{
                Spacer()
                Text("Price:")
                Spacer()
                Text("$ " + String(self.price))
                Spacer()
            }
          
                HStack{
                    Spacer()
                    Text("Paperclip Machine:").padding()
                    Text("\(machineCount)")
                    Button(action: {
                        if (self.money - self.machinePrice) > 0 {
                            self.money = self.money - self.machinePrice
                            self.machineCount += 1
                            machine()
                        }
                    }) {
                        Spacer()
                        Text("Buy $" + String(self.machinePrice))
                        Spacer()
                    }
                }
                HStack{
                    Spacer()
                    Text("Marketing Level: ")
                    Text(String(self.marketingLevel))
                    Spacer()
                    Button(action: {
                        if (self.money - 100 > 0){
                            self.sales()
                            self.marketingLevel += 1
                            self.money -= 100
                        }
                    }) {
                        Spacer()
                        Text("Hire Marketing")
                        Spacer()
                    }
                }
                Spacer()
            }
            
  
            
            //Ultimate click button
         Spacer()
            HStack{
                Spacer()
                Button (action: {
                    self.price += 1
                    self.demand += 5
                    
                }){
                    Text("Price Up")
                }
              Spacer()
                Button (action: {
                    if self.price - 1 > 0 {
                    self.price -= 1
                    self.demand -= 5
                }
                    
                }){
                    Text("Price Down").padding()
                }
                Spacer()
            }
            
            ///Buy Clip cutton
            HStack{
            Button(action: {
                    self.count += 1
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
