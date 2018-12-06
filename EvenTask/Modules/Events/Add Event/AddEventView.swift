//
//  EventsListView.swift
//  Archtrials
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

class AddEventView: BaseView {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var prioritySlider: UISlider!
    @IBOutlet weak var isPermanentSwitch: UISwitch!

    var viewModel: AddEventViewModel!
    
    override func initialize() {
        titleField.text = ""
        descriptionField.text = ""
        prioritySlider.value = 0
        isPermanentSwitch.isOn = false
    }
    
    override func bind() {
        viewModel = AddEventViewModel(cache: cache, router: router, network: network, location: location)
        titleField.bind(with: viewModel.title)
        descriptionField.bind(with: viewModel.description)
        prioritySlider.bind(with: viewModel.priority)
        isPermanentSwitch.bind(with: viewModel.permanent)
    }
    
    @IBAction func addEventAction(_ sender: Any) {
        viewModel.addEvent()
    }
}
