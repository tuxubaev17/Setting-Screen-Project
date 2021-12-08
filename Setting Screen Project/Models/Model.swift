//
//  Model.swift
//  Setting Screen Project
//
//  Created by Alikhan Tuxubayev on 08.12.2021.
//

import UIKit

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SwitchSettingsOption)
    case notificationCell(model: NotificationSettingsOption)
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

struct Section {
    let options: [SettingsOptionType]
}
