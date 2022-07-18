//
//  ContentView.swift
//  iEFIS
//
//  Created by Benedict Ramage-Mangles on 20/06/2022.
//

import SwiftUI
        
// boilerplate for rotation
//func rotation(
//    _ angle: Angle,
//    anchor: UnitPoint = .center
//) -> RotatedShape<Self>
// 

struct ContentView: View {
    
    @State private var FakeSpeed = 150
    @State private var FakePitch = 10
    @State private var FakeRoll = -15
    @State private var FakeAlt = 6667
    
    
    var body: some View {
        //main content
        ZStack {
            Image("pfd_bg2") //sliding pfd image
                .resizable()
                .frame(width:UIScreen.main.bounds.size.height*3, height:UIScreen.main.bounds.size.height*5.14)
                .offset(y:(6.7 * CGFloat(FakePitch)))
                .rotationEffect(.degrees(CGFloat(FakeRoll)))
            
            Image("pfd_mask") //static mask
                .resizable()
                .frame(width:UIScreen.main.bounds.size.height*3, height:UIScreen.main.bounds.size.height*3)
            HStack{ // whiskers consist of a set of primitive shapes
                ZStack {
                    Capsule()
                        .fill(.yellow)
                        .frame(width: 55, height: 9)
                    Capsule()
                        .fill(.black)
                        .frame(width: 50, height: 4)
                }
                Spacer()
                    .frame(width:75)
                ZStack {
                    Capsule()
                        .fill(.yellow)
                        .frame(width: 55, height: 9)
                    Capsule()
                        .fill(.black)
                        .frame(width: 50, height: 4)
                }
            }
            HStack{ // speed and altimeters
                ZStack{
                Rectangle() //speed
                    .fill(.white)
                    .frame(width: 82, height: UIScreen.main.bounds.size.height*0.78)
                Rectangle() //speed
                        .fill(.black)
                    .frame(width: 78, height: UIScreen.main.bounds.size.height*0.78-4)
                    .offset(x: 0, y: 0)
                Image("pfd_spd4")
                    .resizable()
                    .frame(width: 80)
                    .offset(y:(8.8*CGFloat(FakeSpeed)*0.5376)-(138480/139))
                    // these magic numbers relate to the offset to
                    // the bottom of the speed tape and the multiplier
                    // per nautical mile/hr
                    // you would not believe how long it took me to nail
                    // these numbers down
                    // y = ax+b essentially
                    //.offset(y:(100*(8.8*(80/139)))-((80/139)*(3462/2)))
                Rectangle() //bottom mask
                        .frame(width:80,height:100)
                        .offset(y: UIScreen.main.bounds.size.height*0.52)
                Rectangle() //bottom mask
                        .frame(width:80,height:100)
                        .offset(y: -UIScreen.main.bounds.size.height*0.52)
                Capsule()
                        .fill(.yellow)
                        .frame(width: 32, height: 5)
                        .offset(x:40)
                Text("GPS")
                        .foregroundColor(.yellow)
                        .bold()
                        .offset(y: UIScreen.main.bounds.size.height*0.44)
                
                } //end speed
                Spacer()
                    .frame(width: UIScreen.main.bounds.size.height+100)
                ZStack{
                Rectangle() //speed
                    .fill(.white)
                    .frame(width: 82, height: UIScreen.main.bounds.size.height*0.78)
                Rectangle() //speed
                        .fill(.black)
                    .frame(width: 78, height: UIScreen.main.bounds.size.height*0.78-4)
                    .offset(x: 0, y: 0)
                Image("pfd_alt")
                    .resizable()
                    .frame(width: 80)
                    .offset(y:(8.8*CGFloat(FakeAlt)*0.005376)-(138480/139))

                    // y = ax+b as above

                Rectangle() //bottom mask
                        .frame(width:80,height:100)
                        .offset(y: UIScreen.main.bounds.size.height*0.52)
                Rectangle() //bottom mask
                        .frame(width:80,height:100)
                        .offset(y: -UIScreen.main.bounds.size.height*0.52)
                Capsule()
                        .fill(.green)
                        .frame(width: 80, height: 32)
                        .offset()
                Capsule()
                        .fill(.black)
                        .frame(width: 76, height: 28)
                        .offset()
                    Text(String(FakeAlt))
                        .foregroundColor(.green)
                        .bold()
                    
                }
            }
        }
        .offset(x: 0, y: 20)
        //.position(x:UIScreen.main.bounds.size.width/2, y:UIScreen.main.bounds.size.height/2+10)
        //Text("Hello, world!")
          //  .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
