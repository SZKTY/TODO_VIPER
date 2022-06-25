//
//  UIStoryboard.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/22.
//

import UIKit

extension UIStoryboard {
    
    static var todoList: UIStoryboard {
        UIStoryboard(name: .todoList, bundle: nil)
    }
    
    static var addTodo: UIStoryboard {
        UIStoryboard(name: .addTodo, bundle: nil)
    }
    
    static var detailTodo: UIStoryboard {
        UIStoryboard(name: .detailTodo, bundle: nil)
    }
}
