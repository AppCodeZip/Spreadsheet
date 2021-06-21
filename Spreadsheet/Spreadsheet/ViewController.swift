//
//  ViewController.swift
//  Spreadsheet
//
//  Created by Sushil Rathaur on 21/06/21.
//  Copyright © 2021 MSIL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var basReport: BASCustomReport!
    //Variables
    var sampleData = [SampleData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weekly Time Table For Every Hour"
        initialSetup()   
    }
    func initialSetup() {
        var HeaderDict = OrderedDictionary<String, Bool>()
        HeaderDict["PERIOD"] = false ;  HeaderDict["MONDAY"] = false ;HeaderDict["TUESDAY"] = false ;HeaderDict["WEDNSDAY"] = false ;HeaderDict["THURSDAY"] = false; HeaderDict["FRIDAY"] = false;HeaderDict["SATURDAY"] = false;HeaderDict["SUNDAY"] = false
        self.basReport.arrGHeader = HeaderDict
        setData()
    }
    func setData() {
        if let path = Bundle.main.path(forResource: "Example", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let tempData  = try JSONDecoder().decode(RootClass.self, from: data )
                self.sampleData = tempData.data!
                
                self.basReport.arrGKeys = [("PERIOD", .left,nil, nil) , ("MONDAY",.center,90.0 , nil) , ("TUESDAY",.center,90.0 , nil) , ("WEDNSDAY",.center,100.0 , nil) , ("THURSDAY",.center,90.0 , nil) , ("FRIDAY",.center,90.0 , nil) , ("SATURDAY",.center,90.0 , nil),("SUNDAY",.center,90.0 , nil) ]
                
                if basReport.arrGHeader.count == basReport.arrGKeys.count{
                    self.basReport.arrReportSummaryDict = arryToDict(array: self.sampleData)
                }
            } catch {
                // handle error
            }
        }
        
    }
}

