//
//  CreateRecipeVC.swift
//  YumYum
//
//  Created by Dulio Denis on 11/25/15.
//  Copyright © 2015 Dulio Denis. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var recipeTitle:         UITextField!
    @IBOutlet weak var recipeIngredients:   UITextField!
    @IBOutlet weak var recipeSteps:         UITextField!
    @IBOutlet weak var recipeImage:         UIImageView!
    @IBOutlet weak var addRecipeButton:     UIButton!
    
    var imagePicker: UIImagePickerController!
    
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        recipeImage.layer.cornerRadius = 5.0
        recipeImage.clipsToBounds = true
        
    }
    
    
    // MARK: UIIMagePicker Button Method
    
    @IBAction func imageSelection(sender: AnyObject!) {
        // showViewController(imagePicker, sender: sender)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    // MARK: Image Picker Controller Delegate Method
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImage.image = image
        addRecipeButton.hidden = true
    }
    
    @IBAction func createRecipe(sender: AnyObject!) {
        if let title = recipeTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            
            recipe.title = title
            recipe.ingredients = recipeIngredients.text
            recipe.steps = recipeSteps.text
            recipe.setRecipeImage(recipeImage.image!)
            
            context.insertObject(recipe)
            
            do {
                try context.save()
            } catch {
                print("Could not save recipe")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
