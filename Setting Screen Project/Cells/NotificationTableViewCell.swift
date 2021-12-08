//
//  NotificationTableViewCell.swift
//  Setting Screen Project
//
//  Created by Alikhan Tuxubayev on 08.12.2021.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    static let identifier = "NotificationTableViewCell"
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.addSubview(iconImageView)
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.lineBreakMode = .byClipping
        
        return label
    }()
    
    private lazy var notificationContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.addSubview(notificationLabel)
        
        return view
    }()
    
    private lazy var notificationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 1
        label.textAlignment = .center
        label.lineBreakMode = .byClipping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func setupHierarchy() {
        [iconContainer, label, notificationContainer].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            iconContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            iconContainer.widthAnchor.constraint(equalToConstant: 40),
            iconContainer.heightAnchor.constraint(equalToConstant: 40),
            
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 20),
            
            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            
            notificationContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            notificationContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -42),
            notificationContainer.widthAnchor.constraint(equalToConstant: 30),
            notificationContainer.heightAnchor.constraint(equalToConstant: 30),
            
            notificationLabel.centerYAnchor.constraint(equalTo: notificationContainer.centerYAnchor),
            notificationLabel.centerXAnchor.constraint(equalTo: notificationContainer.centerXAnchor),
            notificationLabel.widthAnchor.constraint(equalToConstant: 10),
            notificationLabel.heightAnchor.constraint(equalToConstant: 10),
        ])
    }
    
    private func setupView() {
        contentView.clipsToBounds = true
        accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    }
    
    public func configure(model: NotificationSettingsOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        notificationContainer.backgroundColor = model.notificationBackgroundColor
        notificationLabel.text = model.notificationNum
    }

}
