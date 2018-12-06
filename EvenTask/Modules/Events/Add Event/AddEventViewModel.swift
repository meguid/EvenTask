//
//  AddEventViewModel.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation
import SimpleTwoWayBinding

class AddEventViewModel: BaseViewModel {
    
    var title: Observable<String> = Observable()
    var description: Observable<String> = Observable()
    var priority: Observable<Float> = Observable()
    var permanent: Observable<Bool> = Observable()

    func addEvent() {
        AddEventInteractor(title.value, description.value, priority.value, permanent.value, base: baseInteractor).execute(Event()).then { (_) in
            self.router.pop()
        }.catch { (error) in
            self.router.alert(title: "Warning", message: error.localizedDescription, actions: [("ok", .default)])
        }
    }
}
