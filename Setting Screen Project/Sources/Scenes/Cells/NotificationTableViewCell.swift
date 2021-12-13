//
//  NotificationTableViewCell.swift
//  Setting Screen Project
//
//  Created by Alikhan Tuxubayev on 08.12.2021.
//

import UIKit

class NotificationTableViewCell: SettingsTableViewCell {
    
    static let identifierNotification = "NotificationTableViewCell"
    
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
