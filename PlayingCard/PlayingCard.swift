//
//  PlayingCard.swift
//  PlayingCard1
//
//  Created by Noha on 11.04.19.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import Foundation

struct PlayingCard : CustomStringConvertible {
    var description: String { return "\(rank) \(suit)"}
    
    
    var suit : Suit
    var rank : Rank
    
    enum Suit : String , CustomStringConvertible {
        var description: String {return rawValue}
        // raw value; if Int, spades will be automatically =0, hearts = 1, if String, raw vales will be "spades" , "hearts" etc.
            case spades = "♠️"
            case hearts = "♥️"
            case diamonds = "♦️"
            case clubs = "♣️"
        static var all = [Suit.spades, .clubs, .diamonds,.hearts]
        
      
    }
    enum Rank : CustomStringConvertible {
        var description: String {
            switch self {
            case .ace: return "A"
            case .Numeric(let pip): return String(pip)
            case .face(let kind): return kind
            
            }
        }
        // for learning puposes he will do it with associated data, but normally would be case ase case one etc,
        case ace
        case face(String)
        case Numeric(Int)
        
        var order : Int{
            switch self{
                case .ace: return 1
                case .Numeric(let pips): return pips
                case .face(let kind) where kind == "J": return 11
                case .face(let kind) where kind == "Q": return 12
                case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        static var all : [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10{
                allRanks.append(Rank.Numeric(pips))
            }
            allRanks += [Rank.face("J"),.face("Q"),.face("K")]
            return allRanks
        }
    
    }
}
