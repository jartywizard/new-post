//
//  AddPhotoHeader.swift
//  NewPost
//
//  Created by Joseph Clinch on 4/2/19.
//  Copyright © 2019 Joseph Clinch. All rights reserved.
//

import UIKit

protocol AddPhotoHeaderDelegate {
    func didTapAddPhoto()
    
}

class AddPhotoHeader: UICollectionViewCell {
    
    var delegate: AddPhotoHeaderDelegate?
    
    var selectedImage: UIImage? {
        didSet {
            DispatchQueue.main.async {
                self.imageView.image = (self.selectedImage)!
                print("This is the selectedImage:", (self.selectedImage)!)
            }
            imageView.backgroundColor = .white
            //            imageText.text = ""
            //            addButton.setImage(nil, for: .normal)
        }
    }
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.rgb(red: 234, green: 246, blue: 246)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "add_photo"), for: .normal)
        button.addTarget(self, action: #selector(handleAddPhoto), for: .touchUpInside)
        return button
    }()
    
    let imageText: UILabel = {
        let label = UILabel()
        label.text = "Add Photo\n(optional)"
        label.textColor = UIColor.rgb(red: 161, green: 161, blue: 161)
        label.numberOfLines = 2
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    @objc func handleAddPhoto() {
        print ("Present AddPhotoController +")
        delegate?.didTapAddPhoto()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(addButton)
        addSubview(imageText)
        
        if #available(iOS 11.0, *){
            imageView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.width, height: 175)
        } else {
            // Fallback on earlier OS?
        }
        addButton.anchor(top: imageView.topAnchor, left: imageView.leftAnchor, bottom: nil, right: imageView.rightAnchor, paddingTop: 25, paddingLeft: (imageView.bounds.size.width - addButton.bounds.size.width) / 2, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        imageText.anchor(top: nil, left: imageView.leftAnchor, bottom: imageView.bottomAnchor, right: imageView.rightAnchor, paddingTop: 0, paddingLeft: (imageView.bounds.size.width - addButton.bounds.size.width) / 2, paddingBottom: 25, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
