//
//  Setting.swift
//  Setting Screen Project
//
//  Created by Alikhan Tuxubayev on 26.01.2022.
//

import UIKit

struct Section {
    let options: [SettingsOption]
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let mode: String?
    var isOn: Bool? = nil
    var notificationBackgroundColor: UIColor? = nil
    var notificationNum: String? = nil
    var typeCell: SettingsType
}

enum SettingsType {
    case staticCell
    case switchCell
    case notificationCell
}
