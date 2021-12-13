//
//  SwitchSettingsTableViewCell.swift
//  Setting Screen Project
//
//  Created by Alikhan Tuxubayev on 08.12.2021.
//

import UIKit

class SwitchSettingsTableViewCell: UITableViewCell {
    
    static let identifier = "SwitchSettingsTableViewCell"
    
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
    
    private lazy var switching: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .systemOrange
        
        return mySwitch
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        switching.isOn = false
    }
    
    private func setupHierarchy() {
        [iconContainer, label, switching].forEach {
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
            
            switching.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            switching.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            switching.widthAnchor.constraint(equalToConstant: 50),
            switching.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    private func setupView() {
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    public func configure(model: SwitchSettingsOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        switching.isOn = model.isOn
    }

}
