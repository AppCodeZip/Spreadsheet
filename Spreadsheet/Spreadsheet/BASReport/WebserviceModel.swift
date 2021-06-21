//
//  WebserviceModel.swift
//  Spreadsheet
//
//  Created by Sushil Rathaur on 21/06/21.
//  Copyright © 2021 MSIL. All rights reserved.
//

import Foundation
struct RootClass : Decodable {
    let data : [SampleData]?
    let message : String?
    let result : Int?
 }

  struct SampleData : Decodable {
      let MONDAY : String?
      let TUESDAY : String?
      let WEDNSDAY : String?
      let THURSDAY : String?
      let FRIDAY : String?
      let SATURDAY : String?
      let SUNDAY : String?
      let PERIOD : String?

  }
