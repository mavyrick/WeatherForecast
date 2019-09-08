//
//  CapitalTableViewCell.swift
//  ClimaCellAssignment
//
//  Created by Josh Sorokin on 07/09/2019.
//  Copyright © 2019 Josh Sorokin. All rights reserved.
//

import UIKit
import WebKit

class CapitalTableViewCell: UITableViewCell {
    
    var capitalData: Country? {
        didSet {
            self.updateUI()
        }
    }

    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var flag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        flagWebView.navigationDelegate.self
//        flagWebView.uiDelegate.self
        
    }
    
    func updateUI() {
        
        capital.text = capitalData?.capital
        country.text = capitalData?.name
        
//        func emojiFlag(countryCode: String) {
//            print("\(UnicodeScalar(127397 + countryCode.unicodeScalars.regiona))")
////            for uS in countryCode.unicodeScalars[5] {
////                print(UnicodeScalar(127397 + uS.value)!)
////                print("😀")
////                flag.text =UnicodeScalar(127397 + uS.value)!)
////            }
//        }
        
//        func emojiFlag(countryCode countryCode: String) -> String {
//            var string = ""
//            print(countryCode.unicodeScalars)
//            for uS in countryCode.unicodeScalars {
////                print(UnicodeScalar(127397 + uS.value))
//                print(uS)
//            }
//            return string
//        }
        
        func emojiFlag(countryCode: String) -> String? {
            guard Locale.isoRegionCodes.contains(countryCode) else {
                return nil
            }
            
            var flagString = ""
            for s in countryCode.unicodeScalars {
                guard let scalar = UnicodeScalar(127397 + s.value) else {
                    continue
                }
                flagString.append(String(scalar))
            }
            return flagString
        }
        
        flag.text = emojiFlag(countryCode: capitalData?.countryCode ?? "")
        
        print(emojiFlag(countryCode: capitalData?.countryCode ?? ""))
        
//        let request = URLRequest(url: URL(string: "https://learnappmaking.com")!)
//
//        flagWebView?.load(request)
        
        
        
//        let flagURL = URL(string: capitalData?.flag ?? "")!
//        let flagImage = UIView(SVGURL: flagURL)
//        self.view.addSubview(hammock)
        
//        flag.sd_setImage(with: URL(string: "https://restcountries.eu/data/afg.svg"), placeholderImage: UIImage(named: "test"))
//        guard let url = capitalData?.flag else { return }
//
//        let svgURL = URL(string: "https://openclipart.org/download/181651/manhammock.svg")
//        let hammock = UIView(SVGURL: svgURL!) { (svgLayer) in
//            svgLayer.resizeToFit(flag?.image?.size)
//        }
//        self.view.addSubview(hammock)
    
//          flag.view?.addSubview(hammock)
        
//        flag.kf.setImage(with: URL(string: capitalData?.flag ?? ""))
        
//        let fistBump = UIView(SVGNamed: "fistbump")     // In the main bundle
//        flag.addSubview(fistBump)
        
//        var newImage = UIImageView()
//        newImage.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
//        newImage.backgroundColor = .orange
        
//                let svgURL = URL(string: capitalData?.flag ?? "")!
//                let view = UIView(SVGURL: svgURL) { (svgLayer) in
//                    svgLayer.resizeToFit(self.flag.bounds)
//                }
//                flag.addSubview(view)
        
//        flag.image = getSvgImgFnc(svgImjFileNameVar: capitalData?.flag ?? "https://openclipart.org/download/181651/manhammock.svg")
        
//        flagWebView.loadHTMLString("https://openclipart.org/download/181651/manhammock.svg", baseURL: URL(string: "https://openclipart.org/download/181651/manhammock.svg"))
        
        
//        print(capitalData?.flag)
    
//
//        flag.svgToView(urlString: capitalData?.flag ?? "https://openclipart.org/download/181651/manhammock.svg")
    
    }
}
    
//    func getSvgImgFnc(svgImjFileNameVar: String) -> UIImage
//    {
//        let svgURL = URL(string: svgImjFileNameVar)
//        let svgVyuVar = UIView(SVGURL: svgURL!)
//
//        /* The width, height and viewPort are set to 100
//
//         <svg xmlns="http://www.w3.org/2000/svg"
//         width="100%" height="100%"
//         viewBox="0 0 100 100">
//
//         So we need to set UIView Rect also same
//         */
//
//        svgVyuVar.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
////
//        return svgVyuVar.getImgFromVyuFnc()
////        self.flag?.image = flagImage
//    }
//

//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}

//extension UIView {
//    func svgToView(urlString: String) {
//    let svgURL = URL(string: urlString)!
//    let view = UIView(SVGURL: svgURL) { (svgLayer) in
//        svgLayer.resizeToFit(self.bounds)
//    }
//        self.addSubview(view)
//    }
//}



//extension UIView {

//    func svgToView(urlString: String) {
//        let fistBump = UIView(SVGNamed: "fistbump")     // In the main bundle
//        self.addSubview(fistBump)
//    }
//}
//
//let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
//let image = renderer.image { ctx in
//    view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
//}

//extension UIView
//{
//    func getImgFromVyuFnc() -> UIImage
//    {
//        UIGraphicsBeginImageContext(self.frame.size)
//
//        self.layer.render(in: UIGraphicsGetCurrentContext()!)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//
//        UIGraphicsEndImageContext()
//        return image!
//    }
//}

//extension String {
//    static func emojiFlag(for countryCode: String) -> String! {
//        var string = ""
//
//            for uS in countryCode.unicodeScalars {
//                return String((UnicodeScalar(127397 + uS.value) ?? "<#default value#>"))
//            }
//            return
//        }
//    }
//}
