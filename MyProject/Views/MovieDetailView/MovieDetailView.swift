//
//  MovieDetailView.swift
//  MyProject
//
//  Created by admin on 12/13/22.
//

import UIKit
import SnapKit
import AlamofireImage
import RxSwift

class MovieDetailView: UIViewController {
    
     var viewModel = MovieDetailViewModel()
    
    private var mainImage = UIImageView()
    private let movieTitleLabel = UILabel()
    private let movieCreateAtLabel = UILabel()
    private let descrptionLabel = UILabel()
    private let actorsLable = UILabel()
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .green
        cv.dataSource = self
        cv.delegate = self
        cv.register(MovieDetailCell.self, forCellWithReuseIdentifier: "MovieDetailCell")
        return cv
    }()
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.bounces = true
        sv.contentSize = CGSize(width: view.frame.width, height: view.frame.height+200)
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.height.width.equalTo(view.snp.width)
        }
        scrollView.addSubview(movieTitleLabel)
        movieTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(200)
            make.top.equalTo(mainImage.snp.bottom).offset(10)
    
        }
        scrollView.addSubview(movieCreateAtLabel)
        movieCreateAtLabel.snp.makeConstraints { make in
            make.top.equalTo(movieTitleLabel.snp.bottom).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(200)

        }
        scrollView.addSubview(descrptionLabel)
        descrptionLabel.numberOfLines = 0
        descrptionLabel.snp.makeConstraints { make in
            make.top.equalTo(movieCreateAtLabel.snp.bottom).offset(20)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(110)
        }
        scrollView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width-10)
            make.top.equalTo(descrptionLabel.snp.bottom).offset(20)
            make.height.equalTo(110)
        }
        movieTitleLabel.textColor = .white
        movieCreateAtLabel.textColor = .white
        descrptionLabel.textColor = .white
        reloadData()
    }
    
    func reloadData() {
        viewModel.isLoadView.subscribe { _ in
            if let imageURL = self.viewModel.movieDetail?.posterImageURL {
                self.mainImage.af.setImage(withURL: imageURL)
            }
            self.collectionView.reloadData()
            self.movieTitleLabel.text = self.viewModel.movieDetail?.title
            self.movieCreateAtLabel.text = self.viewModel.movieDetail?.releaseDate
            self.descrptionLabel.text = self.viewModel.movieDetail?.overview
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
}


extension MovieDetailView: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movieCast?.cast.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieDetailCell", for: indexPath) as! MovieDetailCell
        cell.setup(viewModel.movieCast?.cast[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.goToActors(viewModel.movieCast?.cast[indexPath.row])
    }
    
}
