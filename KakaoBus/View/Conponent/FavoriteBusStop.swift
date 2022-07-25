//
//  FavoriteBusStop.swift
//  KakaoBus
//
//  Created by DOYEON LEE on 2022/07/25.
//

import Foundation
import SwiftUI


struct FavoriteBusStop: View{
    let busNumberList: [String]
    
    init(busNumberList: [String]){
        self.busNumberList = busNumberList
    }
    
    @State var tag:Int? = nil
    
    var body: some View{
        VStack {
            ZStack{
                NavigationLink(destination: BusStopView(), tag: 1, selection: self.$tag ) {
                  EmptyView()
                }
            }
            HStack{
                VStack(alignment: .leading) {
                    Text("선릉역")
                        .font(Font.headline.weight(.regular))
                    HStack{
                        Text("포스코빌딩 Direction")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(Color(.systemGray))
                        Text("10m")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color(.systemOrange))
                    }
                }.onTapGesture {
                    self.tag = 1
                }
                Spacer()
                Button(action: {}){
                    Image(systemName: "plus")
                        .foregroundColor(Color(.systemGray))
                    Text("Bus")
                        .font(Font.headline.weight(.semibold))
                        .foregroundColor(Color(.systemGray))
                }
                .padding(8)
                .foregroundColor(.black)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray4), lineWidth: 1))

            }
            .padding(.leading, 5)
            .padding([.leading, .top, .trailing])
            if (busNumberList.count != 0) {
                Divider()
                VStack(){
                    ForEach(busNumberList, id: \.self) {
                        BusArrivalTime(busNumber: $0, firstTime: "5m 3s", secondTime: "14m 23s")
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background()
        .border(Color(.systemGray6), width: 1)
        .cornerRadius(5)
        .padding(.bottom, 10)
        .background(Color(.systemGray6))
    }
}
