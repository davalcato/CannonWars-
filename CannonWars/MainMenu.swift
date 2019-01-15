//
//  MainMenu.swift
//  CannonWars
//
//  Created by Daval Cato on 1/14/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import SpriteKit


class MainMenu: SKScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let game:GameScene = GameScene(fileNamed: "GameScene")!
        game.scaleMode = .aspectFill
        let _:SKTransition = SKTransition.crossFade(withDuration: 1.0)
        self.view?.presentScene(game, transition: SKTransition.fade(with: SKColor(red: 25.0/255.0, green: 55.0/255.0, blue: 12.0/255.0, alpha: 1), duration: 1.0))
    }

}
