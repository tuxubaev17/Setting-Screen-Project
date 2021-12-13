//
//  SwitchSettingsTableViewCell.swift
//  Setting Screen Project
//
//  Created by Alikhan Tuxubayev on 08.12.2021.
//

import UIKit

class SwitchSettingsTableViewCell: SettingsTableViewCell {
    
    static let identifierSwitchSettings = "SwitchSettingsTableViewCell"
    
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
    
    public override func configure(model: SettingsOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        switching.isOn = model.isOn ?? false
    }

}
