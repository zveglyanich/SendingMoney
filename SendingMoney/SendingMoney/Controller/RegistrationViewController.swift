//
//  RegistrationViewController.swift
//  SendingMoney
//
//  Created by Павел Звеглянич on 05.10.2020.
//  Copyright © 2020 Pavel Zveglyanich. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    private var informationforRegistrationAccount = ["Login", "Password", "Name", "Surname", "City", "Cash count"]
    private var allCellsRegistrationTextField = [UITextField]()
    
    @IBOutlet weak var registrationList: UITableView!
    
    @IBAction func saveRegistrationAccount(_ sender: Any) { //save Data to Keychain/UserDefaults and exit
        let user = UserModel(
            login: allCellsRegistrationTextField[0].text ?? "",
            password: allCellsRegistrationTextField[1].text ?? "",
            firstname: allCellsRegistrationTextField[2].text ?? "",
            secondName: allCellsRegistrationTextField[3].text ?? "",
            city: allCellsRegistrationTextField[4].text ?? "")
        
        UserSettings.userKeyChainModel = user
        UserSettings.userDefaultsModel = Float(allCellsRegistrationTextField[5].text ?? "")
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: conficurate cells for tableView (TableViewDataSource)

extension RegistrationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informationforRegistrationAccount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationItemCell", for: indexPath) as! RegistrationTableViewCell
        cell.registrationLabel.text = informationforRegistrationAccount[indexPath.row]
        
        switch indexPath.row {
        case 1:
            cell.registrationTextField.isSecureTextEntry = true
            allCellsRegistrationTextField.append(cell.registrationTextField)
        case 5:
            allCellsRegistrationTextField.append(cell.registrationTextField)
            allCellsRegistrationTextField[5].keyboardType = .numberPad
        default: allCellsRegistrationTextField.append(cell.registrationTextField)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
