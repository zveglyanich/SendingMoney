//
//  SendMoneyToContactTableViewController.swift
//  SendingMoney
//
//  Created by Павел Звеглянич on 08.10.2020.
//  Copyright © 2020 Pavel Zveglyanich. All rights reserved.
//

import UIKit
import CoreData

class SendMoneyToContactTableViewController: UITableViewController {
    
    let contacts = ["John Lendrich", "Edward Scot", "Joshua Lanskape", "Kristina Launch", "Entony Dikinson", "Josaph Elgape", "Philipe Mull", "Lana Greaphe"]
    var context: NSManagedObjectContext?
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactId", for: indexPath) as! SendMoneyToContactTableViewCell
        cell.contactNameLabel.text = contacts[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertToStartSend = UIAlertController(title: "Send to \(contacts[indexPath.row])", message: "Indicate amount of money to transfer", preferredStyle: .alert)
        alertToStartSend.addTextField { textfield in textfield.keyboardType = .numberPad }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            if let text = alertToStartSend.textFields?.first?.text, let savedCash = UserSettings.userDefaultsModel{
                let trasnferCash = (text as NSString).floatValue
                //check count cash for transfer
                if (savedCash - trasnferCash) < 0 {
                    self.showAlertController(titleForShow: "Attention", messageForShow: "Insufficient funds. Please indicate correct transfer amount", isExit: false)
                } else {
                    UserSettings.userDefaultsModel = savedCash - trasnferCash
                    self.saveOperationToCoreData(sendMoneyCount: trasnferCash, toContact: self.contacts[indexPath.row])
                    self.showAlertController(titleForShow: "Sending money", messageForShow: "Complete", isExit: true)
                }
            }
        }
        
        alertToStartSend.addAction(cancel)
        alertToStartSend.addAction(ok)
        present(alertToStartSend, animated: true, completion: nil)
    }
}

    // MARK: - Tableview support func + CoreData

extension SendMoneyToContactTableViewController {
    private func showAlertController(titleForShow title: String, messageForShow message: String, isExit popViewController: Bool) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var ok = UIAlertAction()
        //check exit controllet
        if popViewController {
            ok = UIAlertAction(title: "Ok", style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
            })
        } else {
            ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        }
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
    
    private func saveOperationToCoreData(sendMoneyCount cash: Float, toContact contact: String) {
        let operation = Operation(context: context!)
        operation.date = Date()
        operation.userOfSend = contact
        operation.sendMoney = cash
        operation.user = user
        user.addToOperations(operation)
        do {
            try context!.save()
            print ("Complete add operation to CoreData")
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
