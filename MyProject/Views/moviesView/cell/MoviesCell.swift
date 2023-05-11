//
//  MoviesCell.swift
//  MyProject
//
//  Created by admin on 12/12/22.
//

import UIKit
import AlamofireImage

class MoviesCell: BaseCollectionViewCell {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let movieTimeLabel = UILabel()
    
    override func configureAndLayoutSubviews() {
        //super.configureAndLayoutSubviews()
        contentView.addSubview(imageView)
        
        contentView.addSubview( titleLabel)
       
        contentView.addSubview(movieTimeLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview()
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(4)
            
        }
        
        movieTimeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
        
        imageView.image = UIImage(named: "image")
        
        titleLabel.text = "test"
        movieTimeLabel.text = "test"
        
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .white
        movieTimeLabel.textColor = .white
    }
    
    func reload(_ movie: Cast?) {
        guard let movie = movie else {
            return
        }

        titleLabel.text = movie.title
        movieTimeLabel.text = movie.releaseDate
        
        if let url = movie.posterImageURL {
            imageView.af.setImage(withURL: url)
            
        }
    }
}
