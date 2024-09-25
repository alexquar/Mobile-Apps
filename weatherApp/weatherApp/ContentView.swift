//
//  ContentView.swift
//  weatherApp
//
//  Created by Alex on 2024-09-24.
//

import SwiftUI

struct ContentView: View {
    @State var location:String = "Waterloo, ON"
    @State var weatherMainDay:String = "cloud.sun.fill"
    @State var weatherMainNight:String = "moon.stars.fill"
    @State var tempMain:Int = 64
    @State private var isNight:Bool = false
    var body: some View {
        ZStack{
            BackgroundView(
                colors: isNight ? 
                [.blue,.white , .blue, .yellow]
                :
                [.white,.black , .gray, .black]
            )
            VStack {
                Text(location)
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .padding(.top, 10.0)
                VStack (spacing:8){
                    Image(systemName: isNight ? weatherMainDay : weatherMainNight)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height:180)
                    Text("\(tempMain)°").font(.system(size:70, weight:.medium))
                        .foregroundColor(.white)
                }.padding(.bottom, 40.0)
                    
                HStack(spacing:15){
                    
                    dailyWeather(dayOfWeek: "Mon", imageName: "cloud.sun.fill", temp:69)
                    dailyWeather(dayOfWeek: "Tue", imageName: "cloud.sun.fill", temp:67)
                    dailyWeather(dayOfWeek: "Wed", imageName: "cloud.rain.fill", temp:59)
                    dailyWeather(dayOfWeek: "Thu", imageName: "cloud.fill", temp:58)
                    dailyWeather(dayOfWeek: "Fri", imageName: "cloud.fill", temp:63)
                    dailyWeather(dayOfWeek: "Sat", imageName: "sun.haze.fill", temp:63)

                }
                Spacer()
                Button {
                    isNight = !isNight
                } label : {
                    changeButton(title: "Change time", textColor: isNight ? .blue : .black, bgColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct dailyWeather: View {
    var dayOfWeek:String
    var imageName:String
    var temp:Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40, height:40)
            Text("\(temp)°").font(.system(size:28, weight:.medium))
                .foregroundColor(.white)
        }
    }
}


struct BackgroundView: View {
    var colors: [Color]
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}


