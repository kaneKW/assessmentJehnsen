//
//  HomeViewModel.swift
//  AssessmentJehnsen
//
//  Created by Jehnsen Hirena Kane on 22/04/22.
//

import Foundation

class HomeViewModel {
    let service: CoinServiceProtocol
    var coinData = [CoinGeckoModel]()
    var fetchOrder: CoinOrder = UserDefaultManager.shared.getFetchOrder() {
        didSet {
            UserDefaultManager.shared.saveFetchOrder(order: fetchOrder)
        }
    }
    var currencyInUSD: Bool = true
    var page = 1
    
    var currentCount: Int {
      return coinData.count
    }
    
    var onFetchCompleted: ((_ newIndexPathsToReload: [IndexPath]?) -> Void)?
    var onFinishFetchCoin: ((_ message: String?) -> Void)?
    
    init(service: CoinServiceProtocol) {
        self.service = service
    }
    
    func fetchCoins() {
        service.fetchCoins(order: fetchOrder, page: page) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                if self.page == 0 {
                    self.coinData = response
                    self.onFetchCompleted?(.none)
                } else {
                    let indexPathsToReload = self.calculateIndexPathsToReload(from: response)
                    self.coinData += response
                    self.onFetchCompleted?(indexPathsToReload)
                }
                self.page += 1
                self.onFinishFetchCoin?(nil)
            case .failure(let error):
                self.onFinishFetchCoin?(error.localizedDescription)
            }
        }
    }
    
    private func calculateIndexPathsToReload(from newData: [CoinGeckoModel]) -> [IndexPath] {
      let startIndex = coinData.count - newData.count
      let endIndex = startIndex + newData.count
      return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
}
