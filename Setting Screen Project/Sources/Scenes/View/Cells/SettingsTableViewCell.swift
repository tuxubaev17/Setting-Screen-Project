//
//  SettingsTableViewCell.swift
//  Setting Screen Project
//
//  Created by Alikhan Tuxubayev on 08.12.2021.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier = "SettingTableViewCell"
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.addSubview(iconImageView)
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.lineBreakMode = .byClipping
        
        return label
    }()
    
    private lazy var modeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.numberOfLines = 1
        label.textAlignment = .left
        label.lineBreakMode = .byClipping
        
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
        [iconContainer, label, modeLabel]
            .forEach {
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
            
            modeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            modeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -43),
        ])
    }
    
    private func setupView() {
        contentView.clipsToBounds = true
        accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    }
    
    public func configure(model: SettingsOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        modeLabel.text = model.mode
    }

}

