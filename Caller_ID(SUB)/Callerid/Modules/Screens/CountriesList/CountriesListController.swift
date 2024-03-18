import UIKit

extension UITableView {

    func setBottomInset(to value: CGFloat) {
        let edgeInset = UIEdgeInsets(top: 0, left: 0, bottom: value, right: 0)

        self.contentInset = edgeInset
        self.scrollIndicatorInsets = edgeInset
    }
}

final class CountriesListController: UIViewController {
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private var filteredCountries = countries
    
    var callback: ((Cousdnstsrsydffffrrrgdvnjvdjnvdjnv)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keysssboardsWilslsSshow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboarcslodWvillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        fruwbuwcugbwgycgbggbgbggvgvcfcfdcxdsxdcfgvbh()
    }
    
    @objc func keysssboardsWilslsSshow(notification: Notification) {
        if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            print("Notification: Keyboard will show")
            tableView.setBottomInset(to: keyboardHeight)
        }
    }

    @objc func keyboarcslodWvillHide(notification: Notification) {
        print("Notification: Keyboard will hide")
        tableView.setBottomInset(to: 0.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self)
    }
}

//MARK: - Actions
private extension CountriesListController {
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true)
    }
}

//MARK: - UITableViewDelegate
extension CountriesListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) { [weak self] in
            let country = countries.filter({$0.countries?.code == self?.filteredCountries[indexPath.row].countries?.code}).first
            if let country = country {
                self?.callback?(country)
            }
        }
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if filteredCountries.count - 1 == indexPath.row {
//            tableView.frame.origin.y -= tableView.frame.height/2.2
//        } else {
//            
//        }
//    }
}

//MARK: - UITableViewDataSource
extension CountriesListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesListCell", for: indexPath) as? CountriesListCell else { return UITableViewCell() }
        
        let countryStr = filteredCountries[indexPath.row].countries?.name ?? ""
        let phoneCode = " (\(filteredCountries[indexPath.row].countries?.dialCode ?? ""))"
        cell.setText(countryStr + phoneCode)
        cell.setImage(filteredCountries[indexPath.row].imageCountry ?? UIImage())
        
        return cell
    }
}

//MARK: - UISearchBarDelegate
extension CountriesListController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCountries = []
        if searchText == "" {
            filteredCountries = countries
        }
        
        for word in countries {
            guard let country = word.countries?.dialCode, let countryName = word.countries?.name else { return }
            if country.uppercased().contains(searchText.uppercased()) || countryName.uppercased().contains(searchText.uppercased()) {
                filteredCountries.append(word)
            }
        }
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}

//MARK: - Setup
private extension CountriesListController {
    func fruwbuwcugbwgycgbggbgbggvgvcfcfdcxdsxdcfgvbh() {
        setupvrkmlmeleplplpUI()
        setupTable()
        searchBar.delegate = self
    }
    
    func setupvrkmlmeleplplpUI() {
        titleLabel.text = "selectCountry".localized()
        titleLabel.font = .systemFont(ofSize: 17, weight: .medium)
        titleLabel.textColor = .black
        
        closeButton.setTitle("close".localized(), for: .normal)
    }
    
    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CountriesListCell", bundle: nil), forCellReuseIdentifier: "CountriesListCell")
    }
}
