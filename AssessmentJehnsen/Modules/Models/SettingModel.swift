//
//  SettingModel.swift
//  AssessmentJehnsen
//
//  Created by Macbook on 30/04/22.
//

import Foundation

enum CoinOrder: String, CaseIterable {
    case market_cap_desc, market_cap_asc, gecko_desc, gecko_asc,  volume_asc, volume_desc, id_asc, id_desc
    
    var title: String {
        switch self {
        case .market_cap_desc:
            return "Market Cap Descending".localized()
        case .market_cap_asc:
            return "Market Cap Ascending".localized()
        case .gecko_desc:
            return "Gecko Descending".localized()
        case .gecko_asc:
            return "Gecko Ascending".localized()
        case .volume_asc:
            return "Volume Ascending".localized()
        case .volume_desc:
            return "Volume Descending".localized()
        case .id_asc:
            return "ID Ascending".localized()
        case .id_desc:
            return "ID Descending".localized()
        }
    }
}
