//
//  TodoDetailRouter.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/21.
//

import UIKit



protocol TodoListWireframe: AnyObject {
    func addTodo()
}

class ArticleListRouter: TodoListWireframe {
    
    weak var view: UIViewController!
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func addTodo() {
        print("入力画面へ遷移する")
    }
}
