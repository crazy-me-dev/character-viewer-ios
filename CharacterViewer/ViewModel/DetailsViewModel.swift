//
//  ListViewModel.swift
//  CharacterViewer
//
//  Created by Daniel Song on 6/5/23.
//

import Foundation

class DetailsViewModel {
    var topic: Observable<RelatedTopic>
    
    init(topic: Observable<RelatedTopic>) {
        self.topic = topic
    }
}
