//
//  BaseController.swift
//  baseapp
//
//  Created by Alex on 04/01/2022.
//

import Foundation
import UIKit
import JGProgressHUD
import SafariServices

class BaseController<T: BaseViewModel, U: AppNavigator>: UIViewController {
    
    // MARK: Propeties
    var viewModel: T
    let hud = JGProgressHUD.init(style: .dark)
    var navigator: U?
    
    init(viewModel: T,
         navigator: U? = nil) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
        self.navigator?.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    deinit {
        print("Deinit: " + String(describing: type(of: self)))
    }

    
    // MARK: App life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Kết nối navigation vào router
        bindUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: Functions
    
    /// Toàn bộ nội dung trong ViewModel muốn hiện thị
    /// phải được viết trong hàm BindUI
    ///
    /// - Parameters:
    ///     -
    ///     -
    ///     -
    func bindUI() {
        viewModel.isLoading
            .observeNext {[weak self] value in
                guard let strongSelf = self else { return }
                if value {
                    strongSelf.hud.show(in: strongSelf.view)
                } else {
                    strongSelf.hud.dismiss(animated: true)
                }
            }
            .dispose(in: bag)
    }
    
    /// Hiển thị quảng cáo reward hoặc quảng cáo full
    /// quảng cáo cung cấp bởi IronSources
    ///
    /// - Parameters:
    ///     - complete: Một closure escaping khi quảng cáo kết thúc
    ///
    ///
    func showAd(complete: @escaping () -> Void) {
        // Kiểm tra xem người dùng đã trả phí chưa
        if Payer.shared.isPurchased {
            complete()
        } else {
            // Kiểm tra xem quảng cáo reward có sẵn sàng không
            if isISRewardAvailble {
                // Hiển thị quảng cáo reward
                AdManager.shared.showRewardAd(from: self) {
                    complete()
                }
            } else {
                // Hiển thị quảng cáo full
                AdManager.shared.showFull(from: self) {
                    complete()
                }
            }
        }
    }
    
    /// Mở một url string thông qua SFSafariViewController
    ///
    ///
    /// - Parameters:
    ///     - link: một đường dẫn có kiểu dữ liệu String
    ///
    ///
    func openLink(link: String) {
        let urlString = link
        if let url = URL(string: urlString) {
            let safariViewController = SFSafariViewController(url: url)
            self.present(
                safariViewController,
                animated: true,
                completion: nil
            )
        }
    }
    
    
}
