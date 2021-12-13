//
//  ViewController.swift
//  Setting Screen Project
//
//  Created by Alikhan Tuxubayev on 08.12.2021.
//

import UIKit

class ViewController: UIViewController {

    var models = Section.getSettingCell()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.register(SwitchSettingsTableViewCell.self, forCellReuseIdentifier: SwitchSettingsTableViewCell.identifierSwitchSettings)
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: NotificationTableViewCell.identifierNotification)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 55
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupHierarchy()
        setupLayout()
        setupView()
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Настройки"
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.typeCell.self {
        case .staticCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
            cell.configure(model: model)
            return cell
            
        case .switchCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchSettingsTableViewCell.identifierSwitchSettings, for: indexPath) as? SwitchSettingsTableViewCell else { return UITableViewCell() }
            cell.configure(model: model)
            return cell
            
        case .notificationCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identifierNotification, for: indexPath) as? NotificationTableViewCell else { return UITableViewCell() }
            cell.configure(model: model)
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
       
        switch model.typeCell {
        case .staticCell:
            print(model.title)
        case .switchCell:
            print(model.title)
        case .notificationCell:
            print(model.title)
        }
    }
}

