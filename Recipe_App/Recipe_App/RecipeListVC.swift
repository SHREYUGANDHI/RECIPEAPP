//
//  RecipeListVC.swift
//  Recipe_App
//
//  Created by DCS on 27/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class RecipeListVC: UIViewController {

    var tableView = UITableView()
    var recipeArr = ["Soup","Starter","Sandwich","Chiness","Dessert"]
    var recipesubtitlelbl = ["Machau Soup", "Panner Tikka", "Chesse Grill Sandwich", "Hakka Noodles", "Brownie" ]
    var recipeDesc = [
        "->2 tbsp oil \n ->,1 inch ginger (finely chopped),\n -> 2 clove garlic (finely chopped),\n-> 2 chilli (finely chopped) ,\n-> ½ onion (finely chopped) ,\n-> ½ carrot (finely chopped) ,\n->   3 tbsp cabbage (finely chopped) ,\n->  ½ capsicum (finely chopped) ,\n-> 5 beans (finely chopped) ,\n->  2 tbsp coriander stem (chopped) ,\n-> 4 cup water , \n-> ¾ tsp salt ,\n->  2 tbsp soy sauce , \n-> 2 tbsp vinegar ,\n-> ½ tsp pepper powder ,\n-> 1 tsp chilli sauce ,\n->  1 tsp cornflour , \n-> ¼ cup water (for slurry) ,\n->  2 tbsp coriander (finely chopped)",
        "-> 150 grams greek yogurt or thick yogurt (1/2 cup + 1-2 tablespoons),\n-> 1 tablespoon ginger-garlic paste ,\n->     2 tablespoons mustard oil 30 ml, or use oil of choice ,\n-> 2 teaspoons coriander powder ,\n->  1 teaspoon chaat masala ,\n->  1 teaspoon kashmiri red chili powder ,\n-> 3/4 teaspoon garam masala ,\n->  1/4 teaspoon red chili powder or adjust to taste ,\n->   1 teaspoon kasuri methi crushed ,\n->   1/2 teaspoon salt or to taste ,\n-> 1 lemon juice of ,\n->  2 tablespoons chopped cilantro ,\n->  2 tablespoons chopped mint ,\n->  300 grams paneer cut into big cubes, around 2 heaping cups of cubes paneer ,\n->  1 large onion cut into 1 inch cubes ,\n-> 1 large bell pepper cut into 1 inch cubes, I used mix of red and green peppers",
        "-> 4 Bread Slices ,\n->  1 tsp Salt ,\n-> 1/8 tsp Kali Mirch Powder ,\n-> 1/2 Cup Cheese, grated  To taste Green Chillies , chopped ,\n-> 1 Tbsp Coriander Leaves, chopped ,\n-> 1 Tbsp Butter ",
        "-> 300 grams noodles I used Ching Hakka Noodles ,\n-> 1 tablespoon sesame oil ,\n-> 1 tablespoon vegetable oil ,\n-> 2 teaspoons minced garlic ,\n-> 1 teaspoon minced ginger ,\n-> 1 green chili sliced ,\n-> 1 stalk celery chopped ,\n-> 1 medium red onion 100 grams, sliced ,\n-> 1 large carrot 100 grams, sliced ,\n-> 1 large red pepper 200 grams, sliced, can use mix of green and red ,\n-> 3 stalks green onion chopped + more to garnish,\n-> 2.5 tablespoons soy sauce ,\n-> 1 tablespoon rice vinegar or white vinegar ,\n-> 1 teapoon hot sauce like sriracha ,\n-> 1/2 teaspoon sugar optional ,\n-> 1/4 teaspoon black pepper powder ,\n-> 1/2 teaspoon salt or to taste ,\n-> pinch white pepper powder ,\n-> 1 teaspoon chili oil optional ",
        "-> 50 g    Walnuts (10-12 pieces, chopped) ,\n-> 250 g Dr. Oetker FunFoods Eggless Cake Mix Brownie ,\n-> 2 tbsp    Butter (30g) ,\n-> 100 ml    Full Cream Milk ,\n-> 100 g    Dr. Oetker FunFoods Dessert Topping Chocolate",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipes"
        setTableView()
        view.backgroundColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTableView(){
        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        self.view.addSubview(tableView)
        
        tableView.register(RecipeCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension RecipeListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RecipeCell
        
        cell.userImage.image = UIImage(named: recipeArr[indexPath.row])
        cell.namelbl.text = recipeArr[indexPath.row]
        cell.descriptiontitlelbl.text = recipesubtitlelbl[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = RecipeBookVC()
        vc .subtitlelbl = recipesubtitlelbl[indexPath.row]
        vc.image = UIImage(named: recipeArr[indexPath.row])!
        vc.lbl = recipeArr[indexPath.row]
        vc.desc = recipeDesc[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}
