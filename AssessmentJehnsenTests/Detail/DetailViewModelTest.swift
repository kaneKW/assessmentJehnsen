//
//  DetailViewModelTest.swift
//  AssessmentJehnsenTests
//
//  Created by Jehnsen Hirena Kane on 02/05/22.
//

import Quick
import Nimble
@testable import AssessmentJehnsen

class DetailViewModelTest: QuickSpec {
    
    var viewModel: DetailViewModel!
    var service: MockCoinService!
    
    override func spec() {
        describe("Test Service") {
            beforeEach {
                self.service = MockCoinService()
                self.viewModel = DetailViewModel(service: self.service, coinId: "bitcoin")
            }
            
            it("Success get coin detail") {
                let response = MockResponse().coinDetailResponse
                let data =  response.data(using: .utf8)!
                self.service.response = try? JSONSerialization.jsonObject(
                    with: data,
                    options: []
                )
                self.viewModel.getCoinDetail()
                // Assert that coin succesfully fetch coin detail
                expect(self.viewModel.coinDetailData).toNotEventually(beNil())
            }
        }
    }
}
