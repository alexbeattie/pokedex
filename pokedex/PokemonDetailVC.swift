//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Alex Beattie on 10/27/15.
//  Copyright © 2015 Alex Beattie. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttack: UILabel!

    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var currentEvoImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
        let img = UIImage(named:"\(pokemon.pokedexId)")
        mainImage.image = img
        currentEvoImg.image = img

        pokemon.downloadPokemonDetails { () -> () in
            //this will be called after download done
            print("did we get here?")
            self.updateUI()
        }
    }
    func updateUI() {
        
        descLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        baseAttack.text = pokemon.attack
        pokedexLbl.text = "\(pokemon.pokedexId)"
        if pokemon.nextEvolutionID == "" {
            evoLbl.text = "No Evelutions"
            nextEvoImg.hidden = true    
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionID)
            var str = "Nex Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolution != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
            }
            
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion:nil)

    
    }
    
}
