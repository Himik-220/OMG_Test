//
//  CustomTableViewCell.swift
//  test
//
//  Created by Leonid Romanov on 09.03.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  static let cellID = "CustomTableViewCell"
  
  var randomNumber = 0
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .none
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(collectionView)
    self.selectionStyle = .none
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.cellID)
    layoutForCollection()
    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
      guard let self = self else { return }
      self.randomNumber = Int.random(in: Int(Int16.min)..<Int(Int16.max))
      collectionView.reloadData()
    }
  }
  
  private func layoutForCollection() {
    NSLayoutConstraint.activate([
      collectionView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      collectionView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10),
      collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
      collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


extension CustomTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return Int.random(in: 10..<Int(Int16.max))
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.cellID, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
    cell.contentView.layer.borderWidth = 0.5
    cell.contentView.layer.borderColor = UIColor.systemCyan.cgColor
    cell.contentView.clipsToBounds = true
    cell.contentView.layer.cornerRadius = 10
    cell.mainLabel.text = "\(randomNumber + indexPath.item)"
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 80, height: 80)
  }
}
