//
//  SettingViewModel.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 29/04/22.
//

import Foundation

class SettingViewModel {
    var selectedOrder = UserDefaultManager.shared.getFetchOrder()
    var orders = CoinOrder.allCases
}
