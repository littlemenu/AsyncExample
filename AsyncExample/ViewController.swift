//
//  ViewController.swift
//  AsyncExample
//
//  Created by 정재훈 on 01/08/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpDownloadButton(_ sender: UIButton) {
        // 이미지 다운로드 -> 이미지 뷰에 셋팅
        // https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg
        
        guard let imageURL: URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg") else {
            return
        }
        
        OperationQueue().addOperation {
            let imageData: Data = try! Data.init(contentsOf: imageURL)
            guard let image: UIImage = UIImage(data: imageData) else {
                return
            }
            
            OperationQueue.main.addOperation {
                self.imageView.image = image
            }
        }
    }
}
