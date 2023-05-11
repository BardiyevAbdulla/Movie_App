//
//  ActorView.swift
//  MyProject
//
//  Created by admin on 12/14/22.
//

import UIKit

class ActorView: UIViewController {
    
    var viewModel: ActorViewModel
    
    lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.backgroundColor = .black
        tb.register(ActorHeaderCell.self, forCellReuseIdentifier: "ActorHeaderCell")
        tb.register(ActorFilmCell.self, forCellReuseIdentifier: "ActorFilmCell")
        return tb
    }()
    
    init(viewModel: ActorViewModel) {
       
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.trailing.bottom.leading.equalToSuperview()
            make.top.equalTo(50)
        }
        viewModel.isDataLoaded.subscribe { _ in
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }

}

extension ActorView: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {2}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return viewModel.actorMovies?.cast.count ?? 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActorHeaderCell", for: indexPath)as! ActorHeaderCell
            cell.setup(viewModel.actor)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActorFilmCell", for: indexPath)as! ActorFilmCell
            cell.setup(viewModel.actorMovies?.cast[indexPath.row])
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            viewModel.goMovieDetailView(movie: (viewModel.actorMovies?.cast[indexPath.row])!)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
