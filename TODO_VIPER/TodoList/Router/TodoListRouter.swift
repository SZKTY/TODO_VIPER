//
//  TodoDetailRouter.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/21.
//

import UIKit

protocol TodoListWireframe: AnyObject {
    func addTodo()
    func detailTodo(row: Int)
}

final class TodoListRouter {
    // 画面遷移のためにViewControllerが必要。initで受け取る
    private unowned let viewController: UIViewController

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = UIStoryboard.todoList.instantiateInitialViewController() as! TodoListViewController
        let intractor = TodoListInteractor()
        let router = TodoListRouter(viewController: view)
        // presenterが中継役なので、全てと繋げる
        let presenter = TodoListPresenter(view: view,
                                          interactor: intractor,
                                          router: router)
        intractor.presenter = presenter
        // viewからpresenterに通知する必要があるため繋ぐ
        view.inject(presenter: presenter)
        return view
    }
}

extension TodoListRouter: TodoListWireframe {
    func addTodo() {
        let next = AddTodoRouter.assembleModules()
        viewController.show(next: next)
    }

    func detailTodo(row: Int) {
        let next = DetailTodoRouter.assembleModules(row: row)
        viewController.show(next: next)
    }
}
