//
//  UIResponder.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/25.
//

import UIKit

extension UIResponder {

    func next<T: UIResponder>(_ type: T.Type) -> T? {
        return next as? T ?? next?.next(type)
    }
}
