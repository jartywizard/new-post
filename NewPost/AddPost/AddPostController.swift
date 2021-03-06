//
//  AddPostController.swift
//  NewPost
//
//  Created by Joseph Clinch on 4/2/19.
//  Copyright © 2019 Joseph Clinch. All rights reserved.
//

import UIKit

class AddPostController: UICollectionViewController, UICollectionViewDelegateFlowLayout, AddInfoSectionDelegate, AddPhotoHeaderDelegate {
    
    func didTapAddPhoto() {
        let photoSelectorController = PhotoSelectorController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(photoSelectorController, animated: true)
    }
    
    func showDatePicker() {
        view.addSubview(datePicker)
        datePicker.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func removeDatePicker() {
        datePicker.removeFromSuperview()
    }
    
    let headerId = "headerId"
    let cellId = "cellId"
    
    let newPostHeader: UILabel = {
        let label = UILabel()
        label.text = "New Post"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.timeZone = NSTimeZone.local
        picker.backgroundColor = .white
        picker.layer.cornerRadius = 5.0
        picker.layer.shadowOpacity = 0.1
        picker.addTarget(self, action: #selector(didChangeDate), for: .valueChanged)
        return picker
    }()
    
    var infoSection: AddInfoSection = AddInfoSection()
    
    var mySelectedDate: String?
    
    @objc func didChangeDate(sender: UIDatePicker) {
        // date format
        let myDateFormatter: DateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "MM/dd/yyyy hh:mm"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "EEEE, MMM dd, yyyy 'at' HH:mm a"
        
        // get the date string applied date format
        mySelectedDate = dateFormatterPrint.string(from: sender.date) as String
        collectionView?.reloadData()
        showDatePicker()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        setupNavigationBar()
        
        collectionView?.backgroundColor = .white
        
        view.autoresizingMask = .flexibleHeight
        
        
        collectionView?.isScrollEnabled = true
        collectionView?.bounces = true
        collectionView?.alwaysBounceVertical = true
        collectionView?.keyboardDismissMode = .interactive
        collectionView?.clipsToBounds = false
        
        collectionView?.register(AddPhotoHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(AddInfoSection.self, forCellWithReuseIdentifier: cellId)
    }
    
    var header: AddPhotoHeader?
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 175)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AddPhotoHeader
        header.delegate = self
        
        return header
        
    }
    
    var cell: AddInfoSection?
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AddInfoSection
        
        cell.dateTextField.text = mySelectedDate
        
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    private var collectionViewFlowLayout: UICollectionViewFlowLayout {
        return collectionViewLayout as! UICollectionViewFlowLayout
    }
    
    fileprivate func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "x_out"), style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.titleView = newPostHeader
        UINavigationBar.appearance().barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
        UINavigationBar.appearance().barTintColor = UIColor.white
    }
    
}

