//
//  MoviesView.swift
//  MyProject
//
//  Created by admin on 12/12/22.
//

import UIKit
import SnapKit
import CCBottomRefreshControl

class MoviesView: UIViewController {

    var viewModel = MoviesViewViewModel()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .cyan
        cv.delegate = self
        cv.dataSource = self
        cv.register(MoviesCell.self, forCellWithReuseIdentifier: "MoviesCell")
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(60)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(-60)
        }
        viewModel.isReload.subscribe { _ in
            self.collectionView.reloadData()
            self.collectionView.refreshControl?.endRefreshing()
        }
        
         }
    
}

extension MoviesView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.data?.results.count ?? 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCell", for: indexPath) as! MoviesCell
        cell.reload(viewModel.data?.results[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (viewModel.data?.results.count ?? 1)-1,
           viewModel.page <= viewModel.maxPage{
            viewModel.fetchData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (UIScreen.main.bounds.width - 18 - 18) / 2.0
        return CGSize(width: size, height: 320 )
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if let model = viewModel.data?.results[indexPath.row] {
            viewModel.goActorDetailView(index: indexPath.row)
        }
        
    }
}
