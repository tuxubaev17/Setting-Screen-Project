//
//  SettingsOptionType.swift
//  Setting Screen Project
//
//  Created by Alikhan Tuxubayev on 09.12.2021.
//

import UIKit

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SwitchSettingsOption)
    case notificationCell(model: NotificationSettingsOption)
}
