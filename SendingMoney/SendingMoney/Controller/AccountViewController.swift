//
//  AccountViewController.swift
//  SendingMoney
//
//  Created by Павел Звеглянич on 07.10.2020.
//  Copyright © 2020 Pavel Zveglyanich. All rights reserved.
//

import UIKit
import CoreData

class AccountViewController: UIViewController {
    
    private var informationOfAccount = ["Name", "Surname", "City", "Cash count"]
    var user: User!
    var context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    @IBOutlet weak var acountTableView: UITableView!
    @IBOutlet weak var transferHistoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        acountTableView.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        transferHistoryTableView.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        checkUserInCoreData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        acountTableView.reloadData()
        transferHistoryTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContactId" {
            let smtctvc = segue.destination as! SendMoneyToContactTableViewController
            smtctvc.context = context
            smtctvc.user = user
        }
    }
}

// MARK: conficurate cells for tableViews + func inizialization user in CoreData

extension AccountViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == acountTableView ? informationOfAccount.count : user.operations?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView == acountTableView ? cellAcount(tableView, indexPath) : cellTransfer(tableView, indexPath)
    }
    
    private func cellAcount(_ tableView: UITableView, _ indexPath: IndexPath ) -> UITableViewCell {// configurate cell for acount information in tableView
        let cellAcount = tableView.dequeueReusableCell(withIdentifier: "acountCell", for: indexPath) as! AccountInformationTableViewCell
        cellAcount.accountInformationItemLabel.text = informationOfAccount[indexPath.row]
        switch indexPath.row {
        case 0: cellAcount.accountInformationValueLabel.text = UserSettings.userKeyChainModel.firstname
        case 1: cellAcount.accountInformationValueLabel.text = UserSettings.userKeyChainModel.secondName
        case 2: cellAcount.accountInformationValueLabel.text = UserSettings.userKeyChainModel.city
        case 3: cellAcount.accountInformationValueLabel.text = String(UserSettings.userDefaultsModel)
        default: break
        }
        return cellAcount
    }
    private func cellTransfer(_ tableView: UITableView, _ indexPath: IndexPath ) -> UITableViewCell {// configurate cell for hystory transfers money in tableView
        let cellTransfer = tableView.dequeueReusableCell(withIdentifier: "transferId", for: indexPath) as! TransferInformationTableViewCell
        guard let operationOfHystory = user.operations?.allObjects[indexPath.row] as? Operation else {
            return cellTransfer
        }
        cellTransfer.contactTransferLabel.text = operationOfHystory.userOfSend
        cellTransfer.dateTransferLabel.text = dateFormatter.string(from: operationOfHystory.date ?? Date())
        cellTransfer.cashOfTransferLabel.text = String(operationOfHystory.sendMoney)
        return cellTransfer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func checkUserInCoreData() {
        let login = UserSettings.userKeyChainModel.login
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "login == %@", login)
        do {
            let results = try context!.fetch(fetchRequest)
            if results.isEmpty {
                user = User(context: context!)
                user.login = login
                try context!.save()
            } else {
                user = results.first
            }
        } catch let error as NSError {
            print (error.userInfo)
        }
    }
}




