//
//  ViewController.swift
//  Setting Screen Project
//
//  Created by Alikhan Tuxubayev on 08.12.2021.
//

import UIKit

class ViewController: UIViewController {

    var model: SettingModel?
    
    private var settingView: SettingView? {
        guard isViewLoaded else { return nil }
        return view as? SettingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = SettingView()
        model = SettingModel()
        
        title = "Настройки"
        
        configureView()
    }
}

private extension ViewController {
    func configureView() {
        guard let models = model?.getSettingCell() else { return }
        settingView?.configureView(with: models)
    }
}



