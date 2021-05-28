//
//  CashRegisterTests.swift
//  CashRegisterTests
//
//  Created by nhatnt on 28/05/2021.
//

import XCTest
@testable import CashRegister

class CashRegister {
    var availableFunds: Decimal
    var transactionTotal: Decimal = 0
    
    init(availableFunds: Decimal) {
        self.availableFunds = availableFunds
    }
    
    func addItem(_ cost: Decimal) {
        self.transactionTotal += cost
    }
}

class CashRegisterTests: XCTestCase {
    var availableFunds: Decimal!
    var sut: CashRegister!
    var itemCost: Decimal!

    override func setUp() {
        super.setUp()
        availableFunds = Decimal(10)
        sut = CashRegister(availableFunds: availableFunds)
        itemCost = 42
    }
    
    override func tearDown() {
        availableFunds = nil
        sut = nil
        itemCost = nil
        super.tearDown()
    }
    
    func testInitAvailableFuns_setsAvailableFunds() {
        //given
        //when; sut stand for system under test
        //then
        XCTAssertEqual(sut.availableFunds, availableFunds)
    }
    
    func testAddItem_oneItem_addsCostToTransactionTotal() {
        //given
        //when
        sut.addItem(itemCost)
    
        //the
        XCTAssertEqual(sut.transactionTotal, itemCost)
    }
    
    func testAddItem_twoItems_addsCostsToTransactionTotal() {
        //given
        let itemCost2 = Decimal(20)
        let expectedTotal = itemCost + itemCost2
        
        //when
        sut.addItem(itemCost)
        sut.addItem(itemCost2)
        
        //then
        XCTAssertEqual(sut.transactionTotal, expectedTotal)
    }
    
    
}
