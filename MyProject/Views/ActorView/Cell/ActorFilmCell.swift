//
//  ActorFilmCell.swift
//  MyProject
//
//  Created by admin on 12/15/22.
//

import UIKit
import AlamofireImage
import SnapKit

class ActorFilmCell: UITableViewCell {
    private var filmName = UILabel()
    private var filmImageView = UIImageView()
    
    
    func configureAndLayoutSubview() {
        contentView.backgroundColor = .black
        filmName.textColor = .white
        contentView.addSubview(filmName)
        contentView.addSubview(filmImageView)
        
        filmImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.height.equalTo(70)
        }
        filmName.snp.makeConstraints { make in
            make.leading.equalTo(filmImageView.snp.trailing)
            make.height.equalTo(30)
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            
        }
        
    }
    
    func setup(_ cast: Cast?) {
        guard let cast = cast else {
            return
        }

        filmName.text = cast.title
        if let url = cast.posterImageURL {
            filmImageView.af.setImage(withURL: url)
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAndLayoutSubview()
    }
    

}
