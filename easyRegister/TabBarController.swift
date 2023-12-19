//
//  ViewController.swift
//  easyRegister
//
//  Created by m2comm on 2023/10/17.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        
        setupTabbarLayout()
        setupTabbarItem()
        setTabBarBackgroundColor()
    
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.1840982735, green: 0.2072379291, blue: 0.2327308357, alpha: 1)
            UITabBar.appearance().tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            UITabBar.appearance().isTranslucent = true

        
        
            if #available(iOS 15.0, *) {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = #colorLiteral(red: 0.1840982735, green: 0.2072379291, blue: 0.2327308357, alpha: 1)
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
                tabBarItem.image = tabBarItem.image?.withRenderingMode(.alwaysOriginal)

                                 tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
            }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.selectedIndex = 1
        
    }
        
    func setTabBarBackgroundColor() {
        var myColor = #colorLiteral(red: 0.1840982735, green: 0.2072379291, blue: 0.2327308357, alpha: 1)
            tabBar.barTintColor = myColor
            tabBar.isTranslucent = false
        }
    
    
    private func setupTabbarLayout() {
        //tabbar 아이템의 틴트 컬러 변경
        tabBar.tintColor = .white
        
        //tabbar 컬러 변경
        tabBar.barTintColor = .yellow
        
    }
    
    private func setupTabbarItem() {
        //TabBar의 아이템 설정
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "coll") as? ViewController else { return }
        
        
//        vc.tabBarItem = UITabBarItem(
//            title: "HOME",
//            image: UIImage(named: "home"),
//            selectedImage: UIImage(named: "home")
//    )
        
        vc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 1)
        
        //photo Tab

        
        let homeViewController = categortViewController()
                
        
//        homeViewController.tabBarItem = UITabBarItem(
//            title: "Category",
////            image: UIImage(systemName: "photo"),
//            image: UIImage(named: "category"),
//            selectedImage: UIImage(named: "category")
//        )
        
        homeViewController.tabBarItem = UITabBarItem(title: "Category", image: UIImage(named: "category"), tag: 0)
        
        
        
        //search Tab
        let myViewController = MyPageViewController()
//        myViewController.tabBarItem = UITabBarItem(
//            title: "My",
//            image: UIImage(named: "my"),
//            selectedImage: UIImage(named: "my")
//        )
        
        myViewController.tabBarItem = UITabBarItem(title: "My", image: UIImage(named: "my"), tag: 2)
   
        
        viewControllers = [
            homeViewController,
            vc,
            myViewController
            
        ]
    }
}
