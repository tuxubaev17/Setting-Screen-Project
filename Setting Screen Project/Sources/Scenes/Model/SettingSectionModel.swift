//
//  SectionModel.swift
//  Setting Screen Project
//
//  Created by Alikhan Tuxubayev on 08.12.2021.
//

import UIKit

extension Section {
    static func getSettingCell() -> [Section] {
        return [
            Section(options: [ SettingsOption(
                                title: "АвиаРежим",
                                icon: UIImage(systemName: "airplane"),
                                iconBackgroundColor: .systemOrange,
                                mode: "",
                                isOn: false,
                                typeCell: .switchCell
                                ),
                               SettingsOption(
                                title: "Wifi",
                                icon: UIImage(systemName: "wifi"),
                                iconBackgroundColor: .link,
                                mode: "Не подключен",
                                typeCell: .staticCell
                               ),
                               SettingsOption(
                                title: "Bluetooth",
                                icon: UIImage(systemName: "wifi"),
                                iconBackgroundColor: .systemGreen,
                                mode: "выкл",
                                typeCell: .staticCell
                               ),
                               SettingsOption(
                                title: "Сотовая связь",
                                icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                                iconBackgroundColor: .systemGreen,
                                mode: " ",
                                typeCell: .staticCell
                               ),
                               SettingsOption(
                                title: "Режим мода",
                                icon: UIImage(systemName: "personalhotspot"),
                                iconBackgroundColor: .systemGreen,
                                mode: " ",
                                typeCell: .staticCell
                               ),
                               SettingsOption(
                                title: "VPN",
                                icon: UIImage(systemName: "personalhotspot"),
                                iconBackgroundColor: .link,
                                mode: "",
                                isOn: false,
                                typeCell: .switchCell
                               ),
                             ]
                   ),
            Section(options: [SettingsOption(
                              title: "Уведомление",
                              icon: UIImage(systemName: "bell.badge"),
                              iconBackgroundColor: .systemRed,
                              mode: " ",
                              typeCell: .staticCell
                            ),
                              SettingsOption(
                                title: "Звуки, тактильные сигналы",
                                icon: UIImage(systemName: "speaker.wave.3"),
                                iconBackgroundColor: .systemPink,
                                mode: " ",
                               typeCell: .staticCell
                            ),
                              SettingsOption(
                                title: "Фокусирование",
                                icon: UIImage(systemName: "moon.fill"),
                                iconBackgroundColor: .systemIndigo,
                                mode: " ",
                               typeCell: .staticCell
                            ),
                              SettingsOption(
                                title: "Экранное время",
                                icon: UIImage(systemName: "hourglass"),
                                iconBackgroundColor: .systemIndigo,
                                mode: " ",
                                typeCell: .staticCell
                              ),
                            ]
                   ),
            Section(options: [SettingsOption(
                                title: "Основные",
                                icon: UIImage(systemName: "gear"),
                                iconBackgroundColor: .systemGray,
                                mode: " ",
                                notificationBackgroundColor: UIColor.systemRed,
                                notificationNum: "1",
                                typeCell: .notificationCell
                            ),
                              SettingsOption(
                                title: "Пункт управления",
                                icon: UIImage(systemName: "switch.2"),
                                iconBackgroundColor: .systemGray,
                                mode: " ",
                                typeCell: .staticCell
                              ),
                              SettingsOption(
                                title: "Экран и яркость",
                                icon: UIImage(systemName: "textformat.size"),
                                iconBackgroundColor: .systemBlue,
                                mode: " ",
                                typeCell: .staticCell
                              ),
                              SettingsOption(
                                title: "Экран Домой",
                                icon: UIImage(systemName: "checkerboard.rectangle"),
                                iconBackgroundColor: .systemBlue,
                                mode: " ",
                                typeCell: .staticCell
                              ),
                              SettingsOption(
                                title: "Универсальный доступ",
                                icon: UIImage(systemName: "figure.wave.circle.fill"),
                                iconBackgroundColor: .systemBlue,
                                mode: " ",
                                typeCell: .staticCell
                              )
                        ]
                 )
          ]
    }
}
