//
//  SectionModel.swift
//  Setting Screen Project
//
//  Created by Alikhan Tuxubayev on 08.12.2021.
//

import UIKit

struct Section {
    let options: [SettingsOptionType]
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let mode: String
}

struct SwitchSettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var isOn: Bool
}

struct NotificationSettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let notificationBackgroundColor: UIColor
    let notificationNum: String
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SwitchSettingsOption)
    case notificationCell(model: NotificationSettingsOption)
}

extension Section {
    static func getSettingCell() -> [Section] {
        return [
                Section(options: [
                        .switchCell(
                            model: SwitchSettingsOption(
                                    title: "АвиаРежим",
                                    icon: UIImage(systemName: "airplane"),
                                    iconBackgroundColor: .systemOrange,
                                    isOn: false
                            )
                        ),
                
                        .staticCell(model: SettingsOption(
                                    title: "Wi-Fi",
                                    icon: UIImage(systemName: "wifi"),
                                    iconBackgroundColor: .link,
                                    mode: "Не подключен"
                            )
                        ),
                
                        .staticCell(model: SettingsOption(
                                    title: "Bluetooth",
                                    icon: UIImage(systemName: "bluetooth"),
                                    iconBackgroundColor: .link,
                                    mode: "выкл"
                            )
                        ),
                
                        .staticCell(model: SettingsOption(
                                    title: "Сотовая связь",
                                    icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                                    iconBackgroundColor: .systemGreen,
                                    mode: " "
                            )
                        ),
                
                        .staticCell(model: SettingsOption(
                                    title: "Режим мода",
                                    icon: UIImage(systemName: "personalhotspot"),
                                    iconBackgroundColor: .systemGreen,
                                    mode: " "
                            )
                        ),
                
                        .switchCell(model: SwitchSettingsOption(
                                    title: "VPN",
                                    icon: UIImage(systemName: "vpn"),
                                    iconBackgroundColor: .link,
                                    isOn: false
                            )
                        ),
            ]),
            Section( options: [
                        .staticCell(model: SettingsOption(
                                    title: "Уведомление",
                                    icon: UIImage(systemName: "bell.badge"),
                                    iconBackgroundColor: .systemRed,
                                    mode: " "
                            )
                        ),
                
                        .staticCell(model: SettingsOption(
                                    title: "Звуки, тактильные сигналы",
                                    icon: UIImage(systemName: "speaker.wave.3"),
                                    iconBackgroundColor: .systemPink,
                                    mode: " "
                            )
                        ),
                
                        .staticCell(model: SettingsOption(
                                    title: "Фокусирование",
                                    icon: UIImage(systemName: "moon.fill"),
                                    iconBackgroundColor: .systemIndigo,
                                    mode: " "
                            )
                        ),
                
                        .staticCell(model: SettingsOption(
                                    title: "Экранное время",
                                    icon: UIImage(systemName: "hourglass"),
                                    iconBackgroundColor: .systemIndigo,
                                    mode: " "
                            )
                        ),
            ]),
                Section( options: [
                        .notificationCell(model: NotificationSettingsOption(
                                    title: "Основные",
                                    icon: UIImage(systemName: "gear"),
                                    iconBackgroundColor: .systemGray,
                                    notificationBackgroundColor: .systemRed,
                                    notificationNum: "1"
                            )
                        ),
                
                        .staticCell(model: SettingsOption(
                                    title: "Пункт управления",
                                    icon: UIImage(systemName: "switch.2"),
                                    iconBackgroundColor: .systemGray,
                                    mode: " "
                            )
                        ),
                
                        .staticCell(model: SettingsOption(
                                    title: "Экран и яркость",
                                    icon: UIImage(systemName: "textformat.size"),
                                    iconBackgroundColor: .systemBlue,
                                    mode: " "
                            )
                        ),
                
                        .staticCell(model: SettingsOption(
                                    title: "Экран Домой",
                                    icon: UIImage(systemName: "checkerboard.rectangle"),
                                    iconBackgroundColor: .systemBlue,
                                    mode: " "
                            )
                        ),
                
                        .staticCell(model: SettingsOption(
                                    title: "Универсальный доступ",
                                    icon: UIImage(systemName: "figure.wave.circle.fill"),
                                    iconBackgroundColor: .systemBlue,
                                    mode: " "
                            )
                        ),
                ])
        ]
    }
}
