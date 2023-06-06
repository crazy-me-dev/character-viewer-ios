//
//  DetailsViewController.swift
//  CharacterViewer
//
//  Created by Daniel Song on 6/5/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var viewModel: DetailsViewModel!

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelCharacterTitle: UILabel!
    
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var activityIndicatorImageLoader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.hidesBackButton = true
        
        if (self.viewModel == nil) {
            return
        }
        
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            self.buttonBack.isHidden = true
        }
        self.configure(with: self.viewModel)
    }
    
    func configure(with viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        
        self.labelTitle.text = self.viewModel.topic.value.characterName
        self.labelCharacterTitle.text = self.viewModel.topic.value.characterName
        self.labelDescription.text = self.viewModel.topic.value.characterDescription
        
        let imageUrl = self.viewModel.topic.value.Icon.fullURL
        if (imageUrl == "") {
            self.activityIndicatorImageLoader.stopAnimating()
            self.imageViewIcon.image = UIImage(named: "img_placeholder")
        } else {
            self.imageViewIcon.showImage(fromLink: self.viewModel.topic.value.Icon.fullURL) { [weak self] in
                guard let self = self else { return }
                self.activityIndicatorImageLoader.stopAnimating()
            }
        }
    }

    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
