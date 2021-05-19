//
//  ContentView.swift
//  clicks
//
//  Created by Jay Suthamjaru on 2021-05-17.
//

import SwiftUI

struct ContentView: View {

    @State private var count = 0
    @State private var machineCount:Int = 0
    @State private var demand = 1
    @State private var price = 1
    @State private var money = 100
    @State var seconds = 10
    @State private var machinePrice:Int = 50
    @State private var totalClips:Int = 0
    @State private var marketingLevel = 0
    @State private var marketingPrice = 100
    @State private var clipsPM = 0
    
    
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
    
    func cpm(){
        let currentClip = totalClips
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false){ timer in seconds -= 1
            let clipsPerMinute = (totalClips - currentClip)*30
            clipsPM = clipsPerMinute
            cpm()
     }
    }
    
    
    
    //Actual View start
    var body: some View {
        VStack{
            VStack{
            HStack{
            Text("Total Clips: \(totalClips)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            }.padding(.bottom, 5)
                HStack{
                    Text("Clips/minute: \(clipsPM)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }.padding(.bottom, 20)
            
            
            
            ///Money
            HStack{
                Spacer()
                Text("Money: $")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Text(String(money))
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
            }
            //Stock Amt
            HStack{
                Spacer()
                Text("Stock:")
                    .font(.title)
                    .fontWeight(.bold).padding()
                    .foregroundColor(.white)
                Spacer()
                Text("\(count)").font(.title)
                    .foregroundColor(.white)
                Spacer()
            }
            //Paperclip machines/Price/Marketing
            VStack{
            HStack{

                Text("Price:")
                    .foregroundColor(.white)
                Text("$ " + String(self.price))
                    .foregroundColor(.white)

            }.padding()
                HStack{
                    Text("Paperclip Machines:")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                    Text("\(machineCount)")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        if (self.money - self.machinePrice) >= 0 {
                            self.money = self.money - self.machinePrice
                            self.machineCount += 1
                            machinePrice = machinePrice + 2
                            machine()
                        }
                    }) {
                        Text("Buy $" + String(self.machinePrice))
                            .font(.title3)
                    }
                }.padding()
                HStack{
                    Text("Marketing Employees: ")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                    Text(String(self.marketingLevel))
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        if (self.money - 100 >= 0){
                            self.sales()
                            self.marketingLevel += 1
                            marketingPrice += 10
                            self.money -= 100
                        }
                    }) {
                        Text("Hire $\(marketingPrice)")
                            .font(.title3)
                    }
                }.padding()
            }
            
            HStack{
                ForEach(0..<machineCount){item in
                    Image(systemName: "faxmachine")
                }
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
                    Text("Make Paperclip")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
            }.padding()
            }
        }.onAppear {
            self.sales()
            self.cpm()
        }
        .background(Image("MetalBG").resizable().scaledToFill().ignoresSafeArea())
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
