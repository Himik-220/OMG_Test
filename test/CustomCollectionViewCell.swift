//
//  CustomCollectionViewCell.swift
//  test
//
//  Created by Leonid Romanov on 09.03.2024.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
  static let cellID = "CustomCollectionViewCell"
  
  let mainLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  var widthCell: NSLayoutConstraint?
  var heightCell: NSLayoutConstraint?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(mainLabel)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    self.widthCell = contentView.widthAnchor.constraint(equalToConstant: 80)
    self.heightCell = contentView.heightAnchor.constraint(equalToConstant: 80)
    widthCell?.isActive = true
    heightCell?.isActive = true
    createLayoutForLabel()
    self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(minScale)))
  }
  
  @objc func minScale(sender: UITapGestureRecognizer) {
      UIView.animate(withDuration: 0.5) { [weak self] in
        guard let self = self else { return }
        widthCell?.constant = 64
        heightCell?.constant = 64
        self.layoutIfNeeded()
      }
      UIView.animate(withDuration: 0.5, delay: 0.5) { [weak self] in
        guard let self = self else { return }
        widthCell?.constant = 80
        heightCell?.constant = 80
        self.layoutIfNeeded()
      }
  }
  
  private func createLayoutForLabel() {
    NSLayoutConstraint.activate([
      contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      
      mainLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      mainLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      mainLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20),
      mainLabel.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -20)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
