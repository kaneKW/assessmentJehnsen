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
                
                expect(self.viewModel.coinData.count).to(equal(15))
            }
        }
        
        
        //    override func spec() {
        //        describe("test Dependency Service View Model") {
        //            beforeEach {
        //                self.viewModel = nil
        //                self.service = nil
        //            }
        //
        //            it("sets without service instance") {
        //                self.viewModel = KGCalculatorViewModel(service: KGMockServiceCalculatorPage())
        //                self.viewModel.service = nil
        //                expect(self.viewModel.service).to(beNil())
        //            }
        //
        //            it("sets with service instance") {
        //                self.service = KGMockServiceCalculatorPage()
        //                self.viewModel = KGCalculatorViewModel(service: self.service)
        //                expect(self.viewModel.service).toNot(beNil())
        //            }
        //        }
        //
        //        describe("test Calculator Page Api Serice") {
        //            beforeEach{
        //                self.service = KGMockServiceCalculatorPage()
        //                self.viewModel = KGCalculatorViewModel(service: self.service)
        //            }
        //
        //            it("on Get General Setting Response Success") {
        //                let response = KGMockDataService.getGeneralSettingData.responseSuccess
        //                let data = response.data(using: .utf8)!
        //                self.service.dataGeneralSetting = try? JSONSerialization.jsonObject(with: data, options: [])
        //                self.viewModel.getCalculatorBaseData()
        //                expect(self.service.isGeneralSettingCalculatorCalled).to(equal(true))
        //
        //                // Installment
        //                expect(self.viewModel.dataGeneralSetting?.installment?.yearly_insurance_fee).to(equal(1.2))
        //                expect(self.viewModel.dataGeneralSetting?.installment?.admin_fee).to(equal(0))
        //                expect(self.viewModel.dataGeneralSetting?.installment?.yearly_interest).to(equal(12))
        //                expect(self.viewModel.dataGeneralSetting?.installment?.salary_percentage).to(equal(35))
        //                expect(self.viewModel.dataGeneralSetting?.installment?.limit_installment).to(equal(2))
        //                expect(self.viewModel.dataGeneralSetting?.installment?.black_out_date_fee).to(equal(1))
        //                expect(self.viewModel.dataGeneralSetting?.installment?.min_loan_allowed).to(equal(100000))
        //                expect(self.viewModel.dataGeneralSetting?.installment?.max_loan_allowed).to(equal(-1))
        //
        //                // Ewa
        //                expect(self.viewModel.dataGeneralSetting?.salary_advance?.yearly_insurance_fee).to(equal(0))
        //                expect(self.viewModel.dataGeneralSetting?.salary_advance?.origination_fee).to(equal(2))
        //                expect(self.viewModel.dataGeneralSetting?.salary_advance?.admin_fee).to(equal(0))
        //                expect(self.viewModel.dataGeneralSetting?.salary_advance?.yearly_interest).to(equal(0))
        //                expect(self.viewModel.dataGeneralSetting?.salary_advance?.salary_percentage).to(equal(70))
        //            }
        //
        //            it("on Error Get Calculator Setting") {
        //                let response = JSONResponseMock.APIResponse.Error.statusCode500
        //                let data = response.data(using: .utf8)!
        //                // Setup mock response to service
        //                self.service.dataGeneralSetting = try? JSONSerialization.jsonObject(with: data, options: [])
        //                self.viewModel.getCalculatorBaseData()
        //
        //                // Assert on value on viewmodel
        //                expect(self.service.isGeneralSettingCalculatorCalled).to(equal(true))
        //                expect(self.viewModel.dataGeneralSetting).to(beNil())
        //            }
        //        }
        //    }
    }
}
