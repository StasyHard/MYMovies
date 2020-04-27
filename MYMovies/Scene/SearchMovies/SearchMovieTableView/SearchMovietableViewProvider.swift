//
//  searchMovietableViewProvider.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 26.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class SearchMovietableViewProvider: NSObject, TableViewProvider {
    
    
    let data = ["Популярные фильмы", "Популярные сериалы", "Новые фильмы", "Новые сериалы"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchTableViewCell.reuseIdD,
            for: indexPath) as? SearchTableViewCell
            else { return UITableViewCell() }
        
        let viewModel = data[indexPath.row]
        cell.textLabel?.text = viewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select")
    }
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 90
//    }

}
