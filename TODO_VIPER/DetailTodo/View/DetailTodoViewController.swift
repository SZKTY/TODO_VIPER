//
//  DetailTodoViewController.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/25.
//

import UIKit

protocol DetailTodoView: AnyObject {
    func showTodo(todo: [String])
    
}

class DetailTodoViewController: UIViewController {

    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var presenter: DetailTodoPresentaion!
    
    var todo = [String]() {
        didSet {
            self.todoLabel.text = todo.first
            self.memoLabel.text = todo.last
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "DetailTodo"
        finishButton.addTarget(self, action: #selector(tappedFinishButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter?.viewWillAppear()
    }
    
    func inject(presenter: DetailTodoPresenter) {
        self.presenter = presenter
    }
    
}

@objc private extension DetailTodoViewController {
    
    func tappedFinishButton() {
        self.presenter.finishTodo()
    }
    
    func tappedBackButton() {
        self.presenter.tappedBackButton()
    }
}

extension DetailTodoViewController: DetailTodoView {
    
    func showTodo(todo: [String]){
        self.todo = todo
    }
    
}
