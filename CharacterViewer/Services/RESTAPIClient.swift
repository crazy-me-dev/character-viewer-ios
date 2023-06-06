//
//  RESTAPIClient.swift
//  CharacterViewer
//
//  Created by Daniel Song on 6/5/23.
//

import Foundation

struct TopicsListAPIResponse: Decodable {
    var RelatedTopics: [RelatedTopic]
}

func fetchTopics(completed: @escaping (_ topics: [RelatedTopic]?, _ error: Error? ) -> Void) {
    
    guard let apiUrlString: String = Bundle.main.infoDictionary?["API_URL"] as? String else { return }
    guard let apiURL = URL(string: apiUrlString) else { return }
    
    let task = URLSession.shared.dataTask(with: apiURL) { data, response, error in
        
        let decoder = JSONDecoder()
        
        if let data = data {
            do {
                let decodedResponse = try decoder.decode(TopicsListAPIResponse.self, from: data)
                completed(decodedResponse.RelatedTopics, nil)
            } catch {
                completed(nil, error)
            }
        }
    }
    
    task.resume()
    
}
