//
//  HomeViewModelTest.swift
//  AssessmentJehnsenTests
//
//  Created by Jehnsen Hirena Kane on 02/05/22.
//

import Quick
import Nimble
@testable import AssessmentJehnsen

class HomeViewModelTest: QuickSpec {
    
    var viewModel: HomeViewModel!
    var service: MockCoinService!
    
    override func spec() {
        describe("Test Service") {
            beforeEach {
                self.service = MockCoinService()
                self.viewModel = HomeViewModel(service: self.service)
            }
            
            it("Success get coin list") {
                let response = MockResponse().coinListResponse
                let data =  response.data(using: .utf8)!
                self.service.response = try? JSONSerialization.jsonObject(
                    with: data,
                    options: []
                )
                self.viewModel.fetchCoins()
                // Assert that coin succesfully fetch 15 first data
                expect(self.viewModel.coinData.count).to(equal(15))
            }
        }
    }
}
