//
//  NSObject+Extensions.swift
//  ANODA_test
//
//  Created by md760 on 06.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import Foundation

extension NSObject {
    class var identifier: String {
        return String(describing: self)
    }
}
