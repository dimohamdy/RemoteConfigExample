import Firebase

class LoginConfigManager {
    
    static let shared = LoginConfigManager()
    
    var config:LoginConfig? = nil
    
    func getData() {
        let remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.configSettings = RemoteConfigSettings(developerModeEnabled: false)
        //load default config from plist
        // you can convert json to plist from http://json2plist.sinaapp.com/
        remoteConfig.setDefaults(fromPlist: "login_screen")
        
        remoteConfig.fetch(withExpirationDuration: TimeInterval(10)) { (status, error) -> Void in
            if status == .success {
                
                print("Config fetched!")
                let confignString:String = remoteConfig["login_screen"].stringValue ?? ""
                let data = confignString.data(using: .utf8)
                do {
                    
                    let config = try JSONDecoder().decode(LoginConfig.self, from: data!)
                    
                    let encoder = JSONEncoder()
                    if let encoded = try? encoder.encode(config) {
                        let defaults = UserDefaults.standard
                        defaults.set(encoded, forKey: "login_screen")
                    }
                    self.config = config

                } catch {
                    print(error)
                }
                
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
        }
    }
    
}
