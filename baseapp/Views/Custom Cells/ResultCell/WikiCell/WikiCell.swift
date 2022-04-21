//
//  WikiCell.swift
//  baseapp
//
//  Created by Thanh Nguyên Trần on 13/04/2022.
//

import UIKit
import Tactile
import WebKit
import SnapKit
class WikiCell: UITableViewCell {
    @IBOutlet weak var wikiButton: UIButton!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var wikiContentView: UIView!
    
    var delegate: WKNavigationDelegate?
    var delegate2: WKUIDelegate?
    var webview = WKWebView()
    var urlString: String = ""
    
    var onTapWikiBtn: (()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        binding()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpWebView()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0 , bottom: 0, right: 0))
        
    }
    func binding(){
        wikiButton.tap { _ in
           self.onTapWikiBtn?()
        }
        
    }
    func setUpWebView() {
        if #available(iOS 14.0, *) {
            let configuration = WKWebViewConfiguration()
            let webview = WKWebView(frame: wikiContentView.bounds, configuration: configuration)
            self.webview = webview
        } else {
            // Fallback on earlier versions
        }
        
    }
    func loadWebView(urlString: String){
        log.debug("error load web \(urlString)", context: nil)
        let url = URL( string: urlString)
        
        guard let urlRequest = url else {
            log.debug("error load web mo url request \(url)", context: nil)
            return}

        webview.load(URLRequest(url: urlRequest))
        webview.uiDelegate = delegate2
        webview.navigationDelegate = delegate
        // Need add subview
        self.wikiContentView.addSubview(webview)
        //SnapKitConstrain
        webview.scrollView.isScrollEnabled = false
        webview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
