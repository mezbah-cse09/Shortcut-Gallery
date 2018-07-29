//
//  UIViewControllerExtensionTests.swift
//  Shortcuts GalleryTests
//
//  Created by Marco Capano on 29/07/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import XCTest

class UIViewControllerExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    @objc func foo() {
        //
    }
    
    func testGoLargeTitle() {
        let vc = UIViewController()
        let nav = UINavigationController(rootViewController: vc)
        vc.title = ""
        
        vc.goLargeTitle(text: "large title")
        XCTAssertEqual(vc.title, "large title")
        XCTAssertEqual(vc.navigationItem.largeTitleDisplayMode, .always)
        XCTAssertEqual(nav.navigationBar.prefersLargeTitles, true)
    }
    
    func testAddBarButtonItem() {
        let vc = UIViewController()
        let _ = UINavigationController(rootViewController: vc)
        
        vc.navigationItem.leftBarButtonItems = nil
        XCTAssert(vc.navigationItem.leftBarButtonItem == nil)
        
        vc.navigationItem.rightBarButtonItems = nil
        XCTAssert(vc.navigationItem.rightBarButtonItems == nil)

        let leftButton = UIButton(type: .system)
        let rightButton = UIButton(type: .roundedRect)
        
        vc.add(button: leftButton, position: .left, selector: #selector(foo))
        vc.add(button: rightButton, position: .right, selector: #selector(foo))
        
        XCTAssert(vc.navigationItem.leftBarButtonItems?.count == 1)
        XCTAssertNotNil(vc.navigationItem.leftBarButtonItems)
        
        XCTAssert(vc.navigationItem.rightBarButtonItems?.count == 1)
        XCTAssertNotNil(vc.navigationItem.rightBarButtonItems)
    }
    
}
