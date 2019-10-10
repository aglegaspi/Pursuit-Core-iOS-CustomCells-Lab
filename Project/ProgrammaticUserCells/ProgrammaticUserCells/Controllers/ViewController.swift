import UIKit

class ViewController: UIViewController {
    
    var users = [User]() {
        didSet {
            userCV.reloadData()
        }
    }
    
    //MARK: - VIEWS
    lazy var userCV: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .vertical
        cv.dataSource = self
        cv.delegate = self
        cv.register(UserCollectionViewCell.self, forCellWithReuseIdentifier: "UserCell")
        return cv
    }()
    
    //MARK: - LIFECYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
        
        userCV.delegate = self
        userCV.dataSource = self
        
        self.view.addSubview(userCV)
        setCollectionViewConstraints()
    }
    
    //MARK: - PRIVATE FUNCTIONS
    private func loadUsers() {
        UsersFetchingService.manager.getUsers { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let arrOfUsers):
                    self.users = arrOfUsers
                    print("success")
                case .failure(let error):
                    print("im here")
                    print(AppError.couldNotParseJSON(rawError: error))
                }
            }
        }
    }
    
    
    //MARK: - CONSTRAINTS
    private func setCollectionViewConstraints() {
        self.userCV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.userCV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.userCV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.userCV.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.userCV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    }

// MARK: - EXTENSTIONS
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = userCV.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as? UserCollectionViewCell else { return UICollectionViewCell() }
        
        let user = users[indexPath.row]
        cell.nameLabel.text = "\(user.name.first) \(user.name.last)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let userSelected = users[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.modalPresentationStyle = .currentContext
        detailVC.user = userSelected
        present(detailVC, animated: true, completion: .none)
    }
    
}
