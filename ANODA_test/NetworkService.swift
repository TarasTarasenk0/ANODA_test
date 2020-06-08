//
//  NetworkService.swift
//  ANODA_test
//
//  Created by md760 on 06.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import Foundation

enum NetworkService {
    static func getPostDataBy(forResource: String, ofType: String, completion: @escaping ((_ model: FlowPosts?) -> Void)) {
        if let path = Bundle.main.path(forResource: forResource, ofType: ofType) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let model = try? JSONDecoder().decode(FlowPosts.self, from: data)
                completion(model)
            } catch let error {
                print("Error!: " + error.localizedDescription )
            }
            
        }
    }
}

