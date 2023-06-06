//
//  RelatedTopic.swift
//  CharacterViewer
//
//  Created by Daniel Song on 6/5/23.
//

import Foundation

class RelatedTopic: Codable {
    var FirstURL: String
    var Result: String
    var Text: String
    var Icon: TopicIcon
    
    var characterName: String {
        get {
            let comps = Text.components(separatedBy: " - ")
            return comps[0]
        }
    }
    
    var characterDescription: String {
        get {
            let comps = Text.components(separatedBy: " - ")
            if (comps.count > 1) {
                return comps[1]
            } else {
                return ""
            }
        }
    }
}
