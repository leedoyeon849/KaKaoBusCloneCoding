//
//  ContentView.swift
//  KakaoBus
//
//  Created by DOYEON LEE on 2022/07/01.
//

import SwiftUI

struct ContentView: View {
    @State var userAgreed: Bool = true
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                TopBar()
                    .padding(.bottom, 7)
                Divider()
                
                NearBusStopCard(busStopName: "역삼역")
                Divider()
                
                FavoriteBusStop(busNumberList: ["9711I", "740"])
                Divider()
                
                FavoriteBusStop(busNumberList: ["9711I", "740"])
                Spacer()
            }
            .navigationBarHidden(true)
        }
        .navigationBarTitle("", displayMode: .automatic)
        .navigationBarHidden(true)
    }
    }
//}


struct TopBar: View {
    var body: some View {
        HStack{
            Image(systemName: "text.justify")
                .padding(.leading)
            SearchBar()
            Button(action: {}){
                Text("Edit")
                    .font(Font.headline.weight(.semibold))
            }
            .padding(.trailing)
            .foregroundColor(.black)
        }
    }
}

struct SearchBar: View {
    @State var userName: String = ""
    
    var body: some View {
        HStack{
            TextField("Search bus/bus stop", text : $userName)
                .padding(5)
                .padding(.horizontal, 10)
                .border(Color(.systemGray5), width: 1)
                .cornerRadius(2)
                .background(Color(.systemGray6))
                .padding(.horizontal, 10)
        }
    }
}

struct NearBusStopCard: View {
    let busStopName: String
    
    init(busStopName: String) {
        self.busStopName = busStopName
    }

    
    var body: some View {
        HStack{
            Image("KaKaoBusStop")
                .resizable()
                .frame(width: 38, height: 38)
            VStack(alignment: .leading) {
                Text("Nearby Stops")
                    .font(Font.headline.weight(.medium))
                HStack{
                    Text(busStopName)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color(.systemGray))
                    Text("10m")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color(.systemOrange))
                }
            }
            Spacer()
        }
        .padding(15)
        .frame(maxWidth: .infinity)
        .background()
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color(.systemGray4), lineWidth: 1))
        .cornerRadius(5)
        .padding(10)
        .background(Color(.systemGray6))
    }
}



struct LeftBusStopCount: View{
    let leftBusStopNum: Int
    let busStopState: String
    
    init(leftBusStopNum: Int, busStopState: String){
        self.leftBusStopNum = leftBusStopNum
        self.busStopState = busStopState
    }
    
    var body: some View{
        HStack(alignment: .center){
            Text("\(self.leftBusStopNum) left")
                .foregroundColor(Color(.systemGray))
            if (busStopState != ""){
                Text(busStopState)
                    .foregroundColor(Color(.orange))
            }
        }
        .font(.system(size: 12))
        .padding(2)
        .overlay(
            RoundedRectangle(cornerRadius: 2)
                .stroke(Color(.systemGray5), lineWidth: 1))
    }
}

// - MARK: Previews
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
            ContentView()
                .previewInterfaceOrientation(.portrait)
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
