//
//  AddInfoSection.swift
//  NewPost
//
//  Created by Joseph Clinch on 4/2/19.
//  Copyright © 2019 Joseph Clinch. All rights reserved.
//

import UIKit

protocol AddInfoSectionDelegate {
    func showDatePicker()
    func removeDatePicker()
}

class AddInfoSection: UICollectionViewCell {
    
    var delegate: AddInfoSectionDelegate?
    
    var controller: AddPostController?
    
    lazy var titleTextView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .white
        tv.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.isScrollEnabled = false
        return tv
    }()
    
    fileprivate let titlePlaceholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let titleTextViewUnderLine: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.rgb(red: 161, green: 161, blue: 161)
        return iv
    }()
    
    lazy var dateTextField: UITextField = {
        let tf = UITextField()
        tf.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        //        tf.text = ""
        tf.placeholder = " Date"
        tf.borderStyle = .none
        tf.delegate = self
        tf.inputView = UIView(frame: CGRect.zero)
        return tf
    }()
    
    let dateTextFieldUnderLine: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.rgb(red: 161, green: 161, blue: 161)
        return iv
    }()
    
    lazy var locationTextView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .white
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textColor = UIColor.rgb(red: 113, green: 113, blue: 113)
        tv.delegate = self
        tv.isScrollEnabled = false
        return tv
    }()
    
    fileprivate let locationPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let locationTextViewUnderLine: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.rgb(red: 161, green: 161, blue: 161)
        return iv
    }()
    
    let privacyLabel: UILabel = {
        let label = UILabel()
        label.text = "Privacy"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var descriptionTextView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .white
        tv.font = UIFont.systemFont(ofSize: 18)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.isScrollEnabled = false
        return tv
    }()
    
    fileprivate let descriptionPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Description (optional)"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let descriptionTextViewUnderLine: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.rgb(red: 161, green: 161, blue: 161)
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(titleTextView)
        addSubview(titleTextViewUnderLine)
        addSubview(titlePlaceholderLabel)
        
        addSubview(dateTextField)
        addSubview(dateTextFieldUnderLine)
        
        addSubview(locationTextView)
        addSubview(locationTextViewUnderLine)
        addSubview(locationPlaceholderLabel)
        
        addSubview(privacyLabel)
        
        addSubview(descriptionTextView)
        addSubview(descriptionPlaceholderLabel)
        addSubview(descriptionTextViewUnderLine)
        
        titleTextView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 24, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 0)
        titleTextViewUnderLine.anchor(top: titleTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 1)
        titlePlaceholderLabel.anchor(top: titleTextView.topAnchor, left: titleTextView.leftAnchor, bottom: titleTextView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        dateTextField.anchor(top: titleTextViewUnderLine.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 40, paddingBottom: 0, paddingRight: 24, width: 0, height: 0)
        dateTextFieldUnderLine.anchor(top: dateTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 40, paddingBottom: 0, paddingRight: 24, width: 0, height: 1)
        
        locationTextView.anchor(top: dateTextFieldUnderLine.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 40, paddingBottom: 0, paddingRight: 24, width: 0, height: 0)
        locationTextViewUnderLine.anchor(top: locationTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 40, paddingBottom: 0, paddingRight: 24, width: 0, height: 1)
        locationPlaceholderLabel.anchor(top: locationTextView.topAnchor, left: locationTextView.leftAnchor, bottom: locationTextView.bottomAnchor, right: nil, paddingTop: -1, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        privacyLabel.anchor(top: locationTextViewUnderLine.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 40, paddingBottom: 0, paddingRight: 0, width: 0, height: privacyLabel.font.pointSize + 2)
        
        descriptionTextView.anchor(top: privacyLabel.bottomAnchor, left: leftAnchor, bottom: descriptionTextViewUnderLine.topAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 40)
        descriptionTextViewUnderLine.anchor(top: descriptionTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 24, paddingBottom: 0, paddingRight: 24, width: 0, height: 1)
        descriptionPlaceholderLabel.anchor(top: descriptionTextView.topAnchor, left: descriptionTextView.leftAnchor, bottom: descriptionTextView.bottomAnchor, right: nil, paddingTop: -1, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTextChange() {
        titlePlaceholderLabel.isHidden = !titleTextView.text.isEmpty
        locationPlaceholderLabel.isHidden = !locationTextView.text.isEmpty
        descriptionPlaceholderLabel.isHidden = !descriptionTextView.text.isEmpty
    }
    
    let header = AddPhotoHeader()
    
}

extension AddInfoSection: UITextViewDelegate, UITextFieldDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
                //                self.frame.size.height += estimatedSize.height
            }
        }
        
        let cellRect = self.contentView.convert(self.contentView.bounds, to: UIScreen.main.coordinateSpace)
        if cellRect.maxY > UIScreen.main.bounds.maxY {
            // This is where I need to tell the screen to extend it's bounds lower when the cell gets taller
            print("cell's off screen yo")
            print("The cell's maxY is: ", cellRect.maxY)
            print("The screen's maxY is: ", UIScreen.main.bounds.maxY)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        delegate?.removeDatePicker()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.showDatePicker()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.removeDatePicker()
    }
    
    
}
