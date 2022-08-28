//
//  PicsumModel.swift
//  Picsum
//
//  Created by Admin on 26/08/22.
//

import Foundation

struct PicsumModel: Decodable {
    var id          : String? = nil
    var author      : String? = nil
    var width       : Int?    = nil
    var height      : Int?    = nil
    var url         : String? = nil
    var downloadUrl : String? = nil

    enum CodingKeys: String, CodingKey {

      case id          = "id"
      case author      = "author"
      case width       = "width"
      case height      = "height"
      case url         = "url"
      case downloadUrl = "download_url"
    
    }
    
}
