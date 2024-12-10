//
//  ContentView.swift
//  War Card Game
//
//  Created by shubham tripathi on 08/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var playercard = "card7"
    @State var cpucard = "card13"
    
    @State var playerscore = 0
    @State var cpuscore = 0 //@state allows for the automatic change so it don't show error at the time execution
    
    var body: some View {
        
        ZStack{
            
            Image("background-wood-cartoon")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                
                Spacer()
                Image("logo")
                Spacer()
                
                HStack{
                    Spacer()
                    Image(playercard)
                    Spacer()
                    Image(cpucard)
                    Spacer()
                }
                
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom,15)
                        Text(String(playerscore)) //cause there above in the difinition i used as integer but text can only take strings
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom,15)
                        Text(String(cpuscore))
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                Spacer()
            }
        }
    }
    
    func deal(){
        //randomise the player card
        let playercardvalue = Int.random(in: 2...14)
        playercard = "card" + String(playercardvalue) //here we added the string cause above we specify this var as string
        //randommise the cpu card
        let cpucardvalue = Int.random(in: 2...14)
        cpucard = "card" + String(cpucardvalue)
        //update the scores
        if playercardvalue > cpucardvalue {
            //add 1 to player score
            playerscore += 1
        }
        else if cpucardvalue > playercardvalue {
            //add 1 to cpu score
            cpuscore += 1
        }
    }
}

#Preview {
    ContentView()
}
