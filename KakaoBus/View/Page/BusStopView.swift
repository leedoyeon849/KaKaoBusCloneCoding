//
//  BusStopView.swift
//  KakaoBus
//
//  Created by DOYEON LEE on 2022/07/25.
//

import SwiftUI

struct BusStopView: View {
    
    @ObservedObject var busStopViewModel = BusStopViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 5) {
                Text("23259")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color(.white))
                Text("선릉역")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(.white))
                Text("포스코빌딩방면")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color(.white))
                HStack(spacing: 20) {
                    RoundedButton(color: .white, text: "지하철", fontSize: 16, icon: nil)
                    RoundedButton(color: .white, text: "지도", fontSize: 16, icon: "map")
                    RoundedButton(color: .white, text: "⭐️", fontSize: 16, icon: nil)
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
//            .padding()
            .background(Color(.systemGray))
            
            BusTypeSectionHeader(headerText: "Blue bus")

            VStack{
                busStopViewModel.busList.map( {
                    (busNumber: String) ->
                    return BusArrivalTime(busNumber: $0,
                                   firstTime: "5m 3s",
                                   secondTime: "14m 23s")
                } )
                ForEach(busStopViewModel.busList, id: \.self) {
                    BusArrivalTime(busNumber: $0,
                                   firstTime: "5m 3s",
                                   secondTime: "14m 23s")
                }
            }
            .padding(.top)
            
            Spacer()
        } // Vstack
    } // body
} // struct

// - MARK: Components

struct BusTypeSectionHeader: View {
    var headerText: String
    
    init(headerText: String) {
        self.headerText = headerText
    }
    
    var body: some View {
        HStack {
            Text(headerText)
                .foregroundColor(Color(.systemGray))
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(Color(.systemGray5))
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color(.systemGray), lineWidth: 1))
    }
}

struct RoundedButton: View{
    
    let color: Color
    let text: String
    let fontSize: CGFloat
    let icon: String?

    init(color: Color,
         text: String,
         fontSize: CGFloat,
         icon: String?){
        self.color = color
        self.text = text
        self.fontSize = fontSize
        self.icon = icon ?? nil
    }
    
    var body: some View {
        Button(action: {}){
            if let icon = icon {
            Image(systemName: icon)
                .foregroundColor(color)
            }
            Text(text)
                .font(.system(size: fontSize, weight: .medium))
                .foregroundColor(color)
        }
        .padding(8)
        .padding(.horizontal, 10)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 100)
                .stroke(Color(.white), lineWidth: 1))
    }
}

// - MARK: Preiveiws

struct BusStopView_Previews: PreviewProvider {
    static var previews: some View {
        BusStopView()
    }
}
