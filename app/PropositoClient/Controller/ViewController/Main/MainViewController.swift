//
//  MainViewController.swift
//  PropositoClient
//
//  Created by Matheus Gois on 01/07/19.
//  Copyright © 2019 Matheus Gois. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UIScrollViewDelegate {
    //Main Scroll View
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet var collectionViewPray: UICollectionView!
    @IBOutlet var flowLayoutPray: UICollectionViewFlowLayout!
    @IBOutlet var collectionViewHeightConstraintPray: NSLayoutConstraint!
    @IBOutlet var collectionViewAct: UICollectionView!
    @IBOutlet var flowLayoutAct: UICollectionViewFlowLayout!
    @IBOutlet var collectionViewHeightConstraintAct: NSLayoutConstraint!
    private var prayersCard: [CardModel] = [CardModel]()
    private var prayers = [Prayer]()
    private var actsCard: [CardModel] = [CardModel]()
    private var acts = [Action]()
    private enum Segment: Int {
        case dataSet1 = 0, dataSet2, dataSet3
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScrollView.delegate = self
        loadData()
    }
    //Remove horizontal scroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if mainScrollView.contentOffset.x != 0 {
            mainScrollView.contentOffset.x = 0
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        collectionViewAct.reloadData()
        collectionViewPray.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        loadDataPray()
        loadDataAct()
    }
    func loadDataPray() {
        //        self.prayersCard = []
        //        self.prayers = []
        //        PrayerHandler.loadPrayWith { (res) in
        //            switch (res) {
        //            case .success(let prayers):
        //                prayers.forEach({ (pray) in
        //                    if !pray.answered {
        //                        self.prayers.append(pray)
        //                        self.prayersCard.append(
        //                            CardModel(title: pray.name, body: pray.date, date: nil)
        //                        )
        //                    }
        //                })
        //            case .error(let description):
        //                print(description)
        //            }
        //        }
        //        setupCollectioViewPray()
        //        collectionViewPray.reloadData()
    }
    func loadDataAct() {
        //        self.actsCard = []
        //        self.acts = []
        //        ActionHandler.loadActWith { (res) in
        //            switch (res) {
        //            case .success(let acts):
        //                acts.forEach({ (act) in
        //                    if !act.completed {
        //                        self.acts.append(act)
        //                        self.actsCard.append(
        //                            CardModel(title: act.title, body: act.pray,
        //                                             date: Date.getFormattedDate(date: act.date))
        //                        )
        //                    }
        //                })
        //            case .error(let description):
        //                print(description)
        //            }
        //        }
        //        setupCollectioViewAct()
        //        collectionViewAct.reloadData()
    }
    func loadData() {
        self.prayersCard = []
        self.actsCard = []
        //Load data of the Prayers
        PrayerHandler.getAll { (res) in
            switch res {
            case .success(let prayers):
                prayers.forEach({ (pray) in
                    if !pray.answered {
                        self.prayers.append(pray)
                        self.prayersCard.append(
                            CardModel(title: pray.name, body: pray.name, date: nil)
                        )
                    }
                })
            case .error(let description):
                print(description)
            }
        }
        
        setupCollectioViewPray()
        setupCollectioViewAct()
        collectionViewAct.reloadData()
        collectionViewPray.reloadData()
    }
    // Config CollectioView Pray
    private func setupCollectioViewPray() {
        let nib = UINib(nibName: Constants.cellReuseIdentifier, bundle: nil)
        collectionViewPray.register(nib, forCellWithReuseIdentifier: Constants.cellReuseIdentifier)
        let edgeInsets = UIEdgeInsets(top: Constants.collectionMarginTop,
                                      left: Constants.collectionMarginLeft,
                                      bottom: Constants.collectionMarginBotton,
                                      right: Constants.collectionMarginRight)
        flowLayoutPray.sectionInset = edgeInsets
        flowLayoutPray.minimumInteritemSpacing = Constants.collectionMarginInteringSpacing
        flowLayoutPray.minimumLineSpacing = Constants.collectionMarginLineSpacing
        setCollectionViewHeight(with: prayersCard, edgeInsets: flowLayoutPray.sectionInset)
    }
    private func setCollectionViewHeight(with data: [CardModel], edgeInsets: UIEdgeInsets) {
        flowLayoutPray.itemSize = CGSize(width: Constants.cardWidth, height: Constants.maximumCardHeight)
    }
    // Config CollectioView Act
    private func setupCollectioViewAct() {
        let nib = UINib(nibName: Constants.cellReuseIdentifier, bundle: nil)
        collectionViewAct.register(nib, forCellWithReuseIdentifier: Constants.cellReuseIdentifier)
        let edgeInsets = UIEdgeInsets(top: Constants.collectionMarginTop,
                                      left: Constants.collectionMarginLeft,
                                      bottom: Constants.collectionMarginBotton,
                                      right: Constants.collectionMarginRight)
        flowLayoutAct.sectionInset = edgeInsets
        flowLayoutAct.minimumInteritemSpacing = Constants.collectionMarginInteringSpacing
        flowLayoutAct.minimumLineSpacing = Constants.collectionMarginLineSpacing
        setCollectionViewHeightAct(with: actsCard, edgeInsets: flowLayoutAct.sectionInset)
    }
    private func setCollectionViewHeightAct(with data: [CardModel], edgeInsets: UIEdgeInsets) {
        flowLayoutAct.itemSize = CGSize(width: Constants.cardWidth, height: Constants.maximumCardHeight)
    }
    // CollectionView Datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewPray { return prayersCard.count } else { return actsCard.count }
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        var cell = collectionView.dequeueReusableCell(withReuseIdentifier:
        //                      Constants.cellReuseIdentifier, for: indexPath)
        //        guard cell = cell as? Cell else {
        //            return UICollectionViewCell()
        //        }
        //        var example: CardModel
        //
        //        if collectionView == self.collectionViewPray {
        //            example = prayersCard[indexPath.item]
        //            cell.date.alpha = 0
        //            cell.button.addTarget(self,
        //                                  action: #selector(funcPrayButtonCheck),
        //                                  for: .touchUpInside)
        //        } else {
        //            example = actsCard[indexPath.item]
        //            cell.button.addTarget(self,
        //                                  action: #selector(funcActButtonCheck),
        //                                  for: .touchUpInside)
        //        }
        //
        //        let viewModel = ViewModel(example: example)
        //        cell.configure(with: viewModel)
        //        cell.button.tag = indexPath.row
        return UICollectionViewCell()
    }
    @objc
    func funcPrayButtonCheck(sender: UIButton) {
        var prayToUpdate = self.prayers[sender.tag]
        prayToUpdate.answered = true
        updatePray(prayToUpdate, sender)
    }
    @objc
    func funcActButtonCheck(sender: UIButton) {
        var actToUpdate = self.acts[sender.tag]
        actToUpdate.completed = true
        updateAct(actToUpdate, sender)
    }
    private func updatePray(_ prayToUpdate: Prayer, _ sender: UIButton) {
        PrayerHandler.update(pray: prayToUpdate) { (res) in
            switch res {
            case .success( _):
                removePrayWithAnimate(sender)
            case .error(let description):
                print(description)
            }
        }
    }
    private func updateAct(_ actToUpdate: Action, _ sender: UIButton) {
        ActionHandler.update(act: actToUpdate) { (res) in
            switch res {
            case .success(_ ):
                removeActWithAnimate(sender)
            case .error(let description):
                print(description)
            }
        }
    }
    private func removePrayWithAnimate(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut], animations: {
            sender.superview?.superview?.transform = CGAffineTransform.identity
            sender.superview?.superview?.alpha = 0
        }, completion: {( _: Bool) in
            self.loadDataPray()
        })
    }
    private func removeActWithAnimate(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut], animations: {
            sender.superview?.superview?.transform = CGAffineTransform.identity
            sender.superview?.superview?.alpha = 0
        }, completion: {( _: Bool) in
            self.loadDataAct()
        })
    }
}