
## Info.plist
Nếu muốn thêm quyền thì truy cập trang web sau:


```bash
https://www.iosdev.recipes/info-plist/permissions/
```
## Cài đặt dự án

Để bắt đầu phát triển ứng dụng, hãy vào Terminal và gõ lệnh sau để tải các thư viện cần thiết về dự án.

```bash
pod install
```


## Kiến trúc: MVVM

- Tham khảo tài liệu [Bond](https://github.com/DeclarativeHub/Bond)
- Dự án không sử dụng Storyboard. Chi tiết khởi tạo màn các màn hình có trong ví dụ.


## Một số ví dụ

- Khởi tạo một subController trong TabbarController
```
let homeVM = HomeViewModel()
let navigator = HomeNavigator.init()
let homeVC = HomeController(viewModel: homeVM, navigator: navigator)
homeVC.tabBarItem.image = R.image.icon_tabbar_home()
homeVC.tabBarItem.title = R.string.localizable.home().capitalized
```
- Khởi tạo 1 module (VM và VC) mới
```
let viewModel = HomeViewModel()
let navigator = HomeNavigator.init()
let controller = HomeController(viewModel: viewModel, navigator: navigator)
viewController?.navigationController?.pushViewController(controller, animated: true)
```
- Nếu ứng dụng có TabbarController. Trong appDelegate (didFinishLaunchingWithOptions)
```
// Khởi tạo với UITabbarController
let window = UIWindow(frame: UIScreen.main.bounds)
let tabbar = MainTabbar()
window.rootViewController = tabbar.tabbarController
window.makeKeyAndVisible()
self.window = window

```
- Nếu ứng dụng không có TabbarController
```
let window = UIWindow(frame: UIScreen.main.bounds)
let homeVM = HomeViewModel()
let homeVC = HomeController(viewModel: homeVM)
window.rootViewController = homeVC
window.makeKeyAndVisible()
self.window = window
```
# firestickapp
# Apple
# plantid9
