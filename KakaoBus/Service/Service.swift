//
//  Service.swift
//  KakaoBus
//
//  Created by DOYEON LEE on 2022/07/23.
//

import Foundation
import RxSwift


class ServiceProvier{
    
    var url = URL(string: "")
    
    init(url: String){
        self.url = URL(string: url)
    }
    
    func loadImage(url: URL) {
            
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
               
            guard let data = data else {
                return
            }

//            let image = UIImage(data: data)
//            completion(image)
        }
        
        task.resume()
//        return task
    }
    
}



