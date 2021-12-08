//
//  ViewController.swift
//  Setting Screen Project
//
//  Created by Alikhan Tuxubayev on 08.12.2021.
//

import UIKit

class ViewController: UIViewController {

    var models = [Section]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.register(SwitchSettingsTableViewCell.self, forCellReuseIdentifier: SwitchSettingsTableViewCell.identifier)
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: NotificationTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        setupHierarchy()
        setupLayout()
        setupView()
        
        tableView.dataSource = self
        tableView.delegate = self
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
    
    private func configure() {
        models.append(Section( options: [
            .switchCell(model: SwitchSettingsOption(title: "АвиаРежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, isOn: false)),
            
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .link, arrow: UIImage(systemName: "arrow.right"), mode: "Не подключен")),
            
            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link, arrow: UIImage(systemName: "arrow.right"), mode: "выкл")),
            
            .staticCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen, arrow: UIImage(systemName: "arrow.right"), mode: " ")),
            
            .staticCell(model: SettingsOption(title: "Режим мода", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen, arrow: UIImage(systemName: "arrow.right"), mode: " ")),
            
            .switchCell(model: SwitchSettingsOption(title: "VPN", icon: UIImage(systemName: "vpn"), iconBackgroundColor: .link, isOn: false)),
        ]))
        
        models.append(Section( options: [
            
            .staticCell(model: SettingsOption(title: "Уведомление", icon: UIImage(systemName: "bell.badge"), iconBackgroundColor: .systemRed, arrow: UIImage(systemName: "arrow.right"), mode: " ")),
            
            .staticCell(model: SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "speaker.wave.3"), iconBackgroundColor: .systemPink, arrow: UIImage(systemName: "arrow.right"), mode: " ")),
            
            .staticCell(model: SettingsOption(title: "Фокусирование", icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemIndigo, arrow: UIImage(systemName: "arrow.right"), mode: " ")),
            
            .staticCell(model: SettingsOption(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemIndigo, arrow: UIImage(systemName: "arrow.right"), mode: " ")),
        ]))
        
        models.append(Section( options: [
            
            .notificationCell(model: NotificationSettingsOption(title: "Основные", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray, arrow: UIImage(systemName: "arrow.right"), notificationBackgroundColor: .systemRed, notificationNum: "1")),
            
            .staticCell(model: SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "switch.2"), iconBackgroundColor: .systemGray, arrow: UIImage(systemName: "arrow.right"), mode: " ")),
            
            .staticCell(model: SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue, arrow: UIImage(systemName: "arrow.right"), mode: " ")),
            
            .staticCell(model: SettingsOption(title: "Экран Домой", icon: UIImage(systemName: "checkerboard.rectangle"), iconBackgroundColor: .systemBlue, arrow: UIImage(systemName: "arrow.right"), mode: " ")),
            
            .staticCell(model: SettingsOption(title: "Универсальный доступ", icon: UIImage(systemName: "figure.wave.circle.fill"), iconBackgroundColor: .systemBlue, arrow: UIImage(systemName: "arrow.right"), mode: " ")),
        ]))
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
            cell.configure(model: model)
            return cell
            
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchSettingsTableViewCell.identifier, for: indexPath) as? SwitchSettingsTableViewCell else { return UITableViewCell() }
            cell.configure(model: model)
            return cell
            
        case .notificationCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identifier, for: indexPath) as? NotificationTableViewCell else { return UITableViewCell() }
            cell.configure(model: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            print(model.title)
        case .switchCell(let model):
            print(model.title)
        case .notificationCell(let model):
            print(model.title)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
}

