//
//  ViewController.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/20.
//

import UIKit

protocol TodoListView: AnyObject {
    func showTodos(_ todoListEntities: [TodoListEntity])
}

final class TodoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!

    private var repositories: [TodoListEntity] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    var presenter: TodoListPresentation! // nilを避けるためにSceneDelegateで依存性注入

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "TodoList"
        tableView.delegate = self
        tableView.dataSource = self
        addButton.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        UserDefaults.standard.removeObject(forKey: .todoList)
        self.presenter.viewWillAppear()
    }

    func inject(presenter: TodoListPresenter) {
        self.presenter = presenter
    }

}

@objc private extension TodoListViewController {

    func tappedAddButton() {
        // Presenterにイベントを通知
        self.presenter.tappedAddButton()

    }
}

extension TodoListViewController: TodoListView {

    func showTodos(_ todoListEntities: [TodoListEntity]) {
        self.repositories = todoListEntities
    }

}

extension TodoListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.didSelect(row: indexPath.row)
    }

}

extension TodoListViewController: UITableViewDataSource, Finish {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoListTableViewCell
        cell.tittleLabel?.text = repositories[indexPath.row].title
        cell.delegate = self
        return cell
    }

    func tappedFinishButton(row: Int) {
        self.presenter.tappedFinishButton(row: row)
    }

}
