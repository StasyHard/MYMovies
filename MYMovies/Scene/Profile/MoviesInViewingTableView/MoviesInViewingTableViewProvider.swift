//
//  MoviesInViewingTableViewProvider.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 22.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

final class MoviesInViewingTableViewProvider: NSObject, TableViewProvider {
    
    // MARK: Open properties
    var data = [MovieInViewing
//        MovieInViewing(poster: "vikings", title: "Викинги", breakPoint: "1 сезон 4 серия"),
//        MovieInViewing(poster: "vikings", title: "Однажды в Ирландии", breakPoint: "1 час 41 мин"),
//        MovieInViewing(poster: "vikings", title: "Звездные воины: Скайуокер. Восход. Ldf", breakPoint: "1 час 41 мин")
    ]()
    
    var didSelectItem: ((_ atIndex: Int) -> Void)?
    
    //MARK: - TableViewProvider metods
    
    //MARK: DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MoviesInViewingTableViewCell.reuseIdD,
            for: indexPath
            ) as? MoviesInViewingTableViewCell else { return UITableViewCell() }
        
        let viewModel = data[indexPath.row]
        cell.setPoster(viewModel.poster)
        cell.setTitles(title: viewModel.title, subTitle: "1 час 41 мин")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return MoviesInViewingTableViewHeader.headerHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return MoviesInViewingTableViewFooter.footerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: MoviesInViewingTableViewHeader.reuseIdD
            ) as? MoviesInViewingTableViewHeader
            else { return UITableViewHeaderFooterView() }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: MoviesInViewingTableViewFooter.reuseIdD
            ) as? MoviesInViewingTableViewFooter
            else { return UITableViewHeaderFooterView() }
        return footerView
    }
    
    //MARK: Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItem?(indexPath.row)
    }
}
