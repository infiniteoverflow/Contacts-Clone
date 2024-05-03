//
//  BaseTabBarController.swift
//  Contacts Clone
//
//  Created by Aswin Gopinathan on 29/04/24.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let favouritesViewController = FavouritesController()
        let recentsViewController = RecentsController()
        let contactsViewController = UIViewController()
        let keypadViewController = KeypadController()
        let voiceMailViewController = UIViewController()
        
        viewControllers = [
            createNavigationController(vc: favouritesViewController,
                                       title: .favourites,
                                       tabTitle: .favourites,
                                       tabIcon: .star),
            createNavigationController(vc: recentsViewController,
                                       title: .recents,
                                       tabTitle: .recents,
                                       tabIcon: .clock),
            createNavigationController(vc: contactsViewController,
                                       title: .contacts,
                                       tabTitle: .lists,
                                       tabIcon: .person),
            createNavigationController(vc: keypadViewController,
                                       title: .keypad,
                                       tabTitle: .keypad,
                                       tabIcon: .grid),
            createNavigationController(vc: voiceMailViewController,
                                       title: .voicemail,
                                       tabTitle: .voicemail,
                                       tabIcon: .voicemail)
        ]
        
        selectedIndex = 1
    }

    private func createNavigationController(vc: UIViewController,
                                            title: Tabs,
                                            tabTitle: Tabs,
                                            tabIcon: TabImages) -> UIViewController {
        vc.view.backgroundColor = .white
        
        let navVC = UINavigationController(rootViewController: vc)
        navVC.tabBarItem.title = tabTitle.rawValue
        navVC.tabBarItem.image = UIImage(systemName: tabIcon.rawValue)
        if title != .keypad {
            vc.title = title.rawValue
            navVC.navigationBar.prefersLargeTitles = true
        }
        return navVC
    }
}

