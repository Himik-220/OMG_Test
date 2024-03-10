//
//  ViewController.swift
//  test
//
//  Created by Leonid Romanov on 09.03.2024.
//

import UIKit

class ViewController: UIViewController {
  
  let tableview = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableview.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(tableview)
    tableview.dataSource = self
    tableview.delegate = self
    view.backgroundColor = .systemBackground
    tableview.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.cellID)
    createLayoutTable()
  }
  
  
  private func createLayoutTable() {
    NSLayoutConstraint.activate([
      tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableview.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      tableview.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = CustomTableViewCell(frame: .zero)
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Int.random(in: 100..<Int(Int16.max))
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}
