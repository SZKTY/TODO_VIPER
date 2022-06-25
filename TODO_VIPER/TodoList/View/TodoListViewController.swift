//
//  ViewController.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/20.
//

import UIKit

protocol TodoListView: AnyObject {
    func showTodos(_ todoListEntities: [TodoListEntity])
    func showEmpty()
}

final class TodoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var todoListEntities = [TodoListEntity]()
    
    private var presenter: TodoListPresentation! //nil になる
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        addButton.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
    }

}

@objc private extension TodoListViewController {
    
    func tappedAddButton() {
        //Presenterにイベントを通知
        self.presenter?.tappedAddButton()
    }
}

extension TodoListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension TodoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoListTableViewCell
        cell.tittleLabel?.text = todoListEntities[indexPath.row].title
        return cell
    }
    
    
}

