//
//  ListViewModel.swift
//  CharacterViewer
//
//  Created by Daniel Song on 6/5/23.
//

import Foundation

class ListViewModel {
    var relatedTopics = Observable([RelatedTopic]())
    var filteredTopics = Observable([RelatedTopic]())
    var apiError: String?
    var topicsLoading = Observable(false)
    var topicsLoaded = Observable(false)
    
    func loadAllTopics() {
        self.topicsLoading.value = true
        fetchTopics { [weak self] topics, error in
            guard let self = self else { return }
            self.topicsLoading.value = false
            self.apiError = error?.localizedDescription
            if let topics = topics {
                self.relatedTopics.value = topics
                self.filteredTopics.value = topics
                self.topicsLoaded.value = true
            }
        }
    }
    
    func filterByKeyword(_ keyword: String) {
        if (keyword == "") {
            self.filteredTopics.value = self.relatedTopics.value
        } else {
            let filtered = self.relatedTopics.value.filter { topic in
                return topic.Text.lowercased().contains(keyword.lowercased())
            }
                
            self.filteredTopics.value = filtered
        }
    }
}
