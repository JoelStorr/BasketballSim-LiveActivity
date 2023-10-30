//
//  GameModel.swift
//  BasketballSim
//
//  Created by Sean Allen on 11/6/22.
//

import Foundation
import ActivityKit

final class GameModel: ObservableObject, GameSimulatorDelegate {

    @Published var gameState = GameState(homeScore: 0,
                                          awayScore: 0,
                                          scoringTeamName: "",
                                          lastAction: "")
    let simulator = GameSimulator()

    init() {
        simulator.delegate = self
    }
    // Live Activity code goes here
    var liveActivity: Activity<GameAttributes>?

    // Starts the Live Activity
    func startingLiveActivity() {

        let attributes = GameAttributes(homeTeam: "warriors", awayTeam: "bulls")
        let currentGameState = GameAttributes.ContentState(gameState: gameState)

        do {
            // attributes are the Static data
            // content is the initial state
            liveActivity = try Activity.request(attributes: attributes, contentState: currentGameState)
        } catch {
            print(error.localizedDescription)
        }
    }

    // Updates the Live Activity
    func didUpdate(gameState: GameState) {
        self.gameState = gameState

        // Updates the Activity UI
        Task {
            await liveActivity?.update(using: .init(gameState: gameState))
        }
    }

    // Ends the Live Activity
    func didCompleteGame() {
        Task {
            await liveActivity?.end(using: .init(gameState: simulator.endGame()), dismissalPolicy: .default)
        }
    }
}
