//
//  ActorHeaderCell.swift
//  MyProject
//
//  Created by admin on 12/15/22.
//

import UIKit
import AlamofireImage
import SnapKit

class ActorHeaderCell: UITableViewCell {

    private let actorImageView = UIImageView()
    private let actorName = UILabel()
    private let popularity = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureAndLayoutSubview()
    }
    
    func configureAndLayoutSubview() {
       
        contentView.addSubview(actorName)
        contentView.addSubview(actorImageView)
        contentView.addSubview(popularity)
        contentView.backgroundColor = .black
        actorName.textColor = .white
        popularity.textColor = .white
        actorImageView.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.top.bottom.leading.equalToSuperview()
        }
        
        actorName.snp.makeConstraints { make in
            make.leading.equalTo(actorImageView.snp.trailing).offset(12)
            make.top.equalToSuperview()
            make.height.equalTo(30)
            make.trailing.equalToSuperview()
        }
        
        popularity.snp.makeConstraints { make in
            make.leading.equalTo(actorImageView.snp.trailing).offset(12)
            make.top.equalTo(actorName.snp.bottom).offset(10)
            make.height.equalTo(30)
            make.trailing.equalToSuperview()
        }
        
        actorImageView.layer.cornerRadius = 14
        actorImageView.layer.masksToBounds = true
        actorImageView.clipsToBounds = true
    }
    
    func setup(_ cast: Cast?) {
        guard let cast = cast else { return }
        
        actorName.text = cast.name
        popularity.text = " Popularity \(Int(cast.popularity ?? 0))"
        if let url = cast.profileImageURL {
            actorImageView.af.setImage(withURL: url)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
