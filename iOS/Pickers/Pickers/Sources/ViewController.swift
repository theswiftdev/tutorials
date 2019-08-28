//
//  ViewController.swift
//  Pickers
//
//  Created by Tibor Bödecs on 2019. 08. 28..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imagePicker: ImagePicker!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imagePickerButton: UIButton!
    
    var videoPicker: VideoPicker!
    @IBOutlet weak var videoView: VideoView!
    @IBOutlet weak var videoPickerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.videoView.contentMode = .scaleAspectFill
        self.videoView.player?.isMuted = true
        self.videoView.repeat = .loop
    }

    @IBAction func imagePickerButtonTouched(_ sender: UIButton) {
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        self.imagePicker.present(from: sender)
    }
    
    @IBAction func videoPickerButtonTouched(_ sender: UIButton) {
        self.videoPicker = VideoPicker(presentationController: self, delegate: self)
        self.videoPicker.present(from: sender)
    }
}

extension ViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        guard let image = image else {
            return
        }
        self.imageView.image = image
    }
}


extension ViewController: VideoPickerDelegate {

    func didSelect(url: URL?) {
        guard let url = url else {
            return
        }
        self.videoView.url = url
        self.videoView.player?.play()
    }
}

