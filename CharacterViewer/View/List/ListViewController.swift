//
//  ListViewController.swift
//  CharacterViewer
//
//  Created by Daniel Song on 6/5/23.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var textFieldSearch: UITextField!
    @IBOutlet weak var tableViewList: UITableView!
    
    private var viewModel = ListViewModel()
    
    private var selectedTopic: RelatedTopic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.topicsLoaded.observe { value in
            if (value && self.viewModel.filteredTopics.value.count > 0) {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    if (UIDevice.current.userInterfaceIdiom == .pad) {
                        self.tableViewList.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .top)
                        self.selectedTopic = self.viewModel.filteredTopics.value[0]
                        self.showSelectedDetailsViewController()
                    }
                }
            }
        }
        self.viewModel.filteredTopics.observe {  topics in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.tableViewList.reloadData()
            }
        }
        self.viewModel.loadAllTopics()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "sid-details") {
            let detailsController = segue.destination as! DetailsViewController
            detailsController.viewModel = DetailsViewModel(topic: Observable(self.selectedTopic))
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.filteredTopics.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell") as! TopicCell
        
        let topic = self.viewModel.filteredTopics.value[indexPath.row]
        
        cell.labelCharacterName.text = topic.characterName
        cell.labelCharacterDescription.text = topic.characterDescription
        
        let keyword = self.textFieldSearch.text ?? ""
        if (keyword != "") {
            cell.labelCharacterName.highlight(searchedText: keyword)
            cell.labelCharacterDescription.highlight(searchedText: keyword)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (UIDevice.current.userInterfaceIdiom != .pad) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        self.selectedTopic = self.viewModel.filteredTopics.value[indexPath.row]
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            self.showSelectedDetailsViewController()
        } else {
            self.performSegue(withIdentifier: "sid-details", sender: nil)
        }
    }
    
    @IBAction func onEditingChangedOnSearchField(_ sender: Any) {
        self.viewModel.filterByKeyword(self.textFieldSearch.text ?? "")
    }
    
    private func showSelectedDetailsViewController() {
        let detailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.viewModel = DetailsViewModel(topic: Observable(self.selectedTopic))
        self.splitViewController?.showDetailViewController(detailsViewController, sender: nil)
    }
    
}
