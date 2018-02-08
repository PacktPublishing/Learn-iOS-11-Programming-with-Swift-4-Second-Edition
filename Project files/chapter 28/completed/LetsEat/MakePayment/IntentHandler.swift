//
//  IntentHandler.swift
//  MakePayment
//
//  Created by Craig Clayton on 10/13/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import Intents

class IntentHandler: INExtension{
    
    override func handler(for intent: INIntent) -> Any {
        if intent is INSendPaymentIntent {
            return SendMoneyIntent()
        }
        
        return self
    }
}

class SendMoneyIntent: NSObject, INSendPaymentIntentHandling {
    func handle(intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        
        if let person = intent.payee, let amount = intent.currencyAmount {
            //handle payment
            print("person \(person.displayName) - amount \(String(describing: amount.amount))")
            
            completion(INSendPaymentIntentResponse(code: .success, userActivity: nil))
        }
        else {
            completion(INSendPaymentIntentResponse(code: .success, userActivity: nil))
        }
        
    }
    
    func resolvePayee(for intent: INSendPaymentIntent, with completion: @escaping (INPersonResolutionResult) -> Void) {
        
        if let payee = intent.payee {
            let contacts:[RestaurantContact] = RestaurantContact.allContacts()
            var result: INPersonResolutionResult?
            var matchedContacts:[RestaurantContact] = []
            
            for contact in contacts {
                print("checking existing: \(contact.name) - \(payee.displayName)")
                
                if contact.name == payee.displayName {
                    matchedContacts.append(contact)
                }
                
                switch matchedContacts.count {
                    case 0:
                        print("no matches")
                        result = .unsupported()
                    case 1:
                        print("best matched")
                        let person = matchedContacts[0].inPerson()
                        result = INPersonResolutionResult.success(with: person)
                    default:
                        print("more than one match")
                        let person:[INPerson] = matchedContacts.map { contact in
                            return contact.inPerson()
                        }
                        result = INPersonResolutionResult.disambiguation(with: person)
                }
            }
            
            completion(result!)
        } else {
            
            completion(INPersonResolutionResult.needsValue())
        }
    }
}

