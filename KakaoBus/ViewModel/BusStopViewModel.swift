//
//  BusStopViewModel.swift
//  KakaoBus
//
//  Created by DOYEON LEE on 2022/07/26.
//

import Foundation

class BusStopViewModel: ObservableObject {
    
    @Published var busList: [String] = ["9712", "382"]
    @Published var ArrivalTimeOfFirstBus: String?
    @Published var ArrivalTimeOfSecondBus: String?
    @Published var LeftBusStopOfFirstBus: Int?
    @Published var LeftBusStopOfSecondBus: Int?
    
    func changeBusNumber(){
        
    }
}
