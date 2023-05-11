//
//  MovieDetailCell.swift
//  MyProject
//
//  Created by admin on 12/14/22.
//

import UIKit
import AlamofireImage

class MovieDetailCell: BaseCollectionViewCell {
    
    var actorsImageView = UIImageView()
    var actorsName = UILabel()
    
    override func configureAndLayoutSubviews() {
        contentView.addSubview(actorsImageView)
        actorsImageView.snp.makeConstraints { make in
            make.trailing.leading.top.bottom.equalToSuperview()
        }
    }
    func setup(_ cast: Cast?) {
        guard let cast = cast else { return }
        
        actorsName.text = cast.name
        
        if let url = cast.profileImageURL {
            actorsImageView.af.setImage(withURL: url)
        }
    }
}
