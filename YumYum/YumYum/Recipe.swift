//
//  Recipe.swift
//  YumYum
//
//  Created by Dulio Denis on 11/24/15.
//  Copyright © 2015 Dulio Denis. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    func setRecipeImage(image: UIImage) {
        let data = UIImagePNGRepresentation(image)
        self.image = data
    }
    
    func getRecipeImage() -> UIImage {
        return UIImage(data: self.image!)!
    }

}
