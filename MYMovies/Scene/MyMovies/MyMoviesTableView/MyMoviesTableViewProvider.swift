//
//  MyMoviesTableViewProvider.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 27.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class MyMoviesTableViewProvider: NSObject, TableViewProvider {
    
     var data = [MovieInViewing]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MyMoviesTableViewCell.reuseIdD,
            for: indexPath) as? MyMoviesTableViewCell
            else { return UITableViewCell() }
        
        let viewModel = data[indexPath.row]
        cell.setTitles(title: viewModel.title, subTitle: viewModel.breakPoint!)
        
        return cell
    }
    
    
    
    
}
