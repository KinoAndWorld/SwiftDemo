//
//  RSwiftDemoController.swift
//  Swift-Project-Demo
//
//  Created by 陈文杰 on 2021/12/20.
//

import UIKit

class RSwiftDemoController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let color = R.color.someColor()
        self.view.backgroundColor = color
        
        let img = R.image.icons8Infographic2()
        self.view.addSubview({
            let imageV = UIImageView(image: img)
            imageV.frame = CGRect(x: 100, y: 200, width: 40, height: 40)
            return imageV
        }())
        
//        let svgaFile = R.file.share_opt_starSvga()
        
        let font = R.font.yyRegular(size: 20)
        self.view.addSubview({
            let label = UILabel()
            label.frame = CGRect(x: 60, y: 250, width: 130, height: 30)
            label.font = font
            label.text = "Font Test - 1001"
            return label
        }())
    }
}
