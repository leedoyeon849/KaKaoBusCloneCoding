//
//  BusArrivalTime.swift
//  KakaoBus
//
//  Created by DOYEON LEE on 2022/07/26.
//

import Foundation
import SwiftUI

struct BusArrivalTime: View{
    
    var busNumber: String
    var firstTime: String
    var secondTime: String
    
    init(busNumber: String, firstTime: String, secondTime: String){
        self.firstTime = firstTime
        self.secondTime = secondTime
        self.busNumber = busNumber
    }
    
    var body: some View{
        HStack{
            Text(self.busNumber)
                .font(.system(size: 23, weight: .semibold))
                .foregroundColor(.blue)
                .frame(maxWidth: 100, alignment: .leading)
                .multilineTextAlignment(.leading)
            Spacer()
            Spacer()
            VStack(alignment: .leading){
                Group{
                    HStack{
                        Text(self.firstTime)
                        LeftBusStopCount(leftBusStopNum: 3, busStopState: "")
                    }
                    HStack {
                        Text(self.secondTime)
                        LeftBusStopCount(leftBusStopNum: 10, busStopState: "Empty")
                    }
                }
                .font(.system(size: 16))
            }
            Spacer()
            Image(systemName: "alarm")
                .foregroundColor(Color(.systemGray))
        }
        .padding(.horizontal, 20)
        Divider()
    }
}
