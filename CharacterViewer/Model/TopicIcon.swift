//
//  RelatedTopic.swift
//  CharacterViewer
//
//  Created by Daniel Song on 6/5/23.
//

import Foundation

class TopicIcon: Codable {
    var Height: String
    var Width: String
    var URL: String
    
    var fullURL: String {
        get {
            if (URL != "") {
                return "https://duckduckgo.com" + URL
            } else {
                return ""
            }
        }
    }
}
