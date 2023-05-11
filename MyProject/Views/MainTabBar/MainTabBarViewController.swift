//
//  MainTabBarViewController.swift
//  MyProject
//
//  Created by admin on 12/12/22.
//

import UIKit
import RxSwift

class MainTabBarViewController: UITabBarController {

    var backBiganin = PublishSubject<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.layer.borderWidth = 0.50
        tabBar.layer.borderColor = UIColor.clear.cgColor
        tabBar.clipsToBounds = true
         UINavigationBar.appearance().barTintColor = UIColor.brown
         UINavigationBar.appearance().titleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.white
         ]
         UITabBar.appearance().barTintColor = UIColor.brown
         UITabBar.appearance().tintColor = .white
         UITabBar.appearance().isTranslucent = true
         UITabBar.appearance().backgroundColor = .white
         UITabBar.appearance().backgroundImage = nil
         UITabBar.appearance().layer.backgroundColor = UIColor.white.cgColor
         UITabBar.appearance().shadowImage = nil
       
    }
    private var index = 0
    override var selectedViewController: UIViewController? {
        didSet{
            if index == selectedIndex {
                backBiganin.onNext(index)
            }
            index = selectedIndex
        }
    }
    
}
