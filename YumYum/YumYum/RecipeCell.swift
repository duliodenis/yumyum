//
//  RecipeCell.swift
//  YumYum
//
//  Created by Dulio Denis on 11/24/15.
//  Copyright © 2015 Dulio Denis. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    func configureCell(recipe: Recipe) {
        recipeTitle.text = recipe.title
        recipeImage.image = recipe.getRecipeImage()
    }

}
