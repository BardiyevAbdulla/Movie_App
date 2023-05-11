//
//  MainTabBarCoordinator.swift
//  MyProject
//
//  Created by admin on 12/12/22.
//

import UIKit
import Network
import RxSwift

class MainTabBarCoordinator: BaseCoordinator {
    
    var viewControllers = [UINavigationController]()
    
    let cotroller = MainTabBarViewController()
    
    let disposeBag = DisposeBag()
    
    override func start() {
       
        subscribeEvent()
        
        configureCoordinators(model: .popular)
        configureCoordinators(model: .topRated)
        configureCoordinators(model: .upcoming)
        
        cotroller.setViewControllers(viewControllers, animated: false)
        navigationController.viewControllers = [cotroller]
        
       let sessioonService = SessionService()
        sessioonService.navigationController = navigationController
        sessioonService.monitorNetwork()
    }
    func subscribeEvent() {
        cotroller.backBiganin.subscribe { index in
            self.childCoordinators[index].removeCoordinators()
            
            if let view = self.childCoordinators[index].navigationController.viewControllers[0] as? MoviesView{
                view.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
            }
        }.disposed(by: disposeBag)
    }
    
    func configureCoordinators(model: TypeMode){
        let viewCoordinator = MoviesViewCoordinator()
        
        viewCoordinator.navigationController = createNavController(model: model)
        viewCoordinator.loadViews(model: model)
        start(coordinator: viewCoordinator)
        viewControllers += [viewCoordinator.navigationController]
        
    }
    
    func createNavController(model: TypeMode) -> UINavigationController {
        let navController = UINavigationController()
        let tabBarItem = UITabBarItem(title: model.title, image: model.image, selectedImage: model.image)
        navController.tabBarItem = tabBarItem
        return navController
    }
}


enum TypeMode{
    case popular
    case topRated
    case upcoming
    
    var title: String {
        switch self {
        case .popular:
            return "Popular"
        case .topRated:
            return "Top Rated"
        case .upcoming:
            return "Upcoming"
        }
    }
    var image: UIImage? {
        switch self {
        case .popular:
            return UIImage(named: "popular")?.withRenderingMode(.alwaysTemplate)
        case .topRated:
            return UIImage(named: "topRated")?.withRenderingMode(.alwaysTemplate)
        case .upcoming:
            return UIImage(named: "upcoming")?.withRenderingMode(.alwaysTemplate)
        }
    }
}
