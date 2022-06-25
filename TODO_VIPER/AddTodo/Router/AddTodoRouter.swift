//
//  AddTodoRouter.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/21.
//

import UIKit

protocol AddTodoWireframe: AnyObject {
    func moveAddTodo()
}

final class AddTodoRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
            self.viewController = viewController
        }
    
    static func assembleModules() -> UIViewController {
        let view = UIStoryboard.todo.instantiateInitialViewController() as! TodoListViewController
        let router = AddTodoRouter(viewController: view)
        // presenterが中継役なので、全てと繋げる
        let presenter = TodoListPresenter(view: view, router: router)
        // viewからpresenterに通知する必要があるため繋ぐ
        // viewとpresenterは互いが互いを知っている
        view.inject(presenter: presenter)
        return view
    }
    
}

extension AddTodoRouter: AddTodoWireframe {
    
    func moveAddTodo() {
        print("Todo追加画面に遷移する")
    }
    
}
