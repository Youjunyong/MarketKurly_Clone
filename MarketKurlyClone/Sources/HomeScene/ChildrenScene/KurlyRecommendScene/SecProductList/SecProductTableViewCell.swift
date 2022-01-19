//
//  SecProductTableViewCell.swift
//  MarketKurlyClone
//
//  Created by 유준용 on 2021/10/23.
//

import UIKit

class SecProductTableViewCell: UITableViewCell {
    
    var delegate: KurlyRecommendViewController?

    @IBOutlet weak var collectionView: UICollectionView!
    var reloadCnt = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.isScrollEnabled = true
        self.collectionView.isPagingEnabled = false
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        let nib = UINib(nibName: "SecProductCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "SecProductCollectionViewCell")
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @objc func goDetail(sender: UIButton){
//        지금
        let cell = (sender.superview?.superview as? SecProductCollectionViewCell)!
        let index = collectionView.indexPath(for: cell)!.row as Int
        
        guard let productId = ProductData.shared.productContent1["productId\(index)"] else{
            delegate?.presentAlert(title: "로그인을 먼저 해주세요")
            
            return
        }
        ProductData.shared.detailContent["productId"] = productId
        delegate?.getProductDetail(productId: Int(productId)!)
        let storyboard = UIStoryboard(name: "PaymentScene", bundle: nil)
        guard let PayVC = storyboard.instantiateViewController(withIdentifier: "PaymentVC") as? PaymentViewController else{return}
        PayVC.idx = index
        PayVC.modalPresentationStyle = .fullScreen
        self.window?.rootViewController?.present(PayVC, animated: false, completion: nil)
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension SecProductTableViewCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 310)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
}

//MARK: - UICollectionViewDataSource

extension SecProductTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        guard let cnt = ProductData.shared.productContent1["cnt"] else{return 4}
        
        return Int(cnt)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecProductCollectionViewCell", for: indexPath) as? SecProductCollectionViewCell else {return UICollectionViewCell() }
        
        
        cell.payButton.addTarget(self, action: #selector(goDetail(sender:)), for: .touchUpInside)

        if UserDataManager.shared.token != nil {
            NSLayoutConstraint.activate([cell.newImageView.heightAnchor.constraint(equalToConstant: 200)])
            var image: UIImage?
            
            reloadCnt += 1
            
                let url = URL(string: ProductData.shared.productContent1["path\(indexPath.row)"]!)
            
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    if ProductData.shared.productContent1["price\(indexPath.row)"] != nil{
                        cell.priceLabel.text = ProductData.shared.productContent1["price\(indexPath.row)"]! + "원"
                    }

                    
                    if ProductData.shared.productContent1["discount\(indexPath.row)"] != nil {
                        cell.discountLabel.text = ProductData.shared.productContent1["discount\(indexPath.row)"]!
                    }
                    
                    cell.productNameLabel.text = ProductData.shared.productContent1["name\(indexPath.row)"]!

                    image = UIImage(data: data!)
                    cell.newImageView.image = image
                    if cell.imageView != nil {
                        cell.imageView.removeFromSuperview()
                    }
                    
                }
            }
            
        }else{
            cell.imageView.image = UIImage(named: "secProduct\(indexPath.row + 1)")
        }
        
        return cell
    }
    
    
}
