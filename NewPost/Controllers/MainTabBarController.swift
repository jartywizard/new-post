    //
//  MainTabBarController.swift
//  NewPost
//
//  Created by Joseph Clinch on 4/2/19.
//  Copyright © 2019 Joseph Clinch. All rights reserved.
//

import UIKit
    
class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
        
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            
        let index = viewControllers?.index(of: viewController)
        if index == 2 {
            
            let layout = UICollectionViewFlowLayout()
            let addPostController = AddPostController(collectionViewLayout: layout)
            let navController = UINavigationController(rootViewController: addPostController)
            
            present(navController, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        self.tabBar.backgroundColor = .white
        
        setUpViewControllers()
        
    }
        
    func setUpViewControllers() {
        //home
        let homeNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: HomeController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        //jartyFeed
        let FeedNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "feed_unselected"), selectedImage: #imageLiteral(resourceName: "feed_selected"), rootViewController: FeedController(collectionViewLayout: UICollectionViewFlowLayout()))
            
        let plusNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "add_post"), selectedImage: #imageLiteral(resourceName: "add_post"))
            
        let notificationsNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "notifications_unselected"), selectedImage: #imageLiteral(resourceName: "notifications_selected"), rootViewController: NotificationsController(collectionViewLayout: UICollectionViewFlowLayout()))

        let layout = UICollectionViewFlowLayout()
        let settingsController = SettingsController(collectionViewLayout: layout)
        
        let settingsNavController = UINavigationController(rootViewController: settingsController)
            
            
        // tabBarItems are the images in the tab bar at the bottom!!
        // tabBarItem.image is the image by default
        // tabBaritem.selectedImage is the image when you're actually on that page
            
        settingsNavController.tabBarItem.image = #imageLiteral(resourceName: "settings_unselected") // typed in "settings_unselected" to get this, that's the filename it's under in Assets
        settingsNavController.tabBarItem.selectedImage = #imageLiteral(resourceName: "settings_selected") // same here but with "settings_selected"
            
        tabBar.tintColor = UIColor.pozzyPink()
            
        viewControllers = [homeNavController,
                            FeedNavController,
                            plusNavController,
                            notificationsNavController,
                            settingsNavController]
        
        //modify tab bar item insets
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
    }
        
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController{
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        
        return navController
    }
}
