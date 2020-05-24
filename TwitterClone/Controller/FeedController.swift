//
//  FeedController.swift
//  TwitterClone
//
//  Created by MCT on 5.05.2020.
//  Copyright © 2020 MCT. All rights reserved.
//

import UIKit
import SDWebImage

let reuseIdentifier = "TweetCell"

class FeedController: UICollectionViewController{
    
    //MARK: - Properties
    
    var user: User? {
        didSet {
            configureLeftButButtom()
        }
    }
    
    private var tweets = [Tweet]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchTweets()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isHidden = false
    }
    
    
    //MARK: - API
    
    func fetchTweets(){
        TweetService.shared.fetchTweets { tweets in
            self.tweets = tweets
        }
    }
    
    
    //MARK: - Helpers
    
    func configureUI(){
        
        collectionView.backgroundColor = .white
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 44, height: 44)
        navigationItem.titleView = imageView
    }
    
    
    func configureLeftButButtom() {
        guard let user = user else {return}
        
        let profileImageView = UIImageView()
        profileImageView.setDimensions(width: 34, height: 34)
        profileImageView.layer.cornerRadius = 34 / 2
        profileImageView.layer.masksToBounds = true
        profileImageView.sd_setImage(with: user.profileImageUrl, completed: nil)
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
        
    }
    
    //MARK: - initialized with a non-nil layout parameter
    // bu olmadığı zaman CollectionVC çalışmaz
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - UICollectionViewDelegate/DataSource

extension FeedController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tweets.count > 0 ? tweets.count : 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TweetCell
        print("DEBUG: \(indexPath.row)")
        cell.tweet = tweets[indexPath.row]
        cell.delegate = self
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension FeedController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}

//MARK: - TweeCellDelegate

extension FeedController: TweetCellDelegate {
    func handleProfileImageTapped() {
        print("DEBUG: Feed coontroller icerisindeki extention calisti......")
        let controlller = ProfileController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(controlller, animated: true)
    }
}
